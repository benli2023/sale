<%@page import="com.longxing.sale.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Customer.TABLE_ALIAS%> 维护</title>
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
					<td class="tdLabel"><%=Customer.ALIAS_CUST_NAME%></td>		
					<td>
						<input value="${query.custName}" id="custName" name="custName" maxlength="64"  class="text "/>
					</td>
					<td class="tdLabel"><%=Customer.ALIAS_TELEPHONE%></td>		
					<td>
						<input value="${query.telephone}" id="telephone" name="telephone" maxlength="128"  class="text  validate-phone"/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<c:choose>
			<c:when test="${empty postmode}">
				<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/customer'"/>
				<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/customer/new'"/>
				<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/customer','items',document.forms.queryForm)"/>
			</c:when>
			<c:otherwise>
				<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/customer?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/customer/new?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/customer?postmode=<c:out value="${postmode}" />','items',document.forms.queryForm)"/>
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
				<th sortColumn="custName" ><%=Customer.ALIAS_CUST_NAME%></th>
				<th sortColumn="telephone" ><%=Customer.ALIAS_TELEPHONE%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.custId}"></td>
				
				<td><c:out value='${item.custName}'/>&nbsp;</td>
				<td><c:out value='${item.telephone}'/>&nbsp;</td>
				<td>
				<c:choose>
					<c:when test="${empty postmode}">
						<a href="${ctx}/customer/${item.custId}">查看</a>&nbsp;&nbsp;
						<a href="${ctx}/customer/${item.custId}/edit">修改</a>&nbsp;&nbsp;
						<a href="${ctx}/customer/${item.custId}" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
					</c:when>
					<c:otherwise >
						<a href="${ctx}/customer/${item.custId}?postmode=<c:out value="${postmode}" />">查看</a>&nbsp;&nbsp;
						<a href="${ctx}/customer/${item.custId}/edit?postmode=<c:out value="${postmode}" />">修改</a>&nbsp;&nbsp;
						<a href="${ctx}/customer/${item.custId}?postmode=<c:out value="${postmode}" />" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
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
