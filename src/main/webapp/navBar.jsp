<%
String uriForward = (String) request.getAttribute("javax.servlet.forward.request_uri");
%>
<div class="topnav">
	<a href="home.jsp"><i class="fa fa-home">Home</i></a> <a href="#"><i
		class="fas fa-mobile-alt">Products</i></a> <a href="#"><i
		class="fa fa-envelope">Contact</i></a>
		
	<!-- if we are not in home page we cannot show the search bar and login -->
	<%
	// get request URI
	String uri = new StringBuffer(request.getRequestURI()).toString();
	if (uri.equals("/home.jsp")) {
	%>
		<div class="search-container">
			<form action="">
				<input type="text" placeholder="Search.." name="search">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
		<!-- switch between login part and logout part -->
		<%
		String isUseCookie = (String)getServletContext().getAttribute("cookie");
		String username = null;
		
		if (isUseCookie != null)
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
				}
			}
		} else {
			username = (String)session.getAttribute("username");
		}
		
		if (username != null) {
		%>
		<a href="/Logout" class="logout">Logout</a> <a class="user"><i
			class="far fa-user-circle"><%=username%></i></a>
		<%
		} else {
		%>
		<a href="/Controller?action=login" class="login"><i
			class="fa fa-fw fa-user">Login</i></a>
		<%
		}
		%>
	<%
	}
	%>
</div>