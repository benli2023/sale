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


public class Customer extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "Customer";
	public static final String ALIAS_CUST_ID = "客户ID";
	public static final String ALIAS_CUST_NAME = "客户名称";
	public static final String ALIAS_TELEPHONE = "客户电话";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 客户ID       db_column: custId 
     */
     
	private java.lang.Long custId;
	
    /**
     * 客户名称       db_column: custName 
     */
    @NotBlank  @JsonProperty("custName") @Length(max=64) 
	private java.lang.String custName;
	
    /**
     * 客户电话       db_column: telephone 
     */
    @NotBlank  @JsonProperty("telephone") @Length(max=128) 
	private java.lang.String telephone;
	
	//columns END

	public Customer(){
	}

	public Customer(
		java.lang.Long custId
	){
		this.custId = custId;
	}

	public void setCustId(java.lang.Long value) {
		this.custId = value;
	}
	
	public java.lang.Long getCustId() {
		return this.custId;
	}
	public void setCustName(java.lang.String value) {
		this.custName = value;
	}
	
	public java.lang.String getCustName() {
		return this.custName;
	}
	public void setTelephone(java.lang.String value) {
		this.telephone = value;
	}
	
	public java.lang.String getTelephone() {
		return this.telephone;
	}
	
	private Set sales = new HashSet(0);
	public void setSales(Set<Sale> sale){
		this.sales = sale;
	}
	
	public Set<Sale> getSales() {
		return sales;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("CustId",getCustId())
			.append("CustName",getCustName())
			.append("Telephone",getTelephone())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getCustId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Customer == false) return false;
		if(this == obj) return true;
		Customer other = (Customer)obj;
		return new EqualsBuilder()
			.append(getCustId(),other.getCustId())
			.isEquals();
	}
}

