<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<div class="section">
<h2>Bill Details</h2>
</div>
<div>
<div class="section">
    <div class="section">
		<span class="left"><label>Previous Bill Oustanding Amount</label>	</span>
		<span class="center"><label>:</label></span>
          <c:choose>
            <c:when test="${ProcurementBillingDetails.lastBill != null}">
                <span class="right"><label>${ProcurementBillingDetails.lastBill.balanceAmount}</label></span>
            </c:when>
            <c:otherwise>
                <span class="right"><label>0.0</label></span>
            </c:otherwise>
          </c:choose>
	</div>
	<div class="section">
		<span class="left"><label>Purchase Transactions Total</label></span>
		<span class="center"><label>:</label></span>
		<span class="right"><label>${ProcurementBillingDetails.purchaseTransactionTotal}</label></span>
	</div>
	<div class="section">
		<span class="left"><label>Return Transactions Total</label></span>
		<span class="center"><label>:</label></span>
		<span class="right"><label>${ProcurementBillingDetails.returnTransactionTotal}</label></span>
	</div>
	<div class="section">
	  <span class="left"><label>Payment Transactions Total</label></span>
	  <span class="center"><label>:</label></span>
	  <span class="right"><label>${ProcurementBillingDetails.paymentTotal}</label></span>
	</div>
	<div class="section">
	  <span class="left"><label>Total Bill Amount</label></span>
	  <span class="center"><label>:</label></span>
	  <span class="right"><label>${ProcurementBillingDetails.billAmount}</label></span>
	</div>
</div>
<br/>
<div class="payment_table">
<TABLE  width = "100%" >
    <th class="table_header" colspan="2">Quick Payment</th>
	<tr>
	<td>
    <div class="section">
         <span class="left"><label>Amount:</label></span>
         <span class="right"><form:input path="ProcurementBillingDetails.paymentAmount" class="amount"/></span>
    </div>
	</td>
	<td>
    <div class="section">
         <span class="left"><label>Receipt Number:</label></span>
         <span class="right"><form:input path="ProcurementBillingDetails.receiptNum" class="receiptNum"/></span>
    </div>
	</td>
	</tr>
	<tr>
	<td>
    <div class="section">
         <span class="left"><label>Mode:</label></span>
         <span class="right"><form:select path="ProcurementBillingDetails.mode" items="${PaymentMode}"/></span>
    </div>
	</td>
	<td>
    <div class="section">
         <span class="left"><label>Remarks:</label></span>
         <span class="right"><form:textarea path="ProcurementBillingDetails.remarks" class="textarea"/></span>
    </div>
	</td>
	</tr>
</TABLE>
</div>
<div class="section">
		<span class="left"><input class="buttons" type="submit" value="Save Purchase Bill" class="generate_bill"/></span>
</div>
<br/>
<br/>
 <div>
<h3>Purchase and Payment Details</h3>
</div>

<div id="procurements_payments_accordion" class="procurement_transactions">
	<h3>
	   <a href="">
			<label>Purchase Transactions</label>
	   </a>
	</h3>
	<div>
		<TABLE  width="610px" border="1">
			 <thead class="table_header">
				 <TD>Sl.No</TD>
				 <TD>Date</TD>
				 <TD>TransactionType</TD>
				 <TD>Total</TD>
			 </thead>
			 <c:forEach var="procurementTransaction" items="${ProcurementBillingDetails.procurementTransactions}" varStatus="counter">
				 <tr>
					 <td>${counter.count}</td>
					 <td><fmt:formatDate pattern="dd-MM-yyyy" value="${procurementTransaction.date}" /></td>
					 <td>${procurementTransaction.transactionTypeDescription}</td>
					 <td>${procurementTransaction.totalAmount}</td>
				 </tr>
			 </c:forEach>
		</TABLE>
	</div>

	<h3>
	   <a href="">
			<label>Payment Transactions </label>
	   </a>
	</h3>
	<div>
		 <TABLE  width="610px" border="1">
			 <thead class="table_header">
				 <TD>Sl.No</TD>
				 <TD>Date</TD>
				 <TD>Mode</TD>
				 <TD>Receipt Number</TD>
				 <TD>Amount</TD>
			 </thead>
			 <c:forEach var="procurementPayment" items="${ProcurementBillingDetails.procurementPayments}" varStatus="counter">
				 <tr>
					 <td>${counter.count}</td>
					 <td><fmt:formatDate pattern="dd-MM-yyyy" value="${procurementPayment.date}" /></td>
					 <td>${procurementPayment.modeDescription}</td>
					 <td>${procurementPayment.receiptNum}</td>
					 <td>${procurementPayment.amount}</td>
				 </tr>
			 </c:forEach>
		 </TABLE>
	</div>
</div>
</div>
<script>
   $(function() {
       $( "#procurements_payments_accordion" ).accordion({
			collapsible: true,
			active: false
	   });
   });
</script>
