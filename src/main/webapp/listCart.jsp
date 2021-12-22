<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- table of orders -->
<table class="table table-borderless table-hover">
	<tr>
		<th>Id</th>
		<th>Product Name</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Amout</th>
	</tr>
	<c:forEach var="item" items="${cart.getItems()}" varStatus="row">
		<tr>
			<td>${item.getId()}</td>
			<td>${item.getName()}</td>
			<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
					value="${item.getPrice()}" type="currency" /></td>
			<td>
				<form action="/AddToCart?action=update&&id=${item.getId()}"
					method="POST">
					<select name="quantityOrder">
						<option selected>${item.getNumber()}</option>
						<c:if test="${item.getNumber() != 1 }">
						<option value="1">1</option>
						</c:if>
						<option value="2">2</option>
						<option value="4">4</option>
						<option value="5">6</option>
						<option value="10">10</option>
					</select>
					<button type="submit" class="btn btn-muted">
						<i class="fas fa-wrench"></i>
					</button>
				</form>
			</td>
			<td class="text-success"><fmt:setLocale value="en_US" /> <fmt:formatNumber
					value="${item.getPrice()*item.getNumber()}" type="currency" /></td>
			<td><a href="/AddToCart?action=delete&&id=${item.getId()}"
				class="btn btn-outline-danger">remove</a></td>
		</tr>
	</c:forEach>
</table>

<div class="text-right text-success">
	Your total Order is:
	<fmt:setLocale value="en_US" />
	<fmt:formatNumber value="${cart.getAmount()}" type="currency" />
</div>