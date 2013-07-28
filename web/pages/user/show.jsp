<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=User.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="user"  >
		<c:choose>
			<c:when test="${empty postmode}">
				<input type="button" value="返回列表" onclick="window.location='${ctx}/user'"/>
				<input type="button" value="后退" onclick="history.back();"/>
			</c:when>
			<c:otherwise>
				<input type="button" value="返回列表" onclick="window.location='${ctx}/user?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" value="关闭" onclick="window.close()"/>
			</c:otherwise>
		</c:choose>
		
		<input type="hidden" id="userId" name="userId" value="${user.userId}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=User.ALIAS_USER_NAME%></td>	
				<td><c:out value='${user.userName}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=User.ALIAS_PASSWORD%></td>	
				<td><c:out value='${user.password}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=User.ALIAS_GROUP_LEVEL%></td>	
				<td><c:out value='${user.groupLevel}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>