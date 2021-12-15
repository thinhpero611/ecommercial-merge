<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- Add icon library -->
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- global style -->
<link rel="stylesheet" href="Styles/globalStyle.css">

<!-- navigation style -->
<link rel="stylesheet" href="Styles/navBar.css">
<!-- login form style -->
<link rel="stylesheet" href="Styles/loginForm.css">

</head>
<body>
	<!--  navigation Bar with login -->
	<jsp:include page="navBar.jsp" />
	<div class="bg-image">
		<!-- login Form -->
		<jsp:include page="mainForm.jsp" />
	</div>
</body>
<script>
	// click to show password in password input field
	function showPassword() {
		var x = document.getElementById("myInputPw");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
</script>
</html>