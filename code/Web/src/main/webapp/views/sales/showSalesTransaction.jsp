<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<div>
    <h1>Payment Details</h1>
    <div class="section">
        <span class="left"><label>Hawker name:</label></span>
        <span class="right"><label>${PaymentHistorySales.hawker.hawkerName}</label></span>
    </div>
    <div class="section">
        <span class="left"><label>Date:</label></span>
        <span class="right"><label>${PaymentHistorySales.date}</label></span>
    </div>
    <div class="section">
        <span class="left"><label>Amount:</label></span>
        <span class="right"><label>${PaymentHistorySales.amount}</label></span>
    </div>
    <div class="section">
        <span class="left"><label>Receipt No.:</label></span>
        <span class="right"><label>${PaymentHistorySales.receiptNum}</label></span>
    </div>
    <div class="section">
        <span class="left"><label>Mode:</label></span>
        <span class="right"><label>${PaymentHistorySales.mode}</label></span>
    </div>
    <div class="section">
        <span class="left"><label>Remarks:</label></span>
        <span class="right"><label>${PaymentHistorySales.remarks}</label></span>
    </div>
    <div class="section">
        <span class="left"><a href="<%=request.getContextPath()%>/salesPayment/updateForm/${PaymentHistorySales.paymentId}">Update Payment</a></span>
    </div>
</div>
