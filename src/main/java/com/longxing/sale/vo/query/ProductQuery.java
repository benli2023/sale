/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2013
 */

package com.longxing.sale.vo.query;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;

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


public class ProductQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 产品ID */
	private java.lang.Long prodId;
	/** 产品类型ID */
	private java.lang.Long typeId;
	private String typeIdTxt;
	/** 供应商ID */
	private java.lang.Long providerId;
	private String providerIdTxt;
	/** 产品名称 */
	private java.lang.String productName;
	/** 产品描述 */
	private java.lang.String prodctDesc;

	public java.lang.Long getProdId() {
		return this.prodId;
	}
	
	public void setProdId(java.lang.Long value) {
		this.prodId = value;
	}
	
	
	public java.lang.Long getTypeId() {
		return this.typeId;
	}
	
	public void setTypeId(java.lang.Long value) {
		this.typeId = value;
	}
	
	public String getTypeIdTxt() {
		return this.typeIdTxt;
	}
	
	public void setTypeIdTxt(String value) {
		this.typeIdTxt = value;
	}
	
	
	public java.lang.Long getProviderId() {
		return this.providerId;
	}
	
	public void setProviderId(java.lang.Long value) {
		this.providerId = value;
	}
	
	public String getProviderIdTxt() {
		return this.providerIdTxt;
	}
	
	public void setProviderIdTxt(String value) {
		this.providerIdTxt = value;
	}
	
	public java.lang.String getProductName() {
		return this.productName;
	}
	
	public void setProductName(java.lang.String value) {
		this.productName = value;
	}
	
	public java.lang.String getProdctDesc() {
		return this.prodctDesc;
	}
	
	public void setProdctDesc(java.lang.String value) {
		this.prodctDesc = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

