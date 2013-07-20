<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Transport.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="transport"  >
		<input type="button" value="返回列表" onclick="window.location='${ctx}/transport'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<input type="hidden" id="transportId" name="transportId" value="${transport.transportId}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=Transport.ALIAS_DRIVER%></td>	
				<td><c:out value='${transport.driver}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Transport.ALIAS_CAR_NUMBER%></td>	
				<td><c:out value='${transport.carNumber}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Transport.ALIAS_DRIVER_TEL%></td>	
				<td><c:out value='${transport.driverTel}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>