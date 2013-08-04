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


public class Transport extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "Transport";
	public static final String ALIAS_TRANSPORT_ID = "运输ID";
	public static final String ALIAS_DRIVER = "司机";
	public static final String ALIAS_CAR_NUMBER = "车牌号";
	public static final String ALIAS_DRIVER_TEL = "电话";
	
	//date formats
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 运输ID       db_column: transportId 
     */
     
	private java.lang.Long transportId;
	
    /**
     * 司机       db_column: driver 
     */
    @NotBlank  @JsonProperty("driver") @Length(max=64) 
	private java.lang.String driver;
	
    /**
     * 车牌号       db_column: carNumber 
     */
     @JsonProperty("carNumber") @Length(max=32) 
	private java.lang.String carNumber;
	
    /**
     * 电话       db_column: driverTel 
     */
    @NotBlank  @JsonProperty("driverTel") @Length(max=32) 
	private java.lang.String driverTel;
	
	//columns END

	public Transport(){
	}

	public Transport(
		java.lang.Long transportId
	){
		this.transportId = transportId;
	}

	public void setTransportId(java.lang.Long value) {
		this.transportId = value;
	}
	
	public java.lang.Long getTransportId() {
		return this.transportId;
	}
	public void setDriver(java.lang.String value) {
		this.driver = value;
	}
	
	public java.lang.String getDriver() {
		return this.driver;
	}
	public void setCarNumber(java.lang.String value) {
		this.carNumber = value;
	}
	
	public java.lang.String getCarNumber() {
		return this.carNumber;
	}
	public void setDriverTel(java.lang.String value) {
		this.driverTel = value;
	}
	
	public java.lang.String getDriverTel() {
		return this.driverTel;
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
			.append("TransportId",getTransportId())
			.append("Driver",getDriver())
			.append("CarNumber",getCarNumber())
			.append("DriverTel",getDriverTel())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getTransportId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Transport == false) return false;
		if(this == obj) return true;
		Transport other = (Transport)obj;
		return new EqualsBuilder()
			.append(getTransportId(),other.getTransportId())
			.isEquals();
	}
}

