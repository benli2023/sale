<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="procurementId" name="procurementId" value="${procurement.procurementId}"/>

	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_PROCUREMENT_NAME%>:
		</td>		
		<td>
		<form:input path="procurementName" id="procurementName" cssClass="" maxlength="128" />
		<font color='red'><form:errors path="procurementName"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_PROD_ID%>:
		</td>		
		<td>
		<yun:button-edit name="prodIdTxt" hiddenName="prodId" id="procurement_prodId" txtVal="${procurement.prodIdTxt}"  hiddenVal="${procurement.prodId}" width="130"  profileId="procurement"/> 
	
		<font color='red'><form:errors path="prodId"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_PROCUREMENT_DATE%>:
		</td>		
		<td>
		<input value="${procurement.procurementDateString}" onclick="WdatePicker({dateFmt:'<%=Procurement.FORMAT_PROCUREMENT_DATE%>'})" id="procurementDateString" name="procurementDateString"  maxlength="0" class="" />
	
		<font color='red'><form:errors path="procurementDate"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_AMOUNT%>:
		</td>		
		<td>
		<form:input path="amount" id="amount" cssClass="validate-integer max-value-2147483647" maxlength="10" />
		<font color='red'><form:errors path="amount"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_REMAINED_AMOUNT%>:
		</td>		
		<td>
		<form:input path="remainedAmount" id="remainedAmount" cssClass="validate-integer max-value-2147483647" maxlength="10" />
		<font color='red'><form:errors path="remainedAmount"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_UNIT_PRICE%>:
		</td>		
		<td>
		<form:input path="unitPrice" id="unitPrice" cssClass="validate-number " maxlength="10" />
		<font color='red'><form:errors path="unitPrice"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_FREIGHTAGE%>:
		</td>		
		<td>
		<form:input path="freightage" id="freightage" cssClass="validate-number " maxlength="10" />
		<font color='red'><form:errors path="freightage"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_LOAD_FEE%>:
		</td>		
		<td>
		<form:input path="loadFee" id="loadFee" cssClass="validate-number " maxlength="10" />
		<font color='red'><form:errors path="loadFee"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_CAR_NUMBER%>:
		</td>		
		<td>
		<form:input path="carNumber" id="carNumber" cssClass="" maxlength="32" />
		<font color='red'><form:errors path="carNumber"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_DRIVER%>:
		</td>		
		<td>
		<form:input path="driver" id="driver" cssClass="" maxlength="64" />
		<font color='red'><form:errors path="driver"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_DRIVER_TEL%>:
		</td>		
		<td>
		<form:input path="driverTel" id="driverTel" cssClass="" maxlength="32" />
		<font color='red'><form:errors path="driverTel"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_UPDATE_DATE%>:
		</td>		
		<td>
		<input value="${procurement.updateDateString}" onclick="WdatePicker({dateFmt:'<%=Procurement.FORMAT_UPDATE_DATE%>'})" id="updateDateString" name="updateDateString"  maxlength="0" class="" />
	
		<font color='red'><form:errors path="updateDate"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_CREATED_DATE%>:
		</td>		
		<td>
		<input value="${procurement.createdDateString}" onclick="WdatePicker({dateFmt:'<%=Procurement.FORMAT_CREATED_DATE%>'})" id="createdDateString" name="createdDateString"  maxlength="0" class="" />
	
		<font color='red'><form:errors path="createdDate"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_UPDATE_ID%>:
		</td>		
		<td>
		<yun:button-edit name="updateIdTxt" hiddenName="updateId" id="procurement_updateId" txtVal="${procurement.updateIdTxt}"  hiddenVal="${procurement.updateId}" width="130"  profileId="common"/> 
	
		<font color='red'><form:errors path="updateId"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Procurement.ALIAS_CREATE_ID%>:
		</td>		
		<td>
		<yun:button-edit name="createIdTxt" hiddenName="createId" id="procurement_createId" txtVal="${procurement.createIdTxt}"  hiddenVal="${procurement.createId}" width="130"  profileId="common"/> 
	
		<font color='red'><form:errors path="createId"/></font>
		</td>
	</tr>	
	
		