<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
	<!-- external link -->
	<jsp:include page="externalLink.jsp" />
</head>
<body>
	<!-- header section -->
	<jsp:include page="header.jsp" />

	<!-- Navigation Bar -->
	<jsp:include page="navBar.jsp" />

	<!--  Search Bar -->
	<jsp:include page="searchBar.jsp" />
	

	<!-- the body where all product will be show here -->
	<jsp:include page="body.jsp" />

	<!-- slide show image -->
	<jsp:include page="slideShow.jsp" />
	
	<jsp:include page="newsletter.jsp" />

	<!--  contact and more information -->
	<jsp:include page="footer.jsp" />
</body>
</html>