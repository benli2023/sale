<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Procurement.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<form:form modelAttribute="procurement"  >
		<c:choose>
			<c:when test="${empty postmode}">
				<input type="button" value="返回列表" onclick="window.location='${ctx}/procurement'"/>
				<input type="button" value="后退" onclick="history.back();"/>
			</c:when>
			<c:otherwise>
				<input type="button" value="返回列表" onclick="window.location='${ctx}/procurement?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" value="关闭" onclick="window.close()"/>
			</c:otherwise>
		</c:choose>
		
		<input type="hidden" id="procurementId" name="procurementId" value="${procurement.procurementId}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_PROCUREMENT_NAME%></td>	
				<td><c:out value='${procurement.procurementName}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_PROD_ID%></td>	
				<td><c:out value='${procurement.prodIdTxt}'/>&nbsp;</td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_PROCUREMENT_DATE%></td>	
				<td><c:out value='${procurement.procurementDateString}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_AMOUNT%></td>	
				<td><c:out value='${procurement.amount}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_UNIT%></td>	
				<td><c:choose><c:when test="${procurement.unit==1}">吨</c:when><c:when test="${procurement.unit==2}">批</c:when></c:choose></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_REMAINED_AMOUNT%></td>	
				<td><c:out value='${procurement.remainedAmount}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_UNIT_PRICE%></td>	
				<td><c:out value='${procurement.unitPrice}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_FREIGHTAGE%></td>	
				<td><c:out value='${procurement.freightage}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_LOAD_FEE%></td>	
				<td><c:out value='${procurement.loadFee}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_CAR_NUMBER%></td>	
				<td><c:out value='${procurement.carNumber}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_DRIVER%></td>	
				<td><c:out value='${procurement.driver}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_DRIVER_TEL%></td>	
				<td><c:out value='${procurement.driverTel}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_UPDATE_DATE%></td>	
				<td><c:out value='${procurement.updateDateString}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_CREATED_DATE%></td>	
				<td><c:out value='${procurement.createdDateString}'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_UPDATE_ID%></td>	
				<td><c:out value='${procurement.updateIdTxt}'/>&nbsp;</td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_CREATE_ID%></td>	
				<td><c:out value='${procurement.createIdTxt}'/>&nbsp;</td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Procurement.ALIAS_TRANSPORT_ID%></td>	
				<td><c:out value='${procurement.transportIdTxt}'/>&nbsp;</td>
			</tr>
		</table>
	</form:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>