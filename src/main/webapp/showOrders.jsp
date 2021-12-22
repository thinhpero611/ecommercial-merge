<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<table class="table table-borderless">
	<tr>
		<td>OrderId</td>
		<td>Status</td>
		<td>Date</td>
		<td>Discount code</td>
	</tr>
<c:forEach var="order" items="${orders}" varStatus="row" >
	<tr>
		<td>${order.getOrderId() }</td>
		<td>${order.getStatus() }</td>
		<td>${order.getOrderDate() }</td>
		<td>${order.getDiscount() }</td>	
	</tr>
</c:forEach>
</table>