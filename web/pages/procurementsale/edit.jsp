<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<%@ include file="../../commons/noty-bottom-right-import.jsp" %>
	<title><%=Procurementsale.TABLE_ALIAS%>编辑</title>
</rapid:override>

<rapid:override name="content">
	<form:form method="put" action="${ctx}/procurementsale/${procurementsale.id}" modelAttribute="procurementsale">
		<input id="submitButton" name="submitButton" type="submit" value="提交" />
		<c:choose>
				<c:when test="${empty postmode}">
					<input type="button" value="返回列表" onclick="window.location='${ctx}/procurementsale'"/>
					<input type="button" value="后退" onclick="history.back();"/>
				</c:when>
				<c:otherwise>
					<input type="button" value="返回列表" onclick="window.location='${ctx}/procurementsale?postmode=<c:out value="${postmode}" />'"/>
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
					return '${ctx}/procurementsale/update.json';
			}
			function getPostMethod() {
				return '${postmode}' ;
			}
			function validationCallback(form,result) {
			   return result;
			}
	</script>
	
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>