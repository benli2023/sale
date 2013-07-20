<%@page import="com.longxing.sale.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Procurement.TABLE_ALIAS%> 维护</title>
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
					<td class="tdLabel"><%=Procurement.ALIAS_PROCUREMENT_NAME%></td>		
					<td>
						<input value="${query.procurementName}" id="procurementName" name="procurementName" maxlength="128"  class=""/>
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_PROD_ID%></td>		
					<td>
						<yun:button-edit name="prodIdTxt" hiddenName="prodId" id="procurement_prodId" txtVal="${query.prodIdTxt}"  hiddenVal="${query.prodId}" width="130"  profileId="procurement"/> 
						
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_PROCUREMENT_DATE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.procurementDateBegin}' pattern='<%=Procurement.FORMAT_PROCUREMENT_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=Procurement.FORMAT_PROCUREMENT_DATE%>'})" id="procurementDateBegin" name="procurementDateBegin"   />
						<input value="<fmt:formatDate value='${query.procurementDateEnd}' pattern='<%=Procurement.FORMAT_PROCUREMENT_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=Procurement.FORMAT_PROCUREMENT_DATE%>'})" id="procurementDateEnd" name="procurementDateEnd"   />
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_AMOUNT%></td>		
					<td>
						<input value="${query.amount}" id="amount" name="amount" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Procurement.ALIAS_REMAINED_AMOUNT%></td>		
					<td>
						<input value="${query.remainedAmount}" id="remainedAmount" name="remainedAmount" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_UNIT_PRICE%></td>		
					<td>
						<input value="${query.unitPrice}" id="unitPrice" name="unitPrice" maxlength="10"  class="validate-number "/>
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_FREIGHTAGE%></td>		
					<td>
						<input value="${query.freightage}" id="freightage" name="freightage" maxlength="10"  class="validate-number "/>
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_LOAD_FEE%></td>		
					<td>
						<input value="${query.loadFee}" id="loadFee" name="loadFee" maxlength="10"  class="validate-number "/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Procurement.ALIAS_CAR_NUMBER%></td>		
					<td>
						<input value="${query.carNumber}" id="carNumber" name="carNumber" maxlength="32"  class=""/>
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_DRIVER%></td>		
					<td>
						<input value="${query.driver}" id="driver" name="driver" maxlength="64"  class=""/>
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_DRIVER_TEL%></td>		
					<td>
						<input value="${query.driverTel}" id="driverTel" name="driverTel" maxlength="32"  class=""/>
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_UPDATE_DATE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.updateDateBegin}' pattern='<%=Procurement.FORMAT_UPDATE_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=Procurement.FORMAT_UPDATE_DATE%>'})" id="updateDateBegin" name="updateDateBegin"   />
						<input value="<fmt:formatDate value='${query.updateDateEnd}' pattern='<%=Procurement.FORMAT_UPDATE_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=Procurement.FORMAT_UPDATE_DATE%>'})" id="updateDateEnd" name="updateDateEnd"   />
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Procurement.ALIAS_CREATED_DATE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.createdDateBegin}' pattern='<%=Procurement.FORMAT_CREATED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=Procurement.FORMAT_CREATED_DATE%>'})" id="createdDateBegin" name="createdDateBegin"   />
						<input value="<fmt:formatDate value='${query.createdDateEnd}' pattern='<%=Procurement.FORMAT_CREATED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=Procurement.FORMAT_CREATED_DATE%>'})" id="createdDateEnd" name="createdDateEnd"   />
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_UPDATE_ID%></td>		
					<td>
						<yun:button-edit name="updateIdTxt" hiddenName="updateId" id="procurement_updateId" txtVal="${query.updateIdTxt}"  hiddenVal="${query.updateId}" width="130"  profileId="common"/> 
						
					</td>
					<td class="tdLabel"><%=Procurement.ALIAS_CREATE_ID%></td>		
					<td>
						<yun:button-edit name="createIdTxt" hiddenName="createId" id="procurement_createId" txtVal="${query.createIdTxt}"  hiddenVal="${query.createId}" width="130"  profileId="common"/> 
						
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/procurement'"/>
			<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/procurement/new'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/procurement','items',document.forms.queryForm)"/>
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
				<th sortColumn="procurementName" ><%=Procurement.ALIAS_PROCUREMENT_NAME%></th>
				<th sortColumn="prodId" ><%=Procurement.ALIAS_PROD_ID%></th>
				<th sortColumn="procurementDate" ><%=Procurement.ALIAS_PROCUREMENT_DATE%></th>
				<th sortColumn="amount" ><%=Procurement.ALIAS_AMOUNT%></th>
				<th sortColumn="remainedAmount" ><%=Procurement.ALIAS_REMAINED_AMOUNT%></th>
				<th sortColumn="unitPrice" ><%=Procurement.ALIAS_UNIT_PRICE%></th>
				<th sortColumn="freightage" ><%=Procurement.ALIAS_FREIGHTAGE%></th>
				<th sortColumn="loadFee" ><%=Procurement.ALIAS_LOAD_FEE%></th>
				<th sortColumn="carNumber" ><%=Procurement.ALIAS_CAR_NUMBER%></th>
				<th sortColumn="driver" ><%=Procurement.ALIAS_DRIVER%></th>
				<th sortColumn="driverTel" ><%=Procurement.ALIAS_DRIVER_TEL%></th>
				<th sortColumn="updateDate" ><%=Procurement.ALIAS_UPDATE_DATE%></th>
				<th sortColumn="createdDate" ><%=Procurement.ALIAS_CREATED_DATE%></th>
				<th sortColumn="updateId" ><%=Procurement.ALIAS_UPDATE_ID%></th>
				<th sortColumn="createId" ><%=Procurement.ALIAS_CREATE_ID%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.procurementId}"></td>
				
				<td><c:out value='${item.procurementName}'/>&nbsp;</td>
				<td><c:out value='${item.prodIdTxt}'/>&nbsp;</td>
				<td><c:out value='${item.procurementDateString}'/>&nbsp;</td>
				<td><c:out value='${item.amount}'/>&nbsp;</td>
				<td><c:out value='${item.remainedAmount}'/>&nbsp;</td>
				<td><c:out value='${item.unitPrice}'/>&nbsp;</td>
				<td><c:out value='${item.freightage}'/>&nbsp;</td>
				<td><c:out value='${item.loadFee}'/>&nbsp;</td>
				<td><c:out value='${item.carNumber}'/>&nbsp;</td>
				<td><c:out value='${item.driver}'/>&nbsp;</td>
				<td><c:out value='${item.driverTel}'/>&nbsp;</td>
				<td><c:out value='${item.updateDateString}'/>&nbsp;</td>
				<td><c:out value='${item.createdDateString}'/>&nbsp;</td>
				<td><c:out value='${item.updateIdTxt}'/>&nbsp;</td>
				<td><c:out value='${item.createIdTxt}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/procurement/${item.procurementId}">查看</a>&nbsp;&nbsp;
					<a href="${ctx}/procurement/${item.procurementId}/edit">修改</a>&nbsp;&nbsp;
					<a href="${ctx}/procurement/${item.procurementId}" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
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
		 'procurement_prodId': {url:'${ctx}/product/query',title:'选择产品',textColumn:'prodctDesc',valueColumn:'prodId'},
		 'procurement_updateId': {url:'${ctx}/user/query',title:'选择用户',textColumn:'userName',valueColumn:'userId'},
		 'procurement_createId': {url:'${ctx}/user/query',title:'选择用户',textColumn:'userName',valueColumn:'userId'}
	 };
	 PopupSelection.initOption(popupOption); 	
	</script>
	  <div id="dialog-modal" title="">
        <iframe frameborder="0" style="width:100%;height:99%;height:100%\9;" src="about:blank"></iframe>
    </div>
	
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
