<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Customer.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="customer"  >
		<input type="button" value="返回列表" onclick="window.location='${ctx}/customer'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<input type="hidden" id="custId" name="custId" value="${customer.custId}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=Customer.ALIAS_CUST_NAME%></td>	
				<td><c:out value='${customer.custName}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Customer.ALIAS_TELEPHONE%></td>	
				<td><c:out value='${customer.telephone}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>