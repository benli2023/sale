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


public class SaleQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 出售ID */
	private java.lang.Long saleId;
	/** 客户ID */
	private java.lang.Long custId;
	private String custIdTxt;
	/** 数量 */
	private java.lang.Integer amount;
	/** 单位 */
	private java.lang.Integer unit=-1;
	/** 客户名称 */
	private java.lang.String custName;
	/** 客户电话 */
	private java.lang.String custTel;
	/** 售出单价 */
	private Long unitPrice;
	/** 已付金额 */
	private java.math.BigDecimal paid;
	/** 未付金额 */
	private java.math.BigDecimal unPaid;
	/** 其它费用 */
	private java.math.BigDecimal otherFee;
	/** 利润 */
	private java.math.BigDecimal profit;
	/** 状态 */
	private java.lang.Integer paymentStatus=-1;
	/** 创建人ID */
	private java.lang.Long createId;
	private String createIdTxt;
	/** 运输ID */
	private java.lang.Long transportId;
	private String transportIdTxt;
	/** 车牌号 */
	private java.lang.String carNumber;
	/** 司机 */
	private java.lang.String driver;
	/** 司机电话 */
	private java.lang.String driverTel;
	/** 更新时间 */
	private java.util.Date updateDateBegin;
	private java.util.Date updateDateEnd;
	/** 创建时间 */
	private java.util.Date createdDateBegin;
	private java.util.Date createdDateEnd;
	/** 更新人ID */
	private java.lang.Long updateId;
	private String updateIdTxt;

	public java.lang.Long getSaleId() {
		return this.saleId;
	}
	
	public void setSaleId(java.lang.Long value) {
		this.saleId = value;
	}
	
	
	public java.lang.Long getCustId() {
		return this.custId;
	}
	
	public void setCustId(java.lang.Long value) {
		this.custId = value;
	}
	
	public String getCustIdTxt() {
		return this.custIdTxt;
	}
	
	public void setCustIdTxt(String value) {
		this.custIdTxt = value;
	}
	
	public java.lang.Integer getAmount() {
		return this.amount;
	}
	
	public void setAmount(java.lang.Integer value) {
		this.amount = value;
	}
	
	public java.lang.Integer getUnit() {
		return this.unit;
	}
	
	public void setUnit(java.lang.Integer value) {
		this.unit = value;
	}
	
	public java.lang.String getCustName() {
		return this.custName;
	}
	
	public void setCustName(java.lang.String value) {
		this.custName = value;
	}
	
	public java.lang.String getCustTel() {
		return this.custTel;
	}
	
	public void setCustTel(java.lang.String value) {
		this.custTel = value;
	}
	
	public Long getUnitPrice() {
		return this.unitPrice;
	}
	
	public void setUnitPrice(Long value) {
		this.unitPrice = value;
	}
	
	public java.math.BigDecimal getPaid() {
		return this.paid;
	}
	
	public void setPaid(java.math.BigDecimal value) {
		this.paid = value;
	}
	
	public java.math.BigDecimal getUnPaid() {
		return this.unPaid;
	}
	
	public void setUnPaid(java.math.BigDecimal value) {
		this.unPaid = value;
	}
	
	public java.math.BigDecimal getOtherFee() {
		return this.otherFee;
	}
	
	public void setOtherFee(java.math.BigDecimal value) {
		this.otherFee = value;
	}
	
	public java.math.BigDecimal getProfit() {
		return this.profit;
	}
	
	public void setProfit(java.math.BigDecimal value) {
		this.profit = value;
	}
	
	public java.lang.Integer getPaymentStatus() {
		return this.paymentStatus;
	}
	
	public void setPaymentStatus(java.lang.Integer value) {
		this.paymentStatus = value;
	}
	
	
	public java.lang.Long getCreateId() {
		return this.createId;
	}
	
	public void setCreateId(java.lang.Long value) {
		this.createId = value;
	}
	
	public String getCreateIdTxt() {
		return this.createIdTxt;
	}
	
	public void setCreateIdTxt(String value) {
		this.createIdTxt = value;
	}
	
	
	public java.lang.Long getTransportId() {
		return this.transportId;
	}
	
	public void setTransportId(java.lang.Long value) {
		this.transportId = value;
	}
	
	public String getTransportIdTxt() {
		return this.transportIdTxt;
	}
	
	public void setTransportIdTxt(String value) {
		this.transportIdTxt = value;
	}
	
	public java.lang.String getCarNumber() {
		return this.carNumber;
	}
	
	public void setCarNumber(java.lang.String value) {
		this.carNumber = value;
	}
	
	public java.lang.String getDriver() {
		return this.driver;
	}
	
	public void setDriver(java.lang.String value) {
		this.driver = value;
	}
	
	public java.lang.String getDriverTel() {
		return this.driverTel;
	}
	
	public void setDriverTel(java.lang.String value) {
		this.driverTel = value;
	}
	
	public java.util.Date getUpdateDateBegin() {
		return this.updateDateBegin;
	}
	
	public void setUpdateDateBegin(java.util.Date value) {
		this.updateDateBegin = value;
	}	
	
	public java.util.Date getUpdateDateEnd() {
		return this.updateDateEnd;
	}
	
	public void setUpdateDateEnd(java.util.Date value) {
		this.updateDateEnd = value;
	}
	
	public java.util.Date getCreatedDateBegin() {
		return this.createdDateBegin;
	}
	
	public void setCreatedDateBegin(java.util.Date value) {
		this.createdDateBegin = value;
	}	
	
	public java.util.Date getCreatedDateEnd() {
		return this.createdDateEnd;
	}
	
	public void setCreatedDateEnd(java.util.Date value) {
		this.createdDateEnd = value;
	}
	
	
	public java.lang.Long getUpdateId() {
		return this.updateId;
	}
	
	public void setUpdateId(java.lang.Long value) {
		this.updateId = value;
	}
	
	public String getUpdateIdTxt() {
		return this.updateIdTxt;
	}
	
	public void setUpdateIdTxt(String value) {
		this.updateIdTxt = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

