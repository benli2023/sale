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


public class Producttype extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "Producttype";
	public static final String ALIAS_TYPE_ID = "产品类型ID";
	public static final String ALIAS_NAME = "产品类型名称";
	public static final String ALIAS_CODE = "产品类型编码";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 产品类型ID       db_column: typeId 
     */
     
	private java.lang.Long typeId;
	
    /**
     * 产品类型名称       db_column: name 
     */
    @NotBlank  @JsonProperty("name") @Length(max=64) 
	private java.lang.String name;
	
    /**
     * 产品类型编码       db_column: code 
     */
     @JsonProperty("code") @Length(max=32) 
	private java.lang.String code;
	
	//columns END

	public Producttype(){
	}

	public Producttype(
		java.lang.Long typeId
	){
		this.typeId = typeId;
	}

	public void setTypeId(java.lang.Long value) {
		this.typeId = value;
	}
	
	public java.lang.Long getTypeId() {
		return this.typeId;
	}
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	public void setCode(java.lang.String value) {
		this.code = value;
	}
	
	public java.lang.String getCode() {
		return this.code;
	}
	
	private Set products = new HashSet(0);
	public void setProducts(Set<Product> product){
		this.products = product;
	}
	
	public Set<Product> getProducts() {
		return products;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("TypeId",getTypeId())
			.append("Name",getName())
			.append("Code",getCode())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getTypeId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Producttype == false) return false;
		if(this == obj) return true;
		Producttype other = (Producttype)obj;
		return new EqualsBuilder()
			.append(getTypeId(),other.getTypeId())
			.isEquals();
	}
}

