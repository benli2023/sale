/*
 * Powered By [rapid-framework]
 * Web Site: http://www.rapid-framework.org.cn
 * Google Code: http://code.google.com/p/rapid-framework/
 * Since 2008 - 2013
 */

package com.longxing.sale.model;

import javax.validation.constraints.*;
import org.hibernate.validator.constraints.*;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.github.springrest.base.JsonDateSerializer;

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


public class Procurementsale extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "Procurementsale";
	public static final String ALIAS_ID = "销售记录ID";
	public static final String ALIAS_PROCUREMENT_ID = "采购ID";
	public static final String ALIAS_SALE_ID = "出售ID";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
    /**
     * 销售记录ID       db_column: id 
     */ 	
	
	
	
	private java.lang.Long id;
	
	
    /**
     * 采购ID       db_column: procurementId 
     */ 	
	
	
	
	private java.lang.Long procurementId;
	
	
    /**
     * 出售ID       db_column: saleId 
     */ 	
	
	
	
	private java.lang.Long saleId;
	
	//columns END

	public Procurementsale(){
	}

	public Procurementsale(
		java.lang.Long id
	){
		this.id = id;
	}

	public void setId(java.lang.Long value) {
		this.id = value;
	}
	
	public java.lang.Long getId() {
		return this.id;
	}
	public void setProcurementId(java.lang.Long value) {
		this.procurementId = value;
	}
	
	public java.lang.Long getProcurementId() {
		return this.procurementId;
	}
	public void setSaleId(java.lang.Long value) {
		this.saleId = value;
	}
	
	public java.lang.Long getSaleId() {
		return this.saleId;
	}
	
	private Procurement procurement;
	
	public void setProcurement(Procurement procurement){
		this.procurement = procurement;
	}
	
	public Procurement getProcurement() {
		return procurement;
	}
	
	private Sale sale;
	
	public void setSale(Sale sale){
		this.sale = sale;
	}
	
	public Sale getSale() {
		return sale;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("ProcurementId",getProcurementId())
			.append("SaleId",getSaleId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Procurementsale == false) return false;
		if(this == obj) return true;
		Procurementsale other = (Procurementsale)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

