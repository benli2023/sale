
package com.longxing.sale.model.enums;

import java.util.LinkedHashMap;

import cn.org.rapid_framework.lang.enums.EnumBase;
import cn.org.rapid_framework.lang.enums.EnumBaseUtils;

public enum UnitEnum implements EnumBase<Integer>{
	TON(new Integer("1"),"吨"),
	BATCH(new Integer("2"),"批"),
	Unlimited(new Integer("-1"),"不限")
	;
	
	private final Integer code;
	private final String desc;
	UnitEnum(Integer code,String desc) {
		this.code = code;
		this.desc = desc;
	}
	
	public Integer getCode() {
		return code;
	}

	public String getDesc() {
		return desc;
	}

	public static UnitEnum getByCode(Integer code) {
		return EnumBaseUtils.getByCode(code, values());
	}
	
	public static UnitEnum getRequiredByCode(Integer code) throws IllegalArgumentException {
		return EnumBaseUtils.getRequiredByCode(code, values());
	}
	
	@SuppressWarnings("unchecked")
	public static LinkedHashMap<Integer, String> toMap() {
	    return EnumBaseUtils.toMap(values());
	}	
}
