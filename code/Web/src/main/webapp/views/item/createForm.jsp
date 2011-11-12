<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<script type="text/javascript">
    function validateForm(){
        if(!($('.item_name').val())){
            alert("Item Name Not Provided");
            return false;
        }
        return true;
    }
</script>
<form  method="POST" action="<%=request.getContextPath()%>/item/create"  onsubmit="return validateForm();">
    <div class="content_header">Item Creation Form</div>
    <div>
        <div class="section">
            <span class="left"><label>Item Name:</label></span
            <span class="right"><form:input path="itemForm.item.itemName" class="item_name"/>*</span>
        </div>
        <div class="section">
            <span class="left"><label>Item Description:</label></span
            <span class="right"><form:input path="itemForm.item.description" /></span>
        </div>
        <div class="section">
            <span class="left"><label>Item Price:</label></span
            <span class="right"><form:input path="itemForm.itemPrice" /></span>
        </div>
        <div class="section">
            <span class="left"><label>Item Type:</label></span
            <span class="right"><form:select path="itemForm.item.itemLife" items="${itemTypes}" /></span>
        </div>
        <div class="section">
            <span class="left"><label>Item Returnable:</label></span
            <span class="right"><form:select path="itemForm.item.returnable" items="${itemReturnTypes}"/></span>
        </div>
        <div class="section">
            <span class="center"><input type="submit" value="Submit"/> <input type="reset" value="Clear"/></span>
        </div>
    </div>
</form>