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
    <div class="item_form">
	    <div class="content_header">Item Creation Form</div>
        <div class="section">
            <span class="left"><label>Item Name:</label></span
            <span class="right"><form:input path="item.itemName" class="item_name"/>*</span>
        </div>
        <div class="section">
            <span class="left"><label>Item Description:</label></span
            <span class="right"><form:input path="item.description" /></span>
        </div>
        <div class="section">
            <span class="left"><label>Item Price:</label></span
            <span class="right"><form:input path="item.defaultPrice" /></span>
        </div>
        <div class="section">
            <span class="left"><label>Item Type:</label></span
            <span class="right"><form:select path="item.itemLife" items="${itemTypes}" /></span>
        </div>
        <div class="section">
            <span class="left"><label>Item Returnable:</label></span
            <span class="right"><form:select path="item.returnable" items="${itemReturnTypes}"/></span>
        </div>
    </div>
    <div class="button_div">
         <input class="buttons" type="submit" value="Submit"/> 
		 <input class="buttons" type="reset" value="Clear"/>
    </div>	
</form>
