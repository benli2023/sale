<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<%@ include file="../../commons/noty-bottom-right-import.jsp" %>
	<%@ include file="../../commons/opera-maskui-dialog-import.jsp" %>
	<link href="<c:url value="${ctx}/scripts/plugins/popup-input/popup-input.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${ctx}/scripts/plugins/popup-input/popup_selection.js"></script>
	<title><%=Procurement.TABLE_ALIAS%>新增</title>
</rapid:override>

<rapid:override name="content">
	<form:form method="post" action="${ctx}/procurement" modelAttribute="procurement" >
		<input id="submitButton" name="submitButton" type="submit" value="提交" />

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
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</form:form>
	<%@ include file="../../commons/ajaxpost-import.jsp" %>
	
	<script>
			function getJsonUrl() {
					return '${ctx}/procurement/save.json';
			}
			function getPostMethod() {
				return '${postmode}' ;
			}
			function validationCallback(form,result) {
			   return result;
			}
	</script>
	
	<script type="text/javascript">
	 var popupOption={
		 'procurement_prodId': {url:'${ctx}/product/query',title:'选择产品',textColumn:'productName',valueColumn:'prodId'},
		 'procurement_updateId': {url:'${ctx}/user/query',title:'选择用户',textColumn:'userName',valueColumn:'userId'},
		 'procurement_createId': {url:'${ctx}/user/query',title:'选择用户',textColumn:'userName',valueColumn:'userId'},
		 'procurement_transportId': {url:'${ctx}/transport/query',title:'选择运输',textColumn:'driver',valueColumn:'transportId',fields:{"driver":"driver","carNumber":"carNumber","driverTel":"driverTel"}}
	 };
	 PopupSelection.initOption(popupOption); 	
	</script>
	  <div id="dialog-modal" title="">
        <iframe frameborder="0" style="width:100%;height:99%;height:100%\9;" src="about:blank"></iframe>
    </div>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
