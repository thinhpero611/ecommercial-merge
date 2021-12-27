<!-- initial setting -->
<%
// initial loading is sign in 
boolean isSignin = true;
String action = request.getParameter("action");
out.println(action);
// initial using cookie is true
boolean isUseCookie = true;

// if send request to server
if (action != null) isUseCookie = false;

String username = null;
String password = null;
String firstname = (String) request.getAttribute("firstname");
String lastname = (String) request.getAttribute("lastname");
String error = (String)request.getAttribute("error");

// use this to switch between sign in and sign up
if (action != null && action.equals("signup")) {
	isSignin = false;
	username = (String) request.getAttribute("username");
	password = (String) request.getAttribute("password");
	error = (String)request.getAttribute("error");
	
} else {
// get username and password in cookie store in local brower to login
Cookie[] cookies = request.getCookies();
if (isUseCookie && cookies != null) {
	for (Cookie retrievedCookie : cookies) {
		if (retrievedCookie.getName().equals("username")) {
			username = retrievedCookie.getValue();
		}
		if (retrievedCookie.getName().equals("password")) {
			password = retrievedCookie.getValue();
		}
	} 
} else {
	username = (String) request.getAttribute("username");
	password = (String) request.getAttribute("password");
}
}
%>

<!--  login form  -->
<div class="container">
	<form action="<%= isSignin ? "/Login" : "/Signup" %>" method="POST">
		<div class="row">
			<%
			if (isSignin) {
			%>
			<h1>Sign In</h1>
			<%
			} else {
			%>
			<h1>Sign Up</h1>
			<%
			}
			%>
			<div class="col">
				<input type="hidden" name="action" value="signin">
				<input type="text" name="username" placeholder="Email"
					value="<%= username != null ? username : "" %>" required autofocus> 
				<input type="password"
					id="myInputPw" name="password" placeholder="Password"
					value="<%= password != null ? password : "" %>" required> 
				<label>
					<input type="checkbox" onclick="showPassword()" size="50">
					ShowPassword
				</label>
				<%
				if (!isSignin) {
				%>
				<input type="password" name="repeatPassword"
					placeholder="Repeat Password"  required>
				<input type="text" name="firstname" value="<%= firstname != null ? firstname : "" %>" placeholder="Your FirstName" required>
				<input type="text" name="lastname" value="<%= lastname != null ? lastname : "" %>" placeholder="your LastName" required> 
				<%
				}
				%>
			</div>
			
			<!-- Submit button -->
			<div class="col">
				<%
				if (isSignin) {
				%>
					<input type="submit" value="Log In">
					<!-- error message go here. -->
				<%
				} else {
				%>
					<input type="submit" value="Sign Up">					
				<%
				}
				%>
					<%
					if (error != null) {
						out.println("<p style=\"color: red;\">" + error + "</p>");
					}
					%>
			</div>
			
			
			<div class="col">
				<%
				if (isSignin) {
				%>
				<p>Dont't have an account please <a href="/login.jsp?action=signup">Sign up!</a></p> 
				
				<%
				} else {
				%>
				Already have an account. <a href="/login.jsp?action=signin">
					Sign In!</a>
				<%
				}
				%>
				<label>
						<input type="checkbox" size="50" name="remember" value="true">
						Remeberme in next time
				</label>
			</div>
		</div>
	</form>
</div>