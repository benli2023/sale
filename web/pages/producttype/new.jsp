<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@page import="com.github.springrest.constants.*" %>

<rapid:override name="head">
	<%@ include file="../../commons/noty-bottom-right-import.jsp" %>
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
			function notify(msg,type) {
				var n = noty({text: msg,type:type,timeout:3000,layout: 'bottomRight'});
			}
		
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			var ajaxmethod='<%=request.getAttribute(ControllerConstants.POST_MODE)%>';
			if(ajaxmethod=='ajax'&&finalResult) {
				var data = $(form).serialize();
				$.ajax({
					  url: "${ctx}/producttype/save.json",
					  type: "POST",
					  data: data,
					  success: function(resp){
					        if(resp.statusCode=='000') {
					        	notify("success!",'success');
					        	if(window.opener) {
					        		if(window.opener.newItemCallback) {
					        			window.opener.newItemCallback();
					        		}
					        		window.close();
					        	}
					        }else if(resp.statusCode=='E001') {
					        	if(resp.validationError) {
					        		if(resp.validationError.globalError) {
					        			notify("Object: "+resp.validationError.globalError.objectName+" Error:"+resp.validationError.globalError.errorMessage);
					        		}
					        		if(resp.validationError.fieldErrors) {
					        		    var fieldErrors=resp.validationError.fieldErrors;
					        			for(var i=0;i<fieldErrors.length;i++) {
					        				 var fieldError=fieldErrors[i];
					        				 notify("Field Name: "+fieldError.fieldName+" Error:"+fieldError.errorMessages,'error');
					        			}
					        		}
					        	}
					        }else if(resp.statusCode=='E001') {
					        	 notify(resp.genericError,'error');
					        }
					    }
				});
				finalResult=false;
			
			}else {
			
				//alert(ajaxmethod);
			
			}
			
			//在这里添加自定义验证
			
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
	
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
