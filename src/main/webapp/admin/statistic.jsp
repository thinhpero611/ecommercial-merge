<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="model.*" %>
<c:set var="total" value="${0}"/>
<c:forEach var="user" items="${listUserG}">
    <c:set var="total" value="${total + user.getTotalPayment()}" />
</c:forEach>
<div class="row">
   	<div class="col-sm-3">
   		<div class="well well-lg">
     		<h4 class="text-primary">Users</h4>
     		<p class="bg-warning">${listUserG.size()}</p> 
   		</div>
   	</div>
   	<div class="col-sm-3">
  		<div class="well well-lg">
     		<h4 class="text-success">Pages</h4>
     		<p class="bg-info">99 Million</p> 
   		</div>
   	</div>
   	<div class="col-sm-3">
   		<div class="well well-lg">
     		<h4 class="text-info">Sessions</h4>
     		<p class="bg-success">9.9 Million</p> 
   		</div>
   	</div>
   	<div class="col-sm-3">
   		<div class="well well-lg">
     		<h4 class="text-warning">Sale Revenue</h4>
     		<p class="bg-danger">
				<fmt:setLocale value="en_US" />
				<fmt:formatNumber value="${total }" type="currency" />
			</p> 
   		</div>
   	</div>
</div>