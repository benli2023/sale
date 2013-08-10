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


public class Sale extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "Sale";
	public static final String ALIAS_SALE_ID = "出售ID";
	public static final String ALIAS_CUST_ID = "客户ID";
	public static final String ALIAS_CUST_NAME = "客户名称";
	public static final String ALIAS_CUST_TEL = "客户电话";
	public static final String ALIAS_PAID = "已付金额";
	public static final String ALIAS_UN_PAID = "未付金额";
	public static final String ALIAS_OTHER_FEE = "其它费用";
	public static final String ALIAS_PROFIT = "利润";
	public static final String ALIAS_PAYMENT_STATUS = "状态";
	public static final String ALIAS_CREATE_ID = "创建人ID";
	public static final String ALIAS_TRANSPORT_ID = "运输ID";
	public static final String ALIAS_CAR_NUMBER = "车牌号";
	public static final String ALIAS_DRIVER = "司机";
	public static final String ALIAS_DRIVER_TEL = "司机电话";
	public static final String ALIAS_UPDATE_DATE = "更新时间";
	public static final String ALIAS_CREATED_DATE = "创建时间";
	public static final String ALIAS_UPDATE_ID = "更新人ID";
	
	//date formats
	public static final String FORMAT_UPDATE_DATE = DATE_FORMAT;
	public static final String FORMAT_CREATED_DATE = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * 出售ID       db_column: saleId 
     */
     
	private java.lang.Long saleId;
	
    @NotNull  
	private java.lang.Long custId;
	private String custIdTxt;
	
    /**
     * 客户名称       db_column: custName 
     */
    @NotBlank @Length(max=64)  
	private java.lang.String custName;
	
    /**
     * 客户电话       db_column: custTel 
     */
    @NotBlank @Length(max=128)  
	private java.lang.String custTel;
	
    /**
     * 已付金额       db_column: paid 
     */
    @NotNull  
	private java.math.BigDecimal paid;
	
    /**
     * 未付金额       db_column: unPaid 
     */
     
	private java.math.BigDecimal unPaid;
	
    /**
     * 其它费用       db_column: otherFee 
     */
     
	private java.math.BigDecimal otherFee;
	
    /**
     * 利润       db_column: profit 
     */
     
	private java.math.BigDecimal profit;
	
    /**
     * 状态       db_column: paymentStatus 
     */
    @NotNull  
	private java.lang.Integer paymentStatus;
	
	
     
	private java.lang.Long transportId;
	private String transportIdTxt;
	
    /**
     * 车牌号       db_column: carNumber 
     */
    @NotBlank @Length(max=32)  
	private java.lang.String carNumber;
	
    /**
     * 司机       db_column: driver 
     */
    @NotBlank @Length(max=64)  
	private java.lang.String driver;
	
    /**
     * 司机电话       db_column: driverTel 
     */
    @NotBlank @Length(max=32)  
	private java.lang.String driverTel;
	
	
	
	
	//columns END

	public Sale(){
	}

	public Sale(
		java.lang.Long saleId
	){
		this.saleId = saleId;
	}

	public void setSaleId(java.lang.Long value) {
		this.saleId = value;
	}
	
	public java.lang.Long getSaleId() {
		return this.saleId;
	}
	public void setCustId(java.lang.Long value) {
		this.custId = value;
	}
	
	public java.lang.Long getCustId() {
		return this.custId;
	}
	public String getCustIdTxt() {
		return this.custIdTxt;
	}
	
	public void setCustIdTxt(String value) {
		this.custIdTxt = value;
	}
	public void setCustName(java.lang.String value) {
		this.custName = value;
	}
	
	public java.lang.String getCustName() {
		return this.custName;
	}
	public void setCustTel(java.lang.String value) {
		this.custTel = value;
	}
	
	public java.lang.String getCustTel() {
		return this.custTel;
	}
	public void setPaid(java.math.BigDecimal value) {
		this.paid = value;
	}
	
	public java.math.BigDecimal getPaid() {
		return this.paid;
	}
	public void setUnPaid(java.math.BigDecimal value) {
		this.unPaid = value;
	}
	
	public java.math.BigDecimal getUnPaid() {
		return this.unPaid;
	}
	public void setOtherFee(java.math.BigDecimal value) {
		this.otherFee = value;
	}
	
	public java.math.BigDecimal getOtherFee() {
		return this.otherFee;
	}
	public void setProfit(java.math.BigDecimal value) {
		this.profit = value;
	}
	
	public java.math.BigDecimal getProfit() {
		return this.profit;
	}
	public void setPaymentStatus(java.lang.Integer value) {
		this.paymentStatus = value;
	}
	
	public java.lang.Integer getPaymentStatus() {
		return this.paymentStatus;
	}
	public void setTransportId(java.lang.Long value) {
		this.transportId = value;
	}
	
	public java.lang.Long getTransportId() {
		return this.transportId;
	}
	public String getTransportIdTxt() {
		return this.transportIdTxt;
	}
	
	public void setTransportIdTxt(String value) {
		this.transportIdTxt = value;
	}
	public void setCarNumber(java.lang.String value) {
		this.carNumber = value;
	}
	
	public java.lang.String getCarNumber() {
		return this.carNumber;
	}
	public void setDriver(java.lang.String value) {
		this.driver = value;
	}
	
	public java.lang.String getDriver() {
		return this.driver;
	}
	public void setDriverTel(java.lang.String value) {
		this.driverTel = value;
	}
	
	public java.lang.String getDriverTel() {
		return this.driverTel;
	}
	
	private Transport transport;
	
	public void setTransport(Transport transport){
		this.transport = transport;
	}
	
	public Transport getTransport() {
		return transport;
	}
	
	private Customer customer;
	
	public void setCustomer(Customer customer){
		this.customer = customer;
	}
	
	public Customer getCustomer() {
		return customer;
	}
	
	private User user;
	
	public void setUser(User user){
		this.user = user;
	}
	
	public User getUser() {
		return user;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("SaleId",getSaleId())
			.append("CustId",getCustId())
			.append("CustName",getCustName())
			.append("CustTel",getCustTel())
			.append("Paid",getPaid())
			.append("UnPaid",getUnPaid())
			.append("OtherFee",getOtherFee())
			.append("Profit",getProfit())
			.append("PaymentStatus",getPaymentStatus())
			.append("CreateId",getCreateId())
			.append("TransportId",getTransportId())
			.append("CarNumber",getCarNumber())
			.append("Driver",getDriver())
			.append("DriverTel",getDriverTel())
			.append("UpdateDate",getUpdateDate())
			.append("CreatedDate",getCreatedDate())
			.append("UpdateId",getUpdateId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getSaleId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Sale == false) return false;
		if(this == obj) return true;
		Sale other = (Sale)obj;
		return new EqualsBuilder()
			.append(getSaleId(),other.getSaleId())
			.isEquals();
	}
}

