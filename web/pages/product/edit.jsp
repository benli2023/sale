<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<%@ include file="../../commons/noty-bottom-right-import.jsp" %>
	<%@ include file="../../commons/opera-maskui-dialog-import.jsp" %>
	<link href="<c:url value="${ctx}/scripts/plugins/popup-input/popup-input.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${ctx}/scripts/plugins/popup-input/popup_selection.js"></script>
	<title><%=Product.TABLE_ALIAS%>编辑</title>
</rapid:override>

<rapid:override name="content">
	<form:form method="put" action="${ctx}/product/${product.prodId}" modelAttribute="product">
		<input id="submitButton" name="submitButton" type="submit" value="提交" />
		<c:choose>
				<c:when test="${empty postmode}">
					<input type="button" value="返回列表" onclick="window.location='${ctx}/product'"/>
					<input type="button" value="后退" onclick="history.back();"/>
				</c:when>
				<c:otherwise>
					<input type="button" value="返回列表" onclick="window.location='${ctx}/product?postmode=<c:out value="${postmode}" />'"/>
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
					return '${ctx}/product/update.json';
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