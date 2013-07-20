<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="id" name="id" value="${procurementsale.id}"/>

	<tr>	
		<td class="tdLabel">
			<%=Procurementsale.ALIAS_PROCUREMENT_ID%>:
		</td>		
		<td>
		<form:input path="procurementId" id="procurementId" cssClass="validate-integer " maxlength="19" />
		<font color='red'><form:errors path="procurementId"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurementsale.ALIAS_SALE_ID%>:
		</td>		
		<td>
		<form:input path="saleId" id="saleId" cssClass="validate-integer " maxlength="19" />
		<font color='red'><form:errors path="saleId"/></font>
		</td>
	</tr>	
	
		