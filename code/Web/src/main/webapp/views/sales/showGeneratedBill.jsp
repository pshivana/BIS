<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<div>
<h2>Bill Details</h2></br>
</div>
<div>
<div>
    <div>
		<span class="left"><label>Previous Bill Oustanding Amount</label>	</span>
		<span class="center"><label>:</label></span>
          <c:choose>
            <c:when test="${SalesBillingDetails.lastBill != null}">
                <span class="right"><label>${SalesBillingDetails.lastBill.balanceAmount}</label></span>
            </c:when>
            <c:otherwise>
                <span class="right"><label>0.0</label></span>
            </c:otherwise>
          </c:choose>
	</div>
	<div>
		<span class="left"><label>Sales Transactions Total</label></span>
		<span class="center"><label>:</label></span>
		<span class="right"><label>${SalesBillingDetails.salesTransactionTotal}</label></span>
	</div>
	<div>	
		<span class="left"><label>Return Transactions Total</label></span>
		<span class="center"><label>:</label></span>
		<span class="right"><label>${SalesBillingDetails.returnTransactionTotal}</label></span>
	</div>
	<div> 
	  <span class="left"><label>Payment Transactions Total</label></span>
	  <span class="center"><label>:</label></span>
	  <span class="right"><label>${SalesBillingDetails.paymentTotal}</label></span>
	</div>
	<div> 
	  <span class="left"><label>Total Bill Amount</label></span>
	  <span class="center"><label>:</label></span>
	  <span class="right"><label>${SalesBillingDetails.billAmount}</label></span>
	</div>		
</div>
    <div id="sales_payments_accordion" class="sales_transactions">
		<h3>
		   <a href="">
				<label>Sales Transactions</label>
		   </a>
		</h3>	
		<div>
        <TABLE  width="500px" border="1">
            <thead class="table_header">
                <TD>Sl.No</TD>
                <TD>Date</TD>
                <TD>TransactionType</TD>
                <TD>Total</TD>
            </thead>
            <c:forEach var="salesTransaction" items="${SalesBillingDetails.salesTransactions}" varStatus="counter">
                <tr>
                    <td>${counter.count}</td>
                    <td><fmt:formatDate pattern="dd-MMM-yyyy" value="${salesTransaction.date}" /></td>
                    <td>${salesTransaction.transactionTypeDescription}</td>
                    <td>${salesTransaction.totalAmount}</td>
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
        <TABLE  width="500px" border="1">
            <thead class="table_header">
                <TD>Sl.No</TD>
                <TD>Date</TD>
                <TD>Mode</TD>
                <TD>Receipt Number</TD>
                <TD>Amount</TD>
            </thead>
            <c:forEach var="salesPayment" items="${SalesBillingDetails.salesPayments}" varStatus="counter">
                <tr>
                    <td>${counter.count}</td>
                    <td><fmt:formatDate pattern="dd-MMM-yyyy" value="${salesPayment.date}" /></td>
                    <td>${salesPayment.modeDescription}</td>
                    <td>${salesPayment.receiptNum}</td>
                    <td>${salesPayment.amount}</td>
                </tr>
            </c:forEach>
         </TABLE>
		</div> 
     </div>
	 
<div>
	<div>
	<h3>Quick Payment</h3></br>
	</div>
    <div class="section">
         <span class="left"><label>Amount:</label></span>
         <span class="right"><form:input path="SalesBillingDetails.paymentAmount" class="amount"/></span>
    </div>
    <div class="section">
         <span class="left"><label>Receipt Number:</label></span>
         <span class="right"><form:input path="SalesBillingDetails.receiptNum" class="receiptNum"/></span>
    </div>
    <div class="section">
         <span class="left"><label>Mode:</label></span>
         <span class="right"><form:select path="SalesBillingDetails.mode" items="${PaymentMode}"/></span>
    </div>
    <div class="section">
         <span class="left"><label>Remarks:</label></span>
         <span class="right"><form:input path="SalesBillingDetails.remarks" class="receiptNum"/></span>
    </div>
</div>
<div class="section">
    <span class="left"><input type="submit" value="Save Sales Bill" class="generate_bill"/></span>
</div>
</div>
<script>
   $(function() {
       $( "#sales_payments_accordion" ).accordion({
			collapsible: true,
			active: false
	   });	   
   });
</script>