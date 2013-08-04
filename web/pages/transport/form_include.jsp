<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="transportId" name="transportId" value="${transport.transportId}"/>

	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=Transport.ALIAS_DRIVER%>:
		</td>		
		<td>
		<form:input path="driver" id="driver" cssClass="text required" maxlength="64" />
		<font color='red' ><form:errors path="driver"/></font>
		
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Transport.ALIAS_CAR_NUMBER%>:
		</td>		
		<td>
		<form:input path="carNumber" id="carNumber" cssClass="text" maxlength="32" />
		<font color='red' ><form:errors path="carNumber"/></font>
		
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=Transport.ALIAS_DRIVER_TEL%>:
		</td>		
		<td>
		<form:input path="driverTel" id="driverTel" cssClass="text required validate-mobile-phone" maxlength="32" />
		<font color='red' ><form:errors path="driverTel"/></font>
		
		</td>
	</tr>	
	
		