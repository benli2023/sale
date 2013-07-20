/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2013
 */

package com.longxing.sale.dao;

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


import org.springframework.stereotype.Repository;


@Repository
public class ProcurementDao extends BaseIbatisDao<Procurement,java.lang.Long>{
	
	@Override
	public String getIbatisSqlMapNamespace() {
		return "Procurement";
	}
	
	public void saveOrUpdate(Procurement entity) {
		if(entity.getProcurementId() == null) 
			save(entity);
		else 
			update(entity);
	}
	
	public Page findPage(ProcurementQuery query) {
		return pageQuery("Procurement.findPage",query);
	}
	

}
