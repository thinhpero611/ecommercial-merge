<!-- initial setting -->
<%

// initial loading is sign in 
boolean isSignin = true;
String action = request.getParameter("action");

// use this to switch between sign in and sign up
if (action != null)
	isSignin = action.equals("signin"); 

// get error state in session
String error = (String)session.getAttribute("error");
String isUseCookie = (String) getServletContext().getAttribute("cookie");
out.println("isUseCookie: "+isUseCookie);

// get username and password in cookie store in local brower
String username = null;
String password = null;
String lastname = null;
String firstname = null;

if (isUseCookie != null && isUseCookie.equals("true")) {
	Cookie cookie = null;
	Cookie[] cookies = null;
	// Get an array of Cookies associated with this domain
	cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			cookie = cookies[i];
			if (cookie.getName().equals("username")) {
				username = cookie.getValue();
			}
			if (cookie.getName().equals("password")) {
				password = cookie.getValue();
			}
		}
	} else {		
	 	response.getWriter().println("<h2> Cookie was not set.</h2>");
	}
} else {
	username = (String) request.getAttribute("username");
	password = (String) request.getAttribute("password");
	firstname = (String) request.getAttribute("firstname");
	lastname = (String) request.getAttribute("lastname");
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