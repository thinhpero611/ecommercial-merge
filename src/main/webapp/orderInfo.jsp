<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ecommercial</title>
	<!-- external link -->
	<c:import url="externalLink.jsp" />
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