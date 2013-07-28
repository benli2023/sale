<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<%@ include file="../../commons/noty-bottom-right-import.jsp" %>
	<title><%=Customer.TABLE_ALIAS%>新增</title>
</rapid:override>

<rapid:override name="content">
	<form:form method="post" action="${ctx}/customer" modelAttribute="customer" >
		<input id="submitButton" name="submitButton" type="submit" value="提交" />

		<c:choose>
			<c:when test="${empty postmode}">
				<input type="button" value="返回列表" onclick="window.location='${ctx}/customer'"/>
				<input type="button" value="后退" onclick="history.back();"/>
			</c:when>
			<c:otherwise>
				<input type="button" value="返回列表" onclick="window.location='${ctx}/customer?postmode=<c:out value="${postmode}" />'"/>
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
					return '${ctx}/customer/save.json';
			}
			function getPostMethod() {
				return '${postmode}' ;
			}
			function validationCallback(form) {
			   return true;
			}
	</script>
	
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
