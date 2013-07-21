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


public class Procurement extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "Procurement";
	public static final String ALIAS_PROCUREMENT_ID = "采购ID";
	public static final String ALIAS_PROCUREMENT_NAME = "采购名称";
	public static final String ALIAS_PROD_ID = "产品ID";
	public static final String ALIAS_PROCUREMENT_DATE = "采购日期";
	public static final String ALIAS_AMOUNT = "数量";
	public static final String ALIAS_REMAINED_AMOUNT = "剩余数量";
	public static final String ALIAS_UNIT_PRICE = "单价";
	public static final String ALIAS_FREIGHTAGE = "运费";
	public static final String ALIAS_LOAD_FEE = "卸费";
	public static final String ALIAS_CAR_NUMBER = "车牌号";
	public static final String ALIAS_DRIVER = "司机";
	public static final String ALIAS_DRIVER_TEL = "司机电话";
	public static final String ALIAS_UPDATE_DATE = "更新时间";
	public static final String ALIAS_CREATED_DATE = "创建时间";
	public static final String ALIAS_UPDATE_ID = "更新人ID";
	public static final String ALIAS_CREATE_ID = "创建人ID";
	public static final String ALIAS_TRANSPORT_ID = "运输ID";
	
	//date formats
	public static final String FORMAT_PROCUREMENT_DATE = DATE_FORMAT;
	public static final String FORMAT_UPDATE_DATE = DATE_FORMAT;
	public static final String FORMAT_CREATED_DATE = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	
    /**
     * 采购ID       db_column: procurementId 
     */ 	
	
	
	
	private java.lang.Long procurementId;
	
	
    /**
     * 采购名称       db_column: procurementName 
     */ 	
	@Length(max=128)
	
	
	private java.lang.String procurementName;
	
	
	private java.lang.Long prodId;
	private String prodIdTxt;
	
	
    /**
     * 采购日期       db_column: procurementDate 
     */ 	
	
	
	@JsonSerialize(using = JsonDateSerializer.class)
	private java.util.Date procurementDate;
	
	
    /**
     * 数量       db_column: amount 
     */ 	
	
	
	
	private java.lang.Integer amount;
	
	
    /**
     * 剩余数量       db_column: remainedAmount 
     */ 	
	
	
	
	private java.lang.Integer remainedAmount;
	
	
    /**
     * 单价       db_column: unitPrice 
     */ 	
	
	
	
	private java.math.BigDecimal unitPrice;
	
	
    /**
     * 运费       db_column: freightage 
     */ 	
	
	
	
	private java.math.BigDecimal freightage;
	
	
    /**
     * 卸费       db_column: loadFee 
     */ 	
	
	
	
	private java.math.BigDecimal loadFee;
	
	
    /**
     * 车牌号       db_column: carNumber 
     */ 	
	@Length(max=32)
	
	
	private java.lang.String carNumber;
	
	
    /**
     * 司机       db_column: driver 
     */ 	
	@Length(max=64)
	
	
	private java.lang.String driver;
	
	
    /**
     * 司机电话       db_column: driverTel 
     */ 	
	@Length(max=32)
	
	
	private java.lang.String driverTel;
	
	
    /**
     * 更新时间       db_column: updateDate 
     */ 	
	
	
	@JsonSerialize(using = JsonDateSerializer.class)
	private java.util.Date updateDate;
	
	
    /**
     * 创建时间       db_column: createdDate 
     */ 	
	
	
	@JsonSerialize(using = JsonDateSerializer.class)
	private java.util.Date createdDate;
	
	
	private java.lang.Long updateId;
	private String updateIdTxt;
	
	
	private java.lang.Long createId;
	private String createIdTxt;
	
	
	private java.lang.Long transportId;
	private String transportIdTxt;
	
	//columns END

	public Procurement(){
	}

	public Procurement(
		java.lang.Long procurementId
	){
		this.procurementId = procurementId;
	}

	public void setProcurementId(java.lang.Long value) {
		this.procurementId = value;
	}
	
	public java.lang.Long getProcurementId() {
		return this.procurementId;
	}
	public void setProcurementName(java.lang.String value) {
		this.procurementName = value;
	}
	
	public java.lang.String getProcurementName() {
		return this.procurementName;
	}
	public void setProdId(java.lang.Long value) {
		this.prodId = value;
	}
	
	public java.lang.Long getProdId() {
		return this.prodId;
	}
	public String getProdIdTxt() {
		return this.prodIdTxt;
	}
	
	public void setProdIdTxt(String value) {
		this.prodIdTxt = value;
	}
	public String getProcurementDateString() {
		return DateConvertUtils.format(getProcurementDate(), FORMAT_PROCUREMENT_DATE);
	}
	public void setProcurementDateString(String value) {
		setProcurementDate(DateConvertUtils.parse(value, FORMAT_PROCUREMENT_DATE,java.util.Date.class));
	}
	
	public void setProcurementDate(java.util.Date value) {
		this.procurementDate = value;
	}
	
	public java.util.Date getProcurementDate() {
		return this.procurementDate;
	}
	public void setAmount(java.lang.Integer value) {
		this.amount = value;
	}
	
	public java.lang.Integer getAmount() {
		return this.amount;
	}
	public void setRemainedAmount(java.lang.Integer value) {
		this.remainedAmount = value;
	}
	
	public java.lang.Integer getRemainedAmount() {
		return this.remainedAmount;
	}
	public void setUnitPrice(java.math.BigDecimal value) {
		this.unitPrice = value;
	}
	
	public java.math.BigDecimal getUnitPrice() {
		return this.unitPrice;
	}
	public void setFreightage(java.math.BigDecimal value) {
		this.freightage = value;
	}
	
	public java.math.BigDecimal getFreightage() {
		return this.freightage;
	}
	public void setLoadFee(java.math.BigDecimal value) {
		this.loadFee = value;
	}
	
	public java.math.BigDecimal getLoadFee() {
		return this.loadFee;
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
	public String getUpdateDateString() {
		return DateConvertUtils.format(getUpdateDate(), FORMAT_UPDATE_DATE);
	}
	public void setUpdateDateString(String value) {
		setUpdateDate(DateConvertUtils.parse(value, FORMAT_UPDATE_DATE,java.util.Date.class));
	}
	
	public void setUpdateDate(java.util.Date value) {
		this.updateDate = value;
	}
	
	public java.util.Date getUpdateDate() {
		return this.updateDate;
	}
	public String getCreatedDateString() {
		return DateConvertUtils.format(getCreatedDate(), FORMAT_CREATED_DATE);
	}
	public void setCreatedDateString(String value) {
		setCreatedDate(DateConvertUtils.parse(value, FORMAT_CREATED_DATE,java.util.Date.class));
	}
	
	public void setCreatedDate(java.util.Date value) {
		this.createdDate = value;
	}
	
	public java.util.Date getCreatedDate() {
		return this.createdDate;
	}
	public void setUpdateId(java.lang.Long value) {
		this.updateId = value;
	}
	
	public java.lang.Long getUpdateId() {
		return this.updateId;
	}
	public String getUpdateIdTxt() {
		return this.updateIdTxt;
	}
	
	public void setUpdateIdTxt(String value) {
		this.updateIdTxt = value;
	}
	public void setCreateId(java.lang.Long value) {
		this.createId = value;
	}
	
	public java.lang.Long getCreateId() {
		return this.createId;
	}
	public String getCreateIdTxt() {
		return this.createIdTxt;
	}
	
	public void setCreateIdTxt(String value) {
		this.createIdTxt = value;
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
	
	private Set procurementsales = new HashSet(0);
	public void setProcurementsales(Set<Procurementsale> procurementsale){
		this.procurementsales = procurementsale;
	}
	
	public Set<Procurementsale> getProcurementsales() {
		return procurementsales;
	}
	
	private Product product;
	
	public void setProduct(Product product){
		this.product = product;
	}
	
	public Product getProduct() {
		return product;
	}
	
	private Transport transport;
	
	public void setTransport(Transport transport){
		this.transport = transport;
	}
	
	public Transport getTransport() {
		return transport;
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
			.append("ProcurementId",getProcurementId())
			.append("ProcurementName",getProcurementName())
			.append("ProdId",getProdId())
			.append("ProcurementDate",getProcurementDate())
			.append("Amount",getAmount())
			.append("RemainedAmount",getRemainedAmount())
			.append("UnitPrice",getUnitPrice())
			.append("Freightage",getFreightage())
			.append("LoadFee",getLoadFee())
			.append("CarNumber",getCarNumber())
			.append("Driver",getDriver())
			.append("DriverTel",getDriverTel())
			.append("UpdateDate",getUpdateDate())
			.append("CreatedDate",getCreatedDate())
			.append("UpdateId",getUpdateId())
			.append("CreateId",getCreateId())
			.append("TransportId",getTransportId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getProcurementId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Procurement == false) return false;
		if(this == obj) return true;
		Procurement other = (Procurement)obj;
		return new EqualsBuilder()
			.append(getProcurementId(),other.getProcurementId())
			.isEquals();
	}
}

