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


public class ProcurementsaleQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 销售记录ID */
	private java.lang.Long id;
	/** 采购ID */
	private java.lang.Long procurementId;
	/** 出售ID */
	private java.lang.Long saleId;
	/** 出售数量 */
	private java.lang.Integer amount;
	/** 出售单价 */
	private java.math.BigDecimal unitPrice;

	public java.lang.Long getId() {
		return this.id;
	}
	
	public void setId(java.lang.Long value) {
		this.id = value;
	}
	
	public java.lang.Long getProcurementId() {
		return this.procurementId;
	}
	
	public void setProcurementId(java.lang.Long value) {
		this.procurementId = value;
	}
	
	public java.lang.Long getSaleId() {
		return this.saleId;
	}
	
	public void setSaleId(java.lang.Long value) {
		this.saleId = value;
	}
	
	public java.lang.Integer getAmount() {
		return this.amount;
	}
	
	public void setAmount(java.lang.Integer value) {
		this.amount = value;
	}
	
	public java.math.BigDecimal getUnitPrice() {
		return this.unitPrice;
	}
	
	public void setUnitPrice(java.math.BigDecimal value) {
		this.unitPrice = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

