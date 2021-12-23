<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ecommercial</title>
	<!-- external link -->
	<c:import  url="externalLink.jsp" />
</head>
<body>
	<!-- navigation bar -->
	<c:import url="navBar.jsp" />
	
	<!-- list of cart item and payment -->
	<c:if test="${cart != null && cart.getSize() != 0 }">
		<c:import url="listCart.jsp" />
		<c:import url="payment.jsp" />
	</c:if>
	
	<c:if test="${cart == null || cart.getSize() == 0}">
	<div style="height: 500px">
		<h1 class="text-center text-success">
			Nothing have been stored in here yet <br>
			Go to <a href="/ListController">Home Page</a> and buy some one please! (^ . ^)
		</h1>
	</div>
	</c:if>
	
	<c:import url="freeText.jsp" />
	
	<!-- footer -->
	<c:import url="footer.jsp" />
</body>
</html>