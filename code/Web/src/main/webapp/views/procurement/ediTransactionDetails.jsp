<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<div align="center">
    <TABLE id="dataTable" width="300px" border="1" >
        <thead class="table_header">
            <TD></TD>
            <TD>Item</TD>
            <TD>Date Of Publishing</TD>
             <TD>MRP</TD>
            <TD>Discount</TD>
            <TD>Price Per Item</TD>
            <TD>Qty</TD>
            <TD>Total</TD>
        </thead>
        <c:forEach var="index" begin="1" end="${fn:length(procurementTransactionGrid.transactionDetails)}" step="1">
            <form:hidden path="procurementTransactionGrid.transactionDetails[${index-1}].detailsId"/>
            <form:hidden path="procurementTransactionGrid.transactionDetails[${index-1}].transactionId"/>
            <tr class="template_row">
                <c:choose>
                    <c:when test="${procurementTransactionGrid.transactionDetails[index-1].transactionId < 1}">
                        <td><form:checkbox  path='procurementTransactionGrid.transactionDetails[${index-1}].checked' class='item_select'/></td>
                        <td>
                            <form:select path='procurementTransactionGrid.transactionDetails[${index-1}].itemCode' class='item_name'>
                                <form:option value="-1" label="--Please Select"/>
                                <form:options items="${items}" itemLabel="itemName" itemValue="itemCode"/>
                            </form:select>
                        </td>
                        <td>
                            <select class="date_of_publish_select">
                                <c:forEach var="issue" items="${procurementTransactionGrid.transactionDetails[index-1].issueDates}">
                                    <option value="${issue.key}">${issue.value}</option>
                                </c:forEach>
                                <option value="-1">Other</option>
                            </select>
                            <form:input path='procurementTransactionGrid.transactionDetails[${index-1}].dateOfPublishing' class='date_of_publish' type='text' display="none"/>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td><form:checkbox  path='procurementTransactionGrid.transactionDetails[${index-1}].checked' class='item_select' disabled="true"/></td>
                        <td>
                            <form:hidden path="procurementTransactionGrid.transactionDetails[${index-1}].itemCode"/>
                            <form:select path='procurementTransactionGrid.transactionDetails[${index-1}].itemCode' class='item_name' disabled="true">
                                <form:option value="-1" label="--Please Select"/>
                                <form:options items="${items}" itemLabel="itemName" itemValue="itemCode"/>
                            </form:select>
                        </td>
                        <td>
                            <select class="date_of_publish_select" disabled="true">
                                <c:forEach var="issue" items="${procurementTransactionGrid.transactionDetails[index-1].issueDates}">
                                    <option value="${issue.key}">${issue.value}</option>
                                </c:forEach>
                                <option value="-1">Other</option>
                            </select>
                            <form:hidden path="procurementTransactionGrid.transactionDetails[${index-1}].dateOfPublishing"/>
                            <form:input path='procurementTransactionGrid.transactionDetails[${index-1}].dateOfPublishing' class='date_of_publish' type='text' display="none" disabled='true'/>
                        </td>
                    </c:otherwise>
                </c:choose>
                <td><form:input class='mrp' type='text' path="procurementTransactionGrid.transactionDetails[${index-1}].mrp"/></td>
                <td><form:input class='discount' type='text' path="procurementTransactionGrid.transactionDetails[${index-1}].discount"/></td>
                <td><form:input class='price_per_item' type='text' path="procurementTransactionGrid.transactionDetails[${index-1}].pricePerItem"/></td>
                <td><form:input path='procurementTransactionGrid.transactionDetails[${index-1}].quantity' class='quantity' type='text'/></td>
                <td><form:input path='procurementTransactionGrid.transactionDetails[${index-1}].amount' class='amount' type='text' readonly='true'/></td>
            </tr>
        </c:forEach>
        <tr class="transaction_details_count">
            <td colspan="7">Total</td>
            <td><form:input type="text" readonly="true" path='procurementTransactionGrid.grandTotal' class="grand_total"/></td>
        </tr>
    </TABLE>
</div>



