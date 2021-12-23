<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="java.util.*, dao.*" %>
<table class="table table-hover">
	<tr>
		<td>OrderId</td>
		<td>Status</td>
		<td>Date</td>
		<td>Total Amount</td>
		<td>Detail</td>
	</tr>
<c:forEach var="order" items="${orders}" varStatus="row" >
	<tr>
		<td>${order.getOrderId() }</td>
		<td>${order.getStatus() }</td>
		<td>${order.getOrderDate() }</td>
		<td>${order.getPrice() }</td>	
		<td>
			<c:forEach var="productOrder" items="${order.getLp()}">
				<p>${ListProductDAO().getProduct(""+productOrder.getProductId()).getName()}</p><Strong class="text-info"></Strong>
			</c:forEach>
		</td>
	</tr>
</c:forEach>
</table>