/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2013
 */


package com.longxing.sale.controller;

import java.util.List;
import java.util.Map;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.springrest.base.BaseRestSpringController;
import com.github.springrest.base.Context;
import com.github.springrest.base.DefaultWorkContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.github.springrest.base.ColModelProfile;
import com.github.springrest.base.api.Response;
import com.github.springrest.util.AjaxHelper;
import com.github.springrest.util.ColModelFactory;
import com.longxing.sale.model.Producttype;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.scope.Flash;

import java.util.*;

import com.github.springrest.base.*;
import com.github.springrest.util.*;
import org.codehaus.jackson.annotate.*;
import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.longxing.sale.model.*;
import com.longxing.sale.dao.*;
import com.longxing.sale.service.*;
import com.longxing.sale.vo.query.*;

/**
 * @author badqiu email:badqiu(a)gmail.com
 * @version 1.0
 * @since 1.0
 */

@Controller
@RequestMapping("/user")
public class UserController extends BaseRestSpringController<User,java.lang.Long>{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	private UserManager userManager;
	private ColModelFactory colModelFactory;

	public void setColModelFactory(ColModelFactory colModelFactory) {
		this.colModelFactory = colModelFactory;
	}
	
	private AjaxHelper ajaxHelper;

	public void setAjaxHelper(AjaxHelper ajaxHelper) {
		this.ajaxHelper = ajaxHelper;
	}
	
	private final String LIST_ACTION = "redirect:/user";
	
	/** 
	 * 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写
	 **/
	public void setUserManager(UserManager manager) {
		this.userManager = manager;
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
	public String index(ModelMap model,UserQuery query,HttpServletRequest request,HttpServletResponse response) {
		Page page = this.userManager.findPage(query);
		model.addAllAttributes(toModelMap(page, query));
		return "/user/index";
	}

	@RequestMapping({ "/index.json" })
	@ResponseBody
	public Map indexJson(ModelMap model, UserQuery query) {
		Page page = this.userManager.findPage(query);
		return jsonPagination(page);
	}

	@RequestMapping({ "/query" })
	public String query(ModelMap model, String fieldId,String profileId) throws Exception {
		model.addAttribute("fieldId", fieldId);
		model.addAttribute("jsonURL", "/user/index.json");
		model.addAttribute("jsonAddURL", "/user/new?postmode=ajax");
		model.addAttribute("pageTitle",User.TABLE_ALIAS);
		ColModelProfile colModelProfile=colModelFactory.getColModel("User-colmodel.xml",profileId);
		model.addAttribute("colModelList", colModelProfile.getColModels());
		return "/popup/table_window";
	}
	
	@RequestMapping({"/save.json"})
	@ResponseBody
	public Response ajaxSave(ModelMap model, @Valid User user, BindingResult errors, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Context context = new DefaultWorkContext(request, response);
		return ajaxHelper.save(this.userManager, user, errors, context);
	}
	
	@RequestMapping({"/update.json"})
	@ResponseBody
	public Response ajaxUpdate(ModelMap model, @Valid User user, BindingResult errors, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Context context = new DefaultWorkContext(request, response);
		return ajaxHelper.update(this.userManager, user, errors,context);
	}
	
	/** 显示 */
	@RequestMapping(value="/{id}")
	public String show(ModelMap model,@PathVariable java.lang.Long id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Context context = new DefaultWorkContext(request, response);
		User user = (User)userManager.getById(context,id);
		model.addAttribute("user",user);
		return "/user/show";
	}

	/** 进入新增 */
	@RequestMapping(value="/new")
	public String _new(ModelMap model,User user,HttpServletRequest request,HttpServletResponse response) throws Exception {
		model.addAttribute("user",user);
		return "/user/new";
	}
	
	/** 保存新增,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult  */
	@RequestMapping(method=RequestMethod.POST)
	public String create(ModelMap model,@Valid User user,BindingResult errors,HttpServletRequest request,HttpServletResponse response) throws Exception {
		if(errors.hasErrors()) {
			return  "/user/new";
		}
		Context context = new DefaultWorkContext(request, response);
		userManager.save(context,user);
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/** 编辑 */
	@RequestMapping(value="/{id}/edit")
	public String edit(ModelMap model,@PathVariable java.lang.Long id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Context context = new DefaultWorkContext(request, response);
		User user = (User)userManager.getById(context,id);
		model.addAttribute("user",user);
		return "/user/edit";
	}
	
	/** 保存更新,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult  */
	@RequestMapping(value="/{id}",method=RequestMethod.PUT)
	public String update(ModelMap model,@PathVariable java.lang.Long id,@Valid User user,BindingResult errors,HttpServletRequest request,HttpServletResponse response) throws Exception {
		if(errors.hasErrors()) {
			return "/user/edit";
		}
		Context context = new DefaultWorkContext(request, response);
		userManager.update(context,user);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	/** 删除 */
	@RequestMapping(value="/{id}",method=RequestMethod.DELETE)
	public String delete(ModelMap model,@PathVariable java.lang.Long id, HttpServletRequest request, HttpServletResponse response) {
		Context context = new DefaultWorkContext(request, response);
		userManager.removeById(context,id);
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

	/** 批量删除 */
	@RequestMapping(method=RequestMethod.DELETE)
	public String batchDelete(ModelMap model,@RequestParam("items") java.lang.Long[] items, HttpServletRequest request, HttpServletResponse response) {
		Context context = new DefaultWorkContext(request, response);
		for(int i = 0; i < items.length; i++) {
			userManager.removeById(context,items[i]);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}
	
}

