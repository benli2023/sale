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


public class Product extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "Product";
	public static final String ALIAS_PROD_ID = "产品ID";
	public static final String ALIAS_TYPE_ID = "产品类型ID";
	public static final String ALIAS_PROVIDER_ID = "供应商ID";
	public static final String ALIAS_PRODUCT_NAME = "产品名称";
	public static final String ALIAS_PRODCT_DESC = "产品描述";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 产品ID       db_column: prodId 
     */
     
	private java.lang.Long prodId;
	
    @NotNull  
	private java.lang.Long typeId;
	private String typeIdTxt;
	
    @NotNull  
	private java.lang.Long providerId;
	private String providerIdTxt;
	
    /**
     * 产品名称       db_column: productName 
     */
    @NotBlank  @JsonProperty("productName") @Length(max=128) 
	private java.lang.String productName;
	
    /**
     * 产品描述       db_column: prodctDesc 
     */
     @JsonProperty("prodctDesc") @Length(max=128) 
	private java.lang.String prodctDesc;
	
	//columns END

	public Product(){
	}

	public Product(
		java.lang.Long prodId
	){
		this.prodId = prodId;
	}

	public void setProdId(java.lang.Long value) {
		this.prodId = value;
	}
	
	public java.lang.Long getProdId() {
		return this.prodId;
	}
	public void setTypeId(java.lang.Long value) {
		this.typeId = value;
	}
	
	public java.lang.Long getTypeId() {
		return this.typeId;
	}
	public String getTypeIdTxt() {
		return this.typeIdTxt;
	}
	
	public void setTypeIdTxt(String value) {
		this.typeIdTxt = value;
	}
	public void setProviderId(java.lang.Long value) {
		this.providerId = value;
	}
	
	public java.lang.Long getProviderId() {
		return this.providerId;
	}
	public String getProviderIdTxt() {
		return this.providerIdTxt;
	}
	
	public void setProviderIdTxt(String value) {
		this.providerIdTxt = value;
	}
	public void setProductName(java.lang.String value) {
		this.productName = value;
	}
	
	public java.lang.String getProductName() {
		return this.productName;
	}
	public void setProdctDesc(java.lang.String value) {
		this.prodctDesc = value;
	}
	
	public java.lang.String getProdctDesc() {
		return this.prodctDesc;
	}
	
	private Set procurements = new HashSet(0);
	public void setProcurements(Set<Procurement> procurement){
		this.procurements = procurement;
	}
	
	public Set<Procurement> getProcurements() {
		return procurements;
	}
	
	private Provider provider;
	
	public void setProvider(Provider provider){
		this.provider = provider;
	}
	
	public Provider getProvider() {
		return provider;
	}
	
	private Producttype producttype;
	
	public void setProducttype(Producttype producttype){
		this.producttype = producttype;
	}
	
	public Producttype getProducttype() {
		return producttype;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("ProdId",getProdId())
			.append("TypeId",getTypeId())
			.append("ProviderId",getProviderId())
			.append("ProductName",getProductName())
			.append("ProdctDesc",getProdctDesc())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getProdId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Product == false) return false;
		if(this == obj) return true;
		Product other = (Product)obj;
		return new EqualsBuilder()
			.append(getProdId(),other.getProdId())
			.isEquals();
	}
}

