<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	if (!uri.equals("/login.jsp")) {
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
		%>
		
		<c:if test="${username == null }">
			<a href="/Controller?action=login" class="login"><i
			class="fa fa-fw fa-user">Login</i></a>
		</c:if>
	<%
	}
	%>
</div>
<c:if test="${username != null }">
	<div class="dropdown float-left">
		<button type="button" class="btn btn-muted dropdown-toggle" data-toggle="dropdown">
			<i class="far fa-user-circle"></i>
		</button>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="/accountInfo.jsp">Email: ${username}</a>
		  	<a class="dropdown-item" href="/ListAllOrders">Show All My Orders</a>
		  	<a class="dropdown-item" href="/Logout">Log Out</a>
		</div>
	</div>
</c:if>