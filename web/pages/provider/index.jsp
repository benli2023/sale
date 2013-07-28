<%@page import="com.longxing.sale.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Provider.TABLE_ALIAS%> 维护</title>
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
					<td class="tdLabel"><%=Provider.ALIAS_PROVIDER%></td>		
					<td>
						<input value="${query.provider}" id="provider" name="provider" maxlength="64"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<c:choose>
			<c:when test="${empty postmode}">
				<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/provider'"/>
				<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/provider/new'"/>
				<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/provider','items',document.forms.queryForm)"/>
			</c:when>
			<c:otherwise>
				<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/provider?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/provider/new?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/provider?postmode=<c:out value="${postmode}" />','items',document.forms.queryForm)"/>
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
				<th sortColumn="provider" ><%=Provider.ALIAS_PROVIDER%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.providerId}"></td>
				
				<td><c:out value='${item.provider}'/>&nbsp;</td>
				<td>
				<c:choose>
					<c:when test="${empty postmode}">
						<a href="${ctx}/provider/${item.providerId}">查看</a>&nbsp;&nbsp;
						<a href="${ctx}/provider/${item.providerId}/edit">修改</a>&nbsp;&nbsp;
						<a href="${ctx}/provider/${item.providerId}" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
					</c:when>
					<c:otherwise >
						<a href="${ctx}/provider/${item.providerId}?postmode=<c:out value="${postmode}" />">查看</a>&nbsp;&nbsp;
						<a href="${ctx}/provider/${item.providerId}/edit?postmode=<c:out value="${postmode}" />">修改</a>&nbsp;&nbsp;
						<a href="${ctx}/provider/${item.providerId}?postmode=<c:out value="${postmode}" />" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
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
