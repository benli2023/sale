<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Provider.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="provider"  >
		<input type="button" value="返回列表" onclick="window.location='${ctx}/provider'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<input type="hidden" id="providerId" name="providerId" value="${provider.providerId}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=Provider.ALIAS_PROVIDER%></td>	
				<td><c:out value='${provider.provider}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>