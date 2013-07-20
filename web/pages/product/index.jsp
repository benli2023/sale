<%@page import="com.longxing.sale.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Product.TABLE_ALIAS%> 维护</title>
	<%@ include file="../../commons/opera-maskui-dialog-import.jsp" %>
	<link href="<c:url value="${ctx}/scripts/plugins/popup-input/popup-input.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${ctx}/scripts/plugins/popup-input/popup_selection.js"></script>
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
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=Product.ALIAS_TYPE_ID%></td>		
					<td>
						<yun:button-edit name="typeIdTxt" hiddenName="typeId" id="product_typeId" txtVal="${query.typeIdTxt}"  hiddenVal="${query.typeId}" width="130"  profileId="product"/> 
						
					</td>
					<td class="tdLabel"><%=Product.ALIAS_PROVIDER_ID%></td>		
					<td>
						<yun:button-edit name="providerIdTxt" hiddenName="providerId" id="product_providerId" txtVal="${query.providerIdTxt}"  hiddenVal="${query.providerId}" width="130"  profileId="product"/> 
						
					</td>
					<td class="tdLabel"><%=Product.ALIAS_PRODUCT_NAME%></td>		
					<td>
						<input value="${query.productName}" id="productName" name="productName" maxlength="128"  class=""/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_PRODCT_DESC%></td>		
					<td>
						<input value="${query.prodctDesc}" id="prodctDesc" name="prodctDesc" maxlength="128"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/product'"/>
			<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/product/new'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/product','items',document.forms.queryForm)"/>
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
				<th sortColumn="typeId" ><%=Product.ALIAS_TYPE_ID%></th>
				<th sortColumn="providerId" ><%=Product.ALIAS_PROVIDER_ID%></th>
				<th sortColumn="productName" ><%=Product.ALIAS_PRODUCT_NAME%></th>
				<th sortColumn="prodctDesc" ><%=Product.ALIAS_PRODCT_DESC%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.prodId}"></td>
				
				<td><c:out value='${item.typeIdTxt}'/>&nbsp;</td>
				<td><c:out value='${item.providerIdTxt}'/>&nbsp;</td>
				<td><c:out value='${item.productName}'/>&nbsp;</td>
				<td><c:out value='${item.prodctDesc}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/product/${item.prodId}">查看</a>&nbsp;&nbsp;
					<a href="${ctx}/product/${item.prodId}/edit">修改</a>&nbsp;&nbsp;
					<a href="${ctx}/product/${item.prodId}" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
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
	
	<script type="text/javascript">
	 var popupOption={
		 'product_typeId': {url:'${ctx}/producttype/query',title:'选择产品类型',textColumn:'name',valueColumn:'typeId'},
		 'product_providerId': {url:'${ctx}/provider/query',title:'选择供应商',textColumn:'provider',valueColumn:'providerId'}
	 };
	 PopupSelection.initOption(popupOption); 	
	</script>
	  <div id="dialog-modal" title="">
        <iframe frameborder="0" style="width:100%;height:99%;height:100%\9;" src="about:blank"></iframe>
    </div>
	
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
