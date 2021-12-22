<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Add icon library -->
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- header style -->
<link rel="stylesheet" href="Styles/header.css">
<link rel="stylesheet" href="Styles/navBar.css">
<link rel="stylesheet" href="Styles/searchBar.css">

<!-- body style -->
<link rel="stylesheet" href="Styles/body.css">

<!-- footer style -->
<link rel="stylesheet" href="Styles/newsletter.css">
<link rel="stylesheet" href="Styles/footer.css">

<!-- global style -->
<link rel="stylesheet" href="Styles/globalStyle.css">
</head>
<body>
	<!-- navigation bar -->
	<c:import url="navBar.jsp" />
	
	<!-- orders table -->
	<c:if test="${orders != null && orders.size() != 0 }">
		<c:import url="showOrders.jsp" />
	</c:if>
	
	<c:if test="${orders == null && orders.size() == 0}">
		<div style="height: 500px">
			<h1 class="text-center text-success">
				You haven't order any thing yet! <br> Go to <a
					href="/ListController">Home Page</a> and buy some one please! (^ .
				^)
			</h1>
		</div>
	</c:if>
	
	<c:import url="freeText.jsp" />
	
	<!-- footer -->
	<c:import url="footer.jsp" />
	
	
</body>
</html>