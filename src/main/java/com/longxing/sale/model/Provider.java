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


public class Provider extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "Provider";
	public static final String ALIAS_PROVIDER_ID = "供应商ID";
	public static final String ALIAS_PROVIDER = "供应商名称";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
    /**
     * 供应商ID       db_column: providerId 
     */ 	
	
	
	
	private java.lang.Long providerId;
	
	
    /**
     * 供应商名称       db_column: provider 
     */ 	
	@Length(max=64)
	@JsonProperty("provider")
	
	private java.lang.String provider;
	
	//columns END

	public Provider(){
	}

	public Provider(
		java.lang.Long providerId
	){
		this.providerId = providerId;
	}

	public void setProviderId(java.lang.Long value) {
		this.providerId = value;
	}
	
	public java.lang.Long getProviderId() {
		return this.providerId;
	}
	public void setProvider(java.lang.String value) {
		this.provider = value;
	}
	
	public java.lang.String getProvider() {
		return this.provider;
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
			.append("ProviderId",getProviderId())
			.append("Provider",getProvider())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getProviderId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Provider == false) return false;
		if(this == obj) return true;
		Provider other = (Provider)obj;
		return new EqualsBuilder()
			.append(getProviderId(),other.getProviderId())
			.isEquals();
	}
}

