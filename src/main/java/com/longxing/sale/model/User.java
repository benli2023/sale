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


public class User extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "User";
	public static final String ALIAS_USER_ID = "用户ID";
	public static final String ALIAS_USER_NAME = "用户名称";
	public static final String ALIAS_PASSWORD = "密码";
	public static final String ALIAS_GROUP_LEVEL = "所属用户组";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
    /**
     * 用户ID       db_column: userId 
     */ 	
	
	
	
	private java.lang.Long userId;
	
	
    /**
     * 用户名称       db_column: userName 
     */ 	
	@Length(max=64)
	@JsonProperty("userName")
	
	private java.lang.String userName;
	
	
    /**
     * 密码       db_column: password 
     */ 	
	@Length(max=128)
	
	
	private java.lang.String password;
	
	
    /**
     * 所属用户组       db_column: groupLevel 
     */ 	
	
	
	
	private java.lang.Integer groupLevel;
	
	//columns END

	public User(){
	}

	public User(
		java.lang.Long userId
	){
		this.userId = userId;
	}

	public void setUserId(java.lang.Long value) {
		this.userId = value;
	}
	
	public java.lang.Long getUserId() {
		return this.userId;
	}
	public void setUserName(java.lang.String value) {
		this.userName = value;
	}
	
	public java.lang.String getUserName() {
		return this.userName;
	}
	public void setPassword(java.lang.String value) {
		this.password = value;
	}
	
	public java.lang.String getPassword() {
		return this.password;
	}
	public void setGroupLevel(java.lang.Integer value) {
		this.groupLevel = value;
	}
	
	public java.lang.Integer getGroupLevel() {
		return this.groupLevel;
	}
	
	private Set procurements = new HashSet(0);
	public void setProcurements(Set<Procurement> procurement){
		this.procurements = procurement;
	}
	
	public Set<Procurement> getProcurements() {
		return procurements;
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
			.append("UserId",getUserId())
			.append("UserName",getUserName())
			.append("Password",getPassword())
			.append("GroupLevel",getGroupLevel())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getUserId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof User == false) return false;
		if(this == obj) return true;
		User other = (User)obj;
		return new EqualsBuilder()
			.append(getUserId(),other.getUserId())
			.isEquals();
	}
}

