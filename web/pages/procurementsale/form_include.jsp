<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="id" name="id" value="${procurementsale.id}"/>

	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=Procurementsale.ALIAS_PROCUREMENT_ID%>:
		</td>		
		<td>
		<form:input path="procurementId" id="procurementId" cssClass="text required validate-integer" maxlength="19" />
		<font color='red' ><form:errors path="procurementId"/></font>
		
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=Procurementsale.ALIAS_SALE_ID%>:
		</td>		
		<td>
		<form:input path="saleId" id="saleId" cssClass="text required validate-integer" maxlength="19" />
		<font color='red' ><form:errors path="saleId"/></font>
		
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=Procurementsale.ALIAS_AMOUNT%>:
		</td>		
		<td>
		<form:input path="amount" id="amount" cssClass="text required validate-integer max-value-2147483647" maxlength="10" />
		<font color='red' ><form:errors path="amount"/></font>
		
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=Procurementsale.ALIAS_UNIT_PRICE%>:
		</td>		
		<td>
		<form:input path="unitPrice" id="unitPrice" cssClass="text required validate-currency-dollar validate-number" maxlength="10" />
		<font color='red' ><form:errors path="unitPrice"/></font>
		
		</td>
	</tr>	
	
		