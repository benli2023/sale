<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="custId" name="custId" value="${customer.custId}"/>

	<tr>	
		<td class="tdLabel">
			<%=Customer.ALIAS_CUST_NAME%>:
		</td>		
		<td>
		<form:input path="custName" id="custName" cssClass="" maxlength="64" />
		<font color='red'><form:errors path="custName"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Customer.ALIAS_TELEPHONE%>:
		</td>		
		<td>
		<form:input path="telephone" id="telephone" cssClass="" maxlength="128" />
		<font color='red'><form:errors path="telephone"/></font>
		</td>
	</tr>	
	
		