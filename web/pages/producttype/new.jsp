<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Producttype.TABLE_ALIAS%>新增</title>
</rapid:override>

<rapid:override name="content">
	<form:form method="post" action="${ctx}/producttype" modelAttribute="producttype" >
		<input id="submitButton" name="submitButton" type="submit" value="提交" />
		<input type="button" value="返回列表" onclick="window.location='${ctx}/producttype'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</form:form>
	
	<script>
		
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			
			var ajaxmethod=${ajaxmethod};
			
			if(ajaxmethod&&finalResult) {
				var data = $(form).serialize();
				$.ajax({
					  url: "${ctx}/producttype/ajaxpost",
					  type: "POST",
					  data: data,
					  success: function(resp){
					        if(resp.statusCode=='000') {
					        	alert("success");
					        }else if(resp.statusCode=='E001') {
					        	alert(resp.validationError);
					        }else if(resp.statusCode=='E001') {
					        	alert(resp.genericError);
					        }
					    }
				});
				finalResult=false;
			
			}else {
			
				alert(ajaxmethod);
			
			}
			
			//在这里添加自定义验证
			
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
	
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
