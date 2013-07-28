/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2013
 */


package com.longxing.sale.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.scope.Flash;

import com.github.springrest.base.BaseRestSpringController;
import com.github.springrest.base.ColModelProfile;
import com.github.springrest.base.api.Response;
import com.github.springrest.util.AjaxHelper;
import com.github.springrest.util.ColModelFactory;
import com.longxing.sale.model.Product;
import com.longxing.sale.service.ProductManager;
import com.longxing.sale.vo.query.ProductQuery;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */

@Controller
@RequestMapping("/product")
public class ProductController extends BaseRestSpringController<Product,java.lang.Long>{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	private ProductManager productManager;
	private ColModelFactory colModelFactory;

	public void setColModelFactory(ColModelFactory colModelFactory) {
		this.colModelFactory = colModelFactory;
	}

	private AjaxHelper ajaxHelper;
	
	
	public void setAjaxHelper(AjaxHelper ajaxHelper) {
		this.ajaxHelper = ajaxHelper;
	}

	private final String LIST_ACTION = "redirect:/product";
	
	/** 
	 * 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写
	 **/
	public void setProductManager(ProductManager manager) {
		this.productManager = manager;
	}
	
	/** binder用于bean属性的设置 */
	@InitBinder  
	public void initBinder(WebDataBinder binder) {  
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));  
	}
	   
	/**
	 * 增加了@ModelAttribute的方法可以在本controller方法调用前执行,可以存放一些共享变量,如枚举值,或是一些初始化操作
	 */
	@ModelAttribute
	public void init(ModelMap model) {
		model.put("now", new java.sql.Timestamp(System.currentTimeMillis()));
	}
	
	/** 列表 */
	@RequestMapping
	public String index(ModelMap model,ProductQuery query,HttpServletRequest request,HttpServletResponse response) {
		Page page = this.productManager.findPage(query);
		
		model.addAllAttributes(toModelMap(page, query));
		return "/product/index";
	}

	@RequestMapping({ "/index.json" })
	@ResponseBody
	public Map indexJson(ModelMap model, ProductQuery query) {
		Page page = this.productManager.findPage(query);
		return jsonPagination(page);
	}

	@RequestMapping({ "/query" })
	public String query(ModelMap model, String fieldId,String profileId) throws Exception {
		model.addAttribute("fieldId", fieldId);
		model.addAttribute("jsonURL", "/product/index.json");
		model.addAttribute("jsonAddURL", "/product/new?postmode=ajax");
		model.addAttribute("pageTitle",Product.TABLE_ALIAS);
		ColModelProfile colModelProfile=colModelFactory.getColModel("Product-colmodel.xml",profileId);
		model.addAttribute("colModelList", colModelProfile.getColModels());
		return "/popup/table_window";
	}
	
	@RequestMapping({ "/save.json" })
	@ResponseBody
	public Response ajaxPost(ModelMap model, @Valid Product produc, BindingResult errors, HttpServletRequest request, HttpServletResponse response) throws Exception {
		return ajaxHelper.save(productManager, produc, errors, request, response);
	}
	
	/** 显示 */
	@RequestMapping(value="/{id}")
	public String show(ModelMap model,@PathVariable java.lang.Long id) throws Exception {
		Product product = productManager.getById(id);
		model.addAttribute("product",product);
		return "/product/show";
	}

	/** 进入新增 */
	@RequestMapping(value="/new")
	public String _new(ModelMap model,Product product,HttpServletRequest request,HttpServletResponse response) throws Exception {
		model.addAttribute("product",product);
		return "/product/new";
	}
	
	/** 保存新增,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult  */
	@RequestMapping(method=RequestMethod.POST)
	public String create(ModelMap model,@Valid Product product,BindingResult errors,HttpServletRequest request,HttpServletResponse response) throws Exception {
		if(errors.hasErrors()) {
			return  "/product/new";
		}
		
		productManager.save(product);
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/** 编辑 */
	@RequestMapping(value="/{id}/edit")
	public String edit(ModelMap model,@PathVariable java.lang.Long id) throws Exception {
		Product product = productManager.getById(id);
		model.addAttribute("product",product);
		return "/product/edit";
	}
	
	/** 保存更新,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult  */
	@RequestMapping(value="/{id}",method=RequestMethod.PUT)
	public String update(ModelMap model,@PathVariable java.lang.Long id,@Valid Product product,BindingResult errors,HttpServletRequest request,HttpServletResponse response) throws Exception {
		if(errors.hasErrors()) {
			return "/product/edit";
		}
		
		productManager.update(product);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	/** 删除 */
	@RequestMapping(value="/{id}",method=RequestMethod.DELETE)
	public String delete(ModelMap model,@PathVariable java.lang.Long id) {
		productManager.removeById(id);
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

	/** 批量删除 */
	@RequestMapping(method=RequestMethod.DELETE)
	public String batchDelete(ModelMap model,@RequestParam("items") java.lang.Long[] items) {
		for(int i = 0; i < items.length; i++) {
			productManager.removeById(items[i]);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}
	
}

