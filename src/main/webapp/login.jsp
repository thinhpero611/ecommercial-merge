<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ecommercial</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<!-- external link -->
<jsp:include page="externalLink.jsp" />

<!-- login Form style -->
<link rel="stylesheet" href="/Styles/loginForm.css" />

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