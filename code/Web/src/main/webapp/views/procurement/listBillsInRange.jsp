<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<h3>Bill Details</h3>
<div class="procurement_transactions" id="procurement_bills">
	<TABLE  width="800px" border="1">
		<thead class="table_header">
			<TD>Vendor</TD>
			<TD>Start Date</TD>
			<TD>End Date</TD>
			<TD>Total Bill Amount</TD>
			<TD>Balance Amount</TD>
		</thead>
		<c:forEach var="billingProcurements" items="${billingProcurements}">
			<tr>
				<td>${billingProcurements.vendor.vendorName}</td>
				<td><fmt:formatDate pattern="dd-MM-yyyy" value="${billingProcurements.startDate}" /></td>
				<td><fmt:formatDate pattern="dd-MM-yyyy" value="${billingProcurements.endDate}" /></td>
				<td>${billingProcurements.procurementAmount}</td>
				<td>${billingProcurements.balanceAmount}</td>
			</tr>
		</c:forEach>
	 </TABLE>
 </div>