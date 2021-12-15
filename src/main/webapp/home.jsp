<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Home</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<!-- Add icon library -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- header style -->
	<link rel="stylesheet" href="Styles/header.css">
	
	<!-- navigation bar style -->
	<link rel="stylesheet" href="Styles/navBar.css">
	
	<!-- body style -->
	<link rel="stylesheet" href="Styles/body.css">
	
	<!-- footer style -->
	<link rel="stylesheet" href="Styles/newsletter.css">
	<link rel="stylesheet" href="Styles/footer.css">
	
	<!-- global style -->
	<link rel="stylesheet" href="Styles/globalStyle.css">
	<style>
		.phone-bg {
			margin: 0px -8px;
			margin-top: 20px;
		}
		.phone-bg img {
			height: 600px;
			width: 100%;
	 		object-fit: cover;
		}
		.sticky + .phone-bg {
			padding-top: 60px;
		}
	</style>
</head>
<body>
<!-- header section -->
<jsp:include page="header.jsp" />

<!-- Navigation Bar -->
<jsp:include page="navBar.jsp" />

<!-- a sample product image background -->
<div class="phone-bg">
	<img src="image/apple-future-iphone-11.jpg" alt="iphone-picture"/>
</div>


<!-- the body where all product will be show here -->
<jsp:include page="body.jsp" />

<jsp:include page="newsletter.jsp" />

<!--  contact and more information -->
<jsp:include page="footer.jsp" />
</body>
	<script>
	window.onscroll = function() {myFunction()};
	
	var navbar = document.getElementsByClassName("topnav")[0];
	console.log(navbar);
	var sticky = navbar.offsetTop;
	
	function myFunction() {
	  if (window.pageYOffset >= sticky) {
	    navbar.classList.add("sticky")
	  } else {
	    navbar.classList.remove("sticky");
	  }
	}
	</script>
</html>