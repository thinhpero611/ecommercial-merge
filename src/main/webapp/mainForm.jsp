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

if (isUseCookie.equals("true")) {
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
}
%>

<!--  login form  -->
<div class="container">
	<form action="/Login" method="POST">
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
				<input type="text" name="username" placeholder="Username"
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
				<input type="password" name="repeat-password"
					placeholder="Repeat Password" required>
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
					if (error != null) {
						out.println("<p style=\"color: red;\">" + error + "</p>");
					}
					%>
				<%
				} else {
				%>
					<input type="submit" value="Sign Up">					
				<%
				}
				%>
			</div>
			
			
			<div class="col">
				<%
				if (isSignin) {
				%>
				<label>
						<input type="checkbox" size="50" name="remember" value="true">
						Remeberme in next time
				</label>
				<p>Dont't have an account please <a href="/login.jsp?action=signup">Sign up!</a></p> 
				
				<%
				} else {
				%>
				Already have an account. <a href="/login.jsp?action=signin">
					Sign In!</a>
				<%
				}
				%>
			</div>
		</div>
	</form>
</div>