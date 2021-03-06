<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<script type="text/javascript">
    $(document).ready(function(){

        $('.alert_name').bind("change",function(){
            var transactionInRangeUrl = "<%=request.getContextPath()%>/alerts/showAllConfigs?alertTypeId="+$('.alert_name').val();
            $.ajax({
                url : transactionInRangeUrl,
                processData : true,
                success : function(data) {
                    $(".configList").html(data);
                }
            })
        });

        $('#new_config').bind("click",function(){
            var transactionInRangeUrl = "<%=request.getContextPath()%>/alerts/newConfig?alertTypeId="+$('.alert_name').val();
            $.ajax({
                url : transactionInRangeUrl,
                processData : true,
                success : function(data) {
                    $(".configList").html(data);
                }
            })
        });
    });

    function validateForm(){
        if(!($('.alert_name').val())){
            alert("Please select alert Type");
            return false;
        }
        return true;
    }

</script>

<div class="general_division">
	<div class="content_header">Alerts Configuration</div>
	<div class="section">
        <span class="left"><label>Alert Types:</label></span>
        <span class="right">
            <select class="alert_name">
                <option value="-1">--Please Select</option>
                <c:forEach var="alertType" items="${alertTypes}">
                    <option value="${alertType.alertTypeId}">${alertType.alertName}</option>
                </c:forEach>
            </select>
        </span>
    </div>
</div>

<div>
	<input style="margin-left: 10px;" class="buttons" type="button" value="New Configuration" id="new_config"/>
</div></br></br>

<form  method="POST" action="<%=request.getContextPath()%>/alerts/createConfig"  onsubmit="return validateForm();">
<div class="configList">
</div>
</form>