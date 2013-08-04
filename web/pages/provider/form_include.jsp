<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="providerId" name="providerId" value="${provider.providerId}"/>

	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=Provider.ALIAS_PROVIDER%>:
		</td>		
		<td>
		<form:input path="provider" id="provider" cssClass="text required" maxlength="64" />
		<font color='red' ><form:errors path="provider"/></font>
		
		</td>
	</tr>	
	
		