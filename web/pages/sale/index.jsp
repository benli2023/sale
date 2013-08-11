<%@page import="com.longxing.sale.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Sale.TABLE_ALIAS%> 维护</title>
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
	<c:if test="${!empty postmode}">
		<input type="hidden" name="postmode" value="${postmode}"/>
	</c:if>
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=Sale.ALIAS_CUST_ID%></td>		
					<td>
						<yun:button-edit name="custIdTxt" hiddenName="custId" id="sale_custId" txtVal="${query.custIdTxt}"  hiddenVal="${query.custId}" width="130"  profileId="sale"/> 
						
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_CUST_NAME%></td>		
					<td>
						<input value="${query.custName}" id="custName" name="custName" maxlength="64"  class="text "/>
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_CUST_TEL%></td>		
					<td>
						<input value="${query.custTel}" id="custTel" name="custTel" maxlength="128"  class="text  validate-mobile-phone"/>
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_PAID%></td>		
					<td>
						<input value="${query.paid}" id="paid" name="paid" maxlength="10"  class="text  validate-currency-dollar"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Sale.ALIAS_UN_PAID%></td>		
					<td>
						<input value="${query.unPaid}" id="unPaid" name="unPaid" maxlength="10"  class="text  validate-currency-dollar"/>
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_OTHER_FEE%></td>		
					<td>
						<input value="${query.otherFee}" id="otherFee" name="otherFee" maxlength="10"  class="text  validate-currency-dollar"/>
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_PROFIT%></td>		
					<td>
						<input value="${query.profit}" id="profit" name="profit" maxlength="10"  class="text  validate-currency-dollar"/>
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_PAYMENT_STATUS%></td>		
					<td>
						<select name="paymentStatus">
							<option value="2" <c:if test="${query.paymentStatus==2}">selected</c:if>>已付款</option>
							<option value="0" <c:if test="${query.paymentStatus==0}">selected</c:if>>未付款</option>
							<option value="1" <c:if test="${query.paymentStatus==1}">selected</c:if>>已付定金</option>
							<option value="-1" <c:if test="${query.paymentStatus==-1}">selected</c:if>>不限</option>
						</select>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Sale.ALIAS_CREATE_ID%></td>		
					<td>
						<yun:button-edit name="createIdTxt" hiddenName="createId" id="sale_createId" txtVal="${query.createIdTxt}"  hiddenVal="${query.createId}" width="130"  profileId="common"/> 
						
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_TRANSPORT_ID%></td>		
					<td>
						<yun:button-edit name="transportIdTxt" hiddenName="transportId" id="sale_transportId" txtVal="${query.transportIdTxt}"  hiddenVal="${query.transportId}" width="130"  profileId="common"/> 
						
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_CAR_NUMBER%></td>		
					<td>
						<input value="${query.carNumber}" id="carNumber" name="carNumber" maxlength="32"  class="text  validate-alphanum"/>
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_DRIVER%></td>		
					<td>
						<input value="${query.driver}" id="driver" name="driver" maxlength="64"  class="text "/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Sale.ALIAS_DRIVER_TEL%></td>		
					<td>
						<input value="${query.driverTel}" id="driverTel" name="driverTel" maxlength="32"  class="text  validate-mobile-phone"/>
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_UPDATE_DATE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.updateDateBegin}' pattern='<%=Sale.FORMAT_UPDATE_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=Sale.FORMAT_UPDATE_DATE%>'})" id="updateDateBegin" name="updateDateBegin"   class="text"/>
						<input value="<fmt:formatDate value='${query.updateDateEnd}' pattern='<%=Sale.FORMAT_UPDATE_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=Sale.FORMAT_UPDATE_DATE%>'})" id="updateDateEnd" name="updateDateEnd"   class="text"/>
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_CREATED_DATE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.createdDateBegin}' pattern='<%=Sale.FORMAT_CREATED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=Sale.FORMAT_CREATED_DATE%>'})" id="createdDateBegin" name="createdDateBegin"   class="text"/>
						<input value="<fmt:formatDate value='${query.createdDateEnd}' pattern='<%=Sale.FORMAT_CREATED_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=Sale.FORMAT_CREATED_DATE%>'})" id="createdDateEnd" name="createdDateEnd"   class="text"/>
					</td>
					<td class="tdLabel"><%=Sale.ALIAS_UPDATE_ID%></td>		
					<td>
						<yun:button-edit name="updateIdTxt" hiddenName="updateId" id="sale_updateId" txtVal="${query.updateIdTxt}"  hiddenVal="${query.updateId}" width="130"  profileId="common"/> 
						
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<c:choose>
			<c:when test="${empty postmode}">
				<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/sale'"/>
				<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/sale/new'"/>
				<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/sale','items',document.forms.queryForm)"/>
			</c:when>
			<c:otherwise>
				<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/sale?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/sale/new?postmode=<c:out value="${postmode}" />'"/>
				<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/sale?postmode=<c:out value="${postmode}" />','items',document.forms.queryForm)"/>
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
				<th sortColumn="custId" ><%=Sale.ALIAS_CUST_ID%></th>
				<th sortColumn="custName" ><%=Sale.ALIAS_CUST_NAME%></th>
				<th sortColumn="custTel" ><%=Sale.ALIAS_CUST_TEL%></th>
				<th sortColumn="paid" ><%=Sale.ALIAS_PAID%></th>
				<th sortColumn="unPaid" ><%=Sale.ALIAS_UN_PAID%></th>
				<th sortColumn="otherFee" ><%=Sale.ALIAS_OTHER_FEE%></th>
				<th sortColumn="profit" ><%=Sale.ALIAS_PROFIT%></th>
				<th sortColumn="paymentStatus" ><%=Sale.ALIAS_PAYMENT_STATUS%></th>
				<th sortColumn="createId" ><%=Sale.ALIAS_CREATE_ID%></th>
				<th sortColumn="transportId" ><%=Sale.ALIAS_TRANSPORT_ID%></th>
				<th sortColumn="carNumber" ><%=Sale.ALIAS_CAR_NUMBER%></th>
				<th sortColumn="driver" ><%=Sale.ALIAS_DRIVER%></th>
				<th sortColumn="driverTel" ><%=Sale.ALIAS_DRIVER_TEL%></th>
				<th sortColumn="updateDate" ><%=Sale.ALIAS_UPDATE_DATE%></th>
				<th sortColumn="createdDate" ><%=Sale.ALIAS_CREATED_DATE%></th>
				<th sortColumn="updateId" ><%=Sale.ALIAS_UPDATE_ID%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.saleId}"></td>
				
				<td><c:out value='${item.custIdTxt}'/>&nbsp;</td>
				<td><c:out value='${item.custName}'/>&nbsp;</td>
				<td><c:out value='${item.custTel}'/>&nbsp;</td>
				<td><fmt:formatNumber value='${item.paid}' type="currency" pattern="###,##0.00;-###,##0.00"/></td>
				<td><fmt:formatNumber value='${item.unPaid}' type="currency" pattern="###,##0.00;-###,##0.00"/></td>
				<td><fmt:formatNumber value='${item.otherFee}' type="currency" pattern="###,##0.00;-###,##0.00"/></td>
				<td><fmt:formatNumber value='${item.profit}' type="currency" pattern="###,##0.00;-###,##0.00"/></td>
				<td><c:choose><c:when test="${item.paymentStatus==2}">已付款</c:when><c:when test="${item.paymentStatus==0}">未付款</c:when><c:when test="${item.paymentStatus==1}">已付定金</c:when></c:choose></td>
				<td><c:out value='${item.createIdTxt}'/>&nbsp;</td>
				<td><c:out value='${item.transportIdTxt}'/>&nbsp;</td>
				<td><c:out value='${item.carNumber}'/>&nbsp;</td>
				<td><c:out value='${item.driver}'/>&nbsp;</td>
				<td><c:out value='${item.driverTel}'/>&nbsp;</td>
				<td><c:out value='${item.updateDateString}'/>&nbsp;</td>
				<td><c:out value='${item.createdDateString}'/>&nbsp;</td>
				<td><c:out value='${item.updateIdTxt}'/>&nbsp;</td>
				<td>
				<c:choose>
					<c:when test="${empty postmode}">
						<a href="${ctx}/sale/${item.saleId}">查看</a>&nbsp;&nbsp;
						<a href="${ctx}/sale/${item.saleId}/edit">修改</a>&nbsp;&nbsp;
						<a href="${ctx}/sale/${item.saleId}" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
					</c:when>
					<c:otherwise >
						<a href="${ctx}/sale/${item.saleId}?postmode=<c:out value="${postmode}" />">查看</a>&nbsp;&nbsp;
						<a href="${ctx}/sale/${item.saleId}/edit?postmode=<c:out value="${postmode}" />">修改</a>&nbsp;&nbsp;
						<a href="${ctx}/sale/${item.saleId}?postmode=<c:out value="${postmode}" />" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
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
	
	<script type="text/javascript">
	 var popupOption={
		 'sale_custId': {url:'${ctx}/customer/query',title:'选择客户',textColumn:'custName',valueColumn:'custId'},
		 'sale_createId': {url:'${ctx}/user/query',title:'选择用户',textColumn:'userName',valueColumn:'userId'},
		 'sale_transportId': {url:'${ctx}/transport/query',title:'选择运输',textColumn:'driver',valueColumn:'transportId'},
		 'sale_updateId': {url:'${ctx}/user/query',title:'选择用户',textColumn:'userName',valueColumn:'userId'}
	 };
	 PopupSelection.initOption(popupOption); 	
	</script>
	  <div id="dialog-modal" title="">
        <iframe frameborder="0" style="width:100%;height:99%;height:100%\9;" src="about:blank"></iframe>
    </div>
	
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
