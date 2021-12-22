<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>product</title>
<!-- Add icon library -->
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- bootstrap4 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- navigation bar style -->
<link rel="stylesheet" href="Styles/navBar.css">

<!-- footer style -->
<link rel="stylesheet" href="Styles/newsletter.css">
<link rel="stylesheet" href="Styles/footer.css">

<!-- global style -->
<link rel="stylesheet" href="Styles/globalStyle.css">
</head>
<body>

	<!-- navigation Bar -->
	<c:import url="navBar.jsp" />

	<div class="rounded alert alert-success">
		This Iphone is on 50% Sale Now.<i class="fa fa-hand-o-right"></i> <a
			href="#" class="text-danger">Buy Quick!</a>
	</div>

	<!-- set String parameter to add to cart -->
	<c:set scope="page" var="productParam"
		value="id=${product.getId()}&&name=${product.getName()}&&price=${product.getPrice()}&&quantity=${product.getNumber()}" />
	<!-- information product -->
	<div class="row">
		<div class="col-sm-4">
			<img class="img-fluid" style="height: 300px;" width="100%"
				src="${product.getSrc()}" alt="${product.getName()}">
		</div>
		<div class="col-sm-8">
			<h4 class="text-center text-success">${product.getName()}</h4>
			<p class="text-center text-dark">${product.getDescription()}</p>
			<h2 class="text-center text-danger">
				<i class="fas fa-dollar-sign"></i>${product.getPrice()}</h2>
			<div class="d-flex justify-content-center">
				<c:if test="${cart.contain(product) }">
					<a href="" class="btn btn-success">Added</a>
					<i class="fas fa-check text-success"></i>
				</c:if>
				<c:if test="${!cart.contain(product)}">
					<a href="<c:url value="/AddToCart?action=add&&${productParam}" />"
						class="btn btn-danger mx-auto">Add to Cart</a>
				</c:if>
			</div>
		</div>
	</div>

	<c:import url="freeText.jsp" />

	<!-- footer -->
	<c:import url="footer.jsp" />
	</div>
</body>
</html>