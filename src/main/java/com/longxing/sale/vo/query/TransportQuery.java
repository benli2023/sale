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


public class TransportQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 运输ID */
	private java.lang.Long transportId;
	/** 司机 */
	private java.lang.String driver;
	/** 车牌号 */
	private java.lang.String carNumber;
	/** 电话 */
	private java.lang.String driverTel;

	public java.lang.Long getTransportId() {
		return this.transportId;
	}
	
	public void setTransportId(java.lang.Long value) {
		this.transportId = value;
	}
	
	public java.lang.String getDriver() {
		return this.driver;
	}
	
	public void setDriver(java.lang.String value) {
		this.driver = value;
	}
	
	public java.lang.String getCarNumber() {
		return this.carNumber;
	}
	
	public void setCarNumber(java.lang.String value) {
		this.carNumber = value;
	}
	
	public java.lang.String getDriverTel() {
		return this.driverTel;
	}
	
	public void setDriverTel(java.lang.String value) {
		this.driverTel = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

