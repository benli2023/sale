<%@page import="com.longxing.sale.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<input type="hidden" id="saleId" name="saleId" value="${sale.saleId}"/>

	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_CUST_ID%>:
		</td>		
		<td>
		<yun:button-edit name="custIdTxt" hiddenName="custId" id="sale_custId" txtVal="${sale.custIdTxt}"  hiddenVal="${sale.custId}" width="130"  profileId="sale"/> 
	
		<font color='red'><form:errors path="custId"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_AMOUNT%>:
		</td>		
		<td>
		<form:input path="amount" id="amount" cssClass="validate-integer max-value-2147483647" maxlength="10" />
		<font color='red'><form:errors path="amount"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_UNIT%>:
		</td>		
		<td>
		<form:select path="unit" id="unit">
			<form:option value="1" >吨</form:option>
			<form:option value="2" >批</form:option>
		</form:select>
		<font color='red'><form:errors path="unit"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_CUST_NAME%>:
		</td>		
		<td>
		<form:input path="custName" id="custName" cssClass="" maxlength="64" />
		<font color='red'><form:errors path="custName"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_CUST_TEL%>:
		</td>		
		<td>
		<form:input path="custTel" id="custTel" cssClass="" maxlength="128" />
		<font color='red'><form:errors path="custTel"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_UNIT_PRICE%>:
		</td>		
		<td>
		<form:input path="unitPrice" id="unitPrice" cssClass="validate-integer " maxlength="10" />
		<font color='red'><form:errors path="unitPrice"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_PAID%>:
		</td>		
		<td>
		<form:input path="paid" id="paid" cssClass="validate-number " maxlength="10" />
		<font color='red'><form:errors path="paid"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_UN_PAID%>:
		</td>		
		<td>
		<form:input path="unPaid" id="unPaid" cssClass="validate-number " maxlength="10" />
		<font color='red'><form:errors path="unPaid"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_OTHER_FEE%>:
		</td>		
		<td>
		<form:input path="otherFee" id="otherFee" cssClass="validate-number " maxlength="10" />
		<font color='red'><form:errors path="otherFee"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_PROFIT%>:
		</td>		
		<td>
		<form:input path="profit" id="profit" cssClass="validate-number " maxlength="10" />
		<font color='red'><form:errors path="profit"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_PAYMENT_STATUS%>:
		</td>		
		<td>
		<form:select path="paymentStatus" id="paymentStatus">
			<form:option value="2" >已付款</form:option>
			<form:option value="0" >未付款</form:option>
			<form:option value="1" >已付定金</form:option>
		</form:select>
		<font color='red'><form:errors path="paymentStatus"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_TRANSPORT_ID%>:
		</td>		
		<td>
		<yun:button-edit name="transportIdTxt" hiddenName="transportId" id="sale_transportId" txtVal="${sale.transportIdTxt}"  hiddenVal="${sale.transportId}" width="130"  profileId="common"/> 
	
		<font color='red'><form:errors path="transportId"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_CAR_NUMBER%>:
		</td>		
		<td>
		<form:input path="carNumber" id="carNumber" cssClass="" maxlength="32" />
		<font color='red'><form:errors path="carNumber"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_DRIVER%>:
		</td>		
		<td>
		<form:input path="driver" id="driver" cssClass="" maxlength="64" />
		<font color='red'><form:errors path="driver"/></font>
		</td>
	</tr>	
	
	<tr>	
		<td class="tdLabel">
			<%=Sale.ALIAS_DRIVER_TEL%>:
		</td>		
		<td>
		<form:input path="driverTel" id="driverTel" cssClass="" maxlength="32" />
		<font color='red'><form:errors path="driverTel"/></font>
		</td>
	</tr>	
	
		