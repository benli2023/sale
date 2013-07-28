<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Producttype.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="producttype"  >
		<c:choose>
			<c:when test="${empty postmode}">
				<input type="button" value="返回列表" onclick="window.location='${ctx}/producttype'"/>
				<input type="button" value="后退" onclick="history.back();"/>
			</c:when>
			<c:otherwise>
				<input type="button" value="返回列表" onclick="window.location='${ctx}/producttype?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" value="关闭" onclick="window.close()"/>
			</c:otherwise>
		</c:choose>
		
		<input type="hidden" id="typeId" name="typeId" value="${producttype.typeId}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=Producttype.ALIAS_NAME%></td>	
				<td><c:out value='${producttype.name}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Producttype.ALIAS_CODE%></td>	
				<td><c:out value='${producttype.code}'/></td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>