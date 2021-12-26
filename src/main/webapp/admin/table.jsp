<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
 
<div class="well well-lg"> 
	<div class="table-responsive">       
	<table class="table table-hover">
   	<thead>
     		<tr>
     			<th>UserID</th>
	       		<th>Name</th>
		        <th>Age</th>
		        <th>City</th>
		        <th>Country</th>
		        <th>Number Of Order</th>
		        <th>Total Payment</th>
     		</tr>
   	</thead>
   	<c:forEach var="user" items="${listUserG}" varStatus="row">
	   	<tbody class="bg-muted">
	   		<tr>
	   			<td>${row.index + 1}</td>
	      	 	<td>${user.getName()}</td>
	      	 	<td>${user.getAge()}</td>
	       		<td>${user.getCity()}</td>
	       		<td>${user.getCountry()}</td>
	       		<td>${user.getNumberOfOrder()}</td>
	       		<td>
	       			<fmt:setLocale value="en_US" />
	       			<fmt:formatNumber value="${user.getTotalPayment()}" type="currency" />
	       		</td>
	   		</tr>
	   	</tbody>
   	</c:forEach>
   	</table>
   	</div>  
</div>