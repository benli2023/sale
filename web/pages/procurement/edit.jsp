<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<%@ include file="../../commons/opera-maskui-dialog-import.jsp" %>
	<link href="<c:url value="${ctx}/scripts/plugins/popup-input/popup-input.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${ctx}/scripts/plugins/popup-input/popup_selection.js"></script>
	<title><%=Procurement.TABLE_ALIAS%>编辑</title>
</rapid:override>

<rapid:override name="content">
	<form:form method="put" action="${ctx}/procurement/${procurement.procurementId}" modelAttribute="procurement">
		<input id="submitButton" name="submitButton" type="submit" value="提交" />
		<input type="button" value="返回列表" onclick="window.location='${ctx}/procurement'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</form:form>
	
	<script>
		
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			
			//在这里添加自定义验证
			
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
	
	<script type="text/javascript">
	 var popupOption={
		 'procurement_prodId': {url:'${ctx}/product/query',title:'选择产品',textColumn:'prodctDesc',valueColumn:'prodId'},
		 'procurement_updateId': {url:'${ctx}/user/query',title:'选择用户',textColumn:'userName',valueColumn:'userId'},
		 'procurement_createId': {url:'${ctx}/user/query',title:'选择用户',textColumn:'userName',valueColumn:'userId'},
		 'procurement_transportId': {url:'${ctx}/transport/query',title:'选择运输',textColumn:'driverTel',valueColumn:'transportId'}
	 };
	 PopupSelection.initOption(popupOption); 	
	</script>
	  <div id="dialog-modal" title="">
        <iframe frameborder="0" style="width:100%;height:99%;height:100%\9;" src="about:blank"></iframe>
    </div>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>