<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
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
	<!-- header section -->
	<jsp:include page="header.jsp" />

	<!-- Navigation Bar -->
	<jsp:include page="navBar.jsp" />

	<!--  Search Bar -->
	<jsp:include page="searchBar.jsp" />
	
	<!-- slide show image -->
	<jsp:include page="slideShow.jsp" />

	<!-- the body where all product will be show here -->
	<jsp:include page="body.jsp" />

	<jsp:include page="newsletter.jsp" />

	<!--  contact and more information -->
	<jsp:include page="footer.jsp" />
</body>
</html>