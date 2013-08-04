<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="typeId" name="typeId" value="${producttype.typeId}"/>

	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=Producttype.ALIAS_NAME%>:
		</td>		
		<td>
		<form:input path="name" id="name" cssClass="text required" maxlength="64" />
		<font color='red' ><form:errors path="name"/></font>
		
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Producttype.ALIAS_CODE%>:
		</td>		
		<td>
		<form:input path="code" id="code" cssClass="text" maxlength="32" />
		<font color='red' ><form:errors path="code"/></font>
		
		</td>
	</tr>	
	
		