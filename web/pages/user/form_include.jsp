<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="userId" name="userId" value="${user.userId}"/>

	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=User.ALIAS_USER_NAME%>:
		</td>		
		<td>
		<form:input path="userName" id="userName" cssClass="text required validate-alphanum" maxlength="64" />
		<font color='red' ><form:errors path="userName"/></font>
		
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=User.ALIAS_PASSWORD%>:
		</td>		
		<td>
		<form:input path="password" id="password" cssClass="text required validate-alphanum" maxlength="128" />
		<font color='red' ><form:errors path="password"/></font>
		
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<span class="required">*</span><%=User.ALIAS_GROUP_LEVEL%>:
		</td>		
		<td>
		<form:input path="groupLevel" id="groupLevel" cssClass="text required validate-integer max-value-2147483647" maxlength="10" />
		<font color='red' ><form:errors path="groupLevel"/></font>
		
		</td>
	</tr>	
	
		