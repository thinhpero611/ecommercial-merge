<div class="topnav">
	<a href="home.jsp"><i class="fa fa-home">Home</i></a>
	<a href="#"><i class="fas fa-mobile-alt">Products</i></a>
	<a href="#"><i class="fa fa-envelope">Contact</i></a>
	<%
	String uriForward= (String) request.getAttribute("javax.servlet.forward.request_uri");
	// get request URI
	String uri = new StringBuffer(request.getRequestURI()).toString();
	
	String username = null;
	Cookie cookie = null;
	Cookie[] cookies = null;
	// Get an array of Cookies associated with this domain
	cookies = request.getCookies();
	if( cookies != null ){
//       out.println("<h2> Found Cookies Name and Value</h2>");
      for (int i = 0; i < cookies.length; i++){
         cookie = cookies[i];
         if (cookie.getName().equals("username")) {
        	 username = cookie.getValue();
         }
      }
	}
	if (uri.equals("/home.jsp")) {
	%>
	<div class="search-container">
	    <form action="">
	    	<input type="text" placeholder="Search.." name="search">
	    	<button type="submit"><i class="fa fa-search"></i></button>
		</form>
	</div>
	<% if (username != null) { %>
		<a href="/Logout" class="logout">Logout</a>
		<a class="user"><i class="far fa-user-circle"><%= username %></i></a>
	<% }  else { %>
		<a href="/Controller?action=login" class="login"><i class="fa fa-fw fa-user">Login</i></a>
	<% }} %>
</div>