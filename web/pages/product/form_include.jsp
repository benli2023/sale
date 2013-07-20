<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="prodId" name="prodId" value="${product.prodId}"/>

	<tr>	
		<td class="tdLabel">
			<%=Product.ALIAS_TYPE_ID%>:
		</td>		
		<td>
		<yun:button-edit name="typeIdTxt" hiddenName="typeId" id="product_typeId" txtVal="${product.typeIdTxt}"  hiddenVal="${product.typeId}" width="130"  profileId="product"/> 
	
		<font color='red'><form:errors path="typeId"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Product.ALIAS_PROVIDER_ID%>:
		</td>		
		<td>
		<yun:button-edit name="providerIdTxt" hiddenName="providerId" id="product_providerId" txtVal="${product.providerIdTxt}"  hiddenVal="${product.providerId}" width="130"  profileId="product"/> 
	
		<font color='red'><form:errors path="providerId"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Product.ALIAS_PRODUCT_NAME%>:
		</td>		
		<td>
		<form:input path="productName" id="productName" cssClass="" maxlength="128" />
		<font color='red'><form:errors path="productName"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Product.ALIAS_PRODCT_DESC%>:
		</td>		
		<td>
		<form:input path="prodctDesc" id="prodctDesc" cssClass="" maxlength="128" />
		<font color='red'><form:errors path="prodctDesc"/></font>
		</td>
	</tr>	
	
		