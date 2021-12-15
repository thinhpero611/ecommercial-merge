<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	
	<!-- Add icon library -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- header style -->
	<link rel="stylesheet" href="Styles/header.css">
	<link rel="stylesheet" href="Styles/globalStyle.css">
	
	<!-- login form style -->
	<link rel="stylesheet" href="Styles/loginForm.css">
	<link rel="stylesheet" href="Styles/navBar.css">
</head>
<body>
<jsp:include page = "header.jsp" />

<!--  navigation Bar with login -->
<jsp:include page="navBar.jsp" />

   <!--  login form  -->
<div class="container">
	<form action="/Login">
  		<div class="row">
  		<%
  			String action = request.getParameter("action");
  			boolean isSignup = action.equals("signup");
  			if (isSignup) {
  		%>
  			<h1>Sign Up</h1>
  		<% } else {%>
  			<h1>Sign In</h1>
  		<% }  %>
	    	<div class="col">
	        	<input type="text" name="username" placeholder="Username" value="thinh" required autofocus>
	        	<input type="password" id="myInputPw" name="password" placeholder="Password" value="123456" required>
	        	<label><input type="checkbox" onclick="showPassword()" size="50">ShowPassword </label>
	        	<% if (isSignup) { %>
	        	<input type="password" name="repeat-password" placeholder="Repeat Password" required>
	        	<%}%>
	     	</div>
	     	
	    	<div class="col">
	        	<a href="#" class="fb btn">
	          		<i class="fa fa-facebook fa-fw"></i> Login with Facebook
	        	</a>
	        	<a href="#" class="twitter btn">
	          		<i class="fa fa-twitter fa-fw"></i> Login with Twitter
	        	</a>
	        	<a href="#" class="google btn">
	          		<i class="fa fa-google fa-fw"></i> Login with Google+
	        	</a>
	    	</div>
			<div class="col">
	    	<% if (isSignup) { %>
	        	<input type="submit" value="Sign Up">
	        	<%} else { %>
	        	<input type="submit" value="Log In">
	        	<% } %>
			</div>
		</div>
	</form>
</div>

<div class="bottom-container" style="margin-top: 15px;">
  <div class="row">
    <div class="col">
    <% if (isSignup) { %>
    Already have an account. 
    <a href="/login.jsp?action=signin"> Sign In!</a>
    <%} else { %>
    	Dont't have an account please
      <a href="/login.jsp?action=signup"> Sign up!</a>
    <%} %>
    </div>
    <div class="col">
      <a href="#"  class="btn">Forgot password?</a>
    </div>
  </div>
</div>
</body>
<script>
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