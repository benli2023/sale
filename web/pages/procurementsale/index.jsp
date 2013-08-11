<%@page import="com.longxing.sale.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Procurementsale.TABLE_ALIAS%> 维护</title>
	<script src="${ctx}/scripts/rest.js" ></script>
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" method="get" style="display: inline;">
	<c:if test="${!empty postmode}">
		<input type="hidden" name="postmode" value="${postmode}"/>
	</c:if>
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=Procurementsale.ALIAS_PROCUREMENT_ID%></td>		
					<td>
						<input value="${query.procurementId}" id="procurementId" name="procurementId" maxlength="19"  class="text  validate-integer"/>
					</td>
					<td class="tdLabel"><%=Procurementsale.ALIAS_SALE_ID%></td>		
					<td>
						<input value="${query.saleId}" id="saleId" name="saleId" maxlength="19"  class="text  validate-integer"/>
					</td>
					<td class="tdLabel"><%=Procurementsale.ALIAS_AMOUNT%></td>		
					<td>
						<input value="${query.amount}" id="amount" name="amount" maxlength="10"  class="text  validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=Procurementsale.ALIAS_UNIT_PRICE%></td>		
					<td>
						<input value="${query.unitPrice}" id="unitPrice" name="unitPrice" maxlength="10"  class="text  validate-currency-dollar"/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<c:choose>
			<c:when test="${empty postmode}">
				<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/procurementsale'"/>
				<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/procurementsale/new'"/>
				<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/procurementsale','items',document.forms.queryForm)"/>
			</c:when>
			<c:otherwise>
				<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/procurementsale?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/procurementsale/new?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/procurementsale?postmode=<c:out value="${postmode}" />','items',document.forms.queryForm)"/>
			</c:otherwise>
		</c:choose>
		<div>
	
	</div>
	
	<div class="gridTable">
	
		<simpletable:pageToolbar page="${page}">
		显示在这里是为了提示你如何自定义表头,可修改模板删除此行
		</simpletable:pageToolbar>
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="procurementId" ><%=Procurementsale.ALIAS_PROCUREMENT_ID%></th>
				<th sortColumn="saleId" ><%=Procurementsale.ALIAS_SALE_ID%></th>
				<th sortColumn="amount" ><%=Procurementsale.ALIAS_AMOUNT%></th>
				<th sortColumn="unitPrice" ><%=Procurementsale.ALIAS_UNIT_PRICE%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.id}"></td>
				
				<td><c:out value='${item.procurementId}'/>&nbsp;</td>
				<td><c:out value='${item.saleId}'/>&nbsp;</td>
				<td><c:out value='${item.amount}'/>&nbsp;</td>
				<td><fmt:formatNumber value='${item.unitPrice}' type="currency" pattern="###,##0.00;-###,##0.00"/></td>
				<td>
				<c:choose>
					<c:when test="${empty postmode}">
						<a href="${ctx}/procurementsale/${item.id}">查看</a>&nbsp;&nbsp;
						<a href="${ctx}/procurementsale/${item.id}/edit">修改</a>&nbsp;&nbsp;
						<a href="${ctx}/procurementsale/${item.id}" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
					</c:when>
					<c:otherwise >
						<a href="${ctx}/procurementsale/${item.id}?postmode=<c:out value="${postmode}" />">查看</a>&nbsp;&nbsp;
						<a href="${ctx}/procurementsale/${item.id}/edit?postmode=<c:out value="${postmode}" />">修改</a>&nbsp;&nbsp;
						<a href="${ctx}/procurementsale/${item.id}?postmode=<c:out value="${postmode}" />" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
					</c:otherwise>
				</c:choose>
					
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="${page}">
		显示在这里是为了提示你如何自定义表头,可修改模板删除此行
		</simpletable:pageToolbar>
	</div>
	</form>
	
	
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
