<%
String uriForward = (String) request.getAttribute("javax.servlet.forward.request_uri");

%>
<div class="topnav">
	<a href="/ListController"><i class="fa fa-home">Home</i></a> 
	<a href="#"><i class="fas fa-mobile-alt">Products</i></a> 
	<a href="#"><i class="fa fa-envelope">Contact</i></a>
		
	<!-- if we are not in home page we cannot show the search bar and login -->
	<%
	// get request URI
	String uri = new StringBuffer(request.getRequestURI()).toString();
	response.getWriter().println(uri);
	if (uri.equals("/home.jsp") || uri.equals("/product.jsp")) {
	%>

		<!-- switch between login part and logout part -->
		<%
		String isUseCookie = (String)getServletContext().getAttribute("cookie");
		String username = null;
		
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
				}
			}
		} else {
			username = (String)session.getAttribute("username");
		}
		
		if (username != null) {
		%>
		<a href="/Logout" class="logout">Logout</a> <a href="/accountInfo.jsp" class="user"><i
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