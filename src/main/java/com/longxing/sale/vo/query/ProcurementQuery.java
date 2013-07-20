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


public class ProcurementQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 采购ID */
	private java.lang.Long procurementId;
	/** 采购名称 */
	private java.lang.String procurementName;
	/** 产品ID */
	private java.lang.Long prodId;
	private String prodIdTxt;
	/** 采购日期 */
	private java.util.Date procurementDateBegin;
	private java.util.Date procurementDateEnd;
	/** 数量 */
	private java.lang.Integer amount;
	/** 剩余数量 */
	private java.lang.Integer remainedAmount;
	/** 单价 */
	private java.math.BigDecimal unitPrice;
	/** 运费 */
	private java.math.BigDecimal freightage;
	/** 卸费 */
	private java.math.BigDecimal loadFee;
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
	/** 创建人ID */
	private java.lang.Long createId;
	private String createIdTxt;

	public java.lang.Long getProcurementId() {
		return this.procurementId;
	}
	
	public void setProcurementId(java.lang.Long value) {
		this.procurementId = value;
	}
	
	public java.lang.String getProcurementName() {
		return this.procurementName;
	}
	
	public void setProcurementName(java.lang.String value) {
		this.procurementName = value;
	}
	
	
	public java.lang.Long getProdId() {
		return this.prodId;
	}
	
	public void setProdId(java.lang.Long value) {
		this.prodId = value;
	}
	
	public String getProdIdTxt() {
		return this.prodIdTxt;
	}
	
	public void setProdIdTxt(String value) {
		this.prodIdTxt = value;
	}
	
	public java.util.Date getProcurementDateBegin() {
		return this.procurementDateBegin;
	}
	
	public void setProcurementDateBegin(java.util.Date value) {
		this.procurementDateBegin = value;
	}	
	
	public java.util.Date getProcurementDateEnd() {
		return this.procurementDateEnd;
	}
	
	public void setProcurementDateEnd(java.util.Date value) {
		this.procurementDateEnd = value;
	}
	
	public java.lang.Integer getAmount() {
		return this.amount;
	}
	
	public void setAmount(java.lang.Integer value) {
		this.amount = value;
	}
	
	public java.lang.Integer getRemainedAmount() {
		return this.remainedAmount;
	}
	
	public void setRemainedAmount(java.lang.Integer value) {
		this.remainedAmount = value;
	}
	
	public java.math.BigDecimal getUnitPrice() {
		return this.unitPrice;
	}
	
	public void setUnitPrice(java.math.BigDecimal value) {
		this.unitPrice = value;
	}
	
	public java.math.BigDecimal getFreightage() {
		return this.freightage;
	}
	
	public void setFreightage(java.math.BigDecimal value) {
		this.freightage = value;
	}
	
	public java.math.BigDecimal getLoadFee() {
		return this.loadFee;
	}
	
	public void setLoadFee(java.math.BigDecimal value) {
		this.loadFee = value;
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
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

