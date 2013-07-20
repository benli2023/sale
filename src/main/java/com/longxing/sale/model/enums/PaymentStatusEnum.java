
package com.longxing.sale.model.enums;

import java.util.LinkedHashMap;

import cn.org.rapid_framework.lang.enums.EnumBase;
import cn.org.rapid_framework.lang.enums.EnumBaseUtils;

public enum PaymentStatusEnum implements EnumBase<Integer>{
	DONE(new Integer("2"),"已付款"),
	NONE(new Integer("0"),"未付款"),
	PART(new Integer("1"),"已付定金"),
	Unlimited(new Integer("-1"),"不限")
	;
	
	private final Integer code;
	private final String desc;
	PaymentStatusEnum(Integer code,String desc) {
		this.code = code;
		this.desc = desc;
	}
	
	public Integer getCode() {
		return code;
	}

	public String getDesc() {
		return desc;
	}

	public static PaymentStatusEnum getByCode(Integer code) {
		return EnumBaseUtils.getByCode(code, values());
	}
	
	public static PaymentStatusEnum getRequiredByCode(Integer code) throws IllegalArgumentException {
		return EnumBaseUtils.getRequiredByCode(code, values());
	}
	
	@SuppressWarnings("unchecked")
	public static LinkedHashMap<Integer, String> toMap() {
	    return EnumBaseUtils.toMap(values());
	}	
}
