<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.longxing.sale.model.*" %>
<%@page import="com.github.springrest.interceptor.UserSessionInterceptor" %>
<rapid:override name="head">
	<title><%=User.TABLE_ALIAS%>Logon</title>
</rapid:override>


<rapid:override name="content">
	<form:form method="post" action="${ctx}/user/logon" modelAttribute="userQuery">
		<input type="hidden" name="<%=UserSessionInterceptor.REQUES_URI_PARAM%>" value="<%=request.getParameter(UserSessionInterceptor.REQUES_URI_PARAM) %>"  />
		<p >
			<font color='red'> <form:errors /></font>
		</p>
		<tr>
			<td class="tdLabel"><%=User.ALIAS_USER_NAME%>:</td>
			<td><form:input path="userName" id="userName" cssClass=""
					maxlength="64" /> <font color='red'><form:errors
						path="userName" />
			</font></td>
		</tr>
		<tr>
			<td class="tdLabel"><%=User.ALIAS_PASSWORD%>:</td>
			<td><form:input path="password" id="password" cssClass=""
					maxlength="128" /> <font color='red'><form:errors
						path="password" />
			</font></td>
		</tr>
		<input id="submitButton" name="submitButton" type="submit" value="登录" />
	</form:form>
</rapid:override>

<%@ include file="base.jsp"%>