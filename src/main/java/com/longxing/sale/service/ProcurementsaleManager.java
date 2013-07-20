/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2013
 */

package com.longxing.sale.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

@Service
@Transactional
public class ProcurementsaleManager extends BaseManager<Procurementsale,java.lang.Long>{

	private ProcurementsaleDao procurementsaleDao;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void setProcurementsaleDao(ProcurementsaleDao dao) {
		this.procurementsaleDao = dao;
	}
	public EntityDao getEntityDao() {
		return this.procurementsaleDao;
	}
	
	@Transactional(readOnly=true)
	public Page findPage(ProcurementsaleQuery query) {
		return procurementsaleDao.findPage(query);
	}
	
}
