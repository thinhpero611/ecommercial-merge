<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String uriForward = (String) request.getAttribute("javax.servlet.forward.request_uri");

%>
<div class="topnav">
	<a href="/home"><i class="fa fa-home">Home</i></a> 
	<a href="#"><i class="fas fa-mobile-alt">Products</i></a> 
	<a href="#"><i class="fa fa-envelope">Contact</i></a>
		
	<!-- if we are not in home page we cannot show the search bar and login -->
	<%
	// get request URI
	String uri = new StringBuffer(request.getRequestURI()).toString();
	response.getWriter().println(uri);
	%>
		<!-- switch between login part and logout part -->
		<c:if test="${username == null }">
			<a href="/login.jsp" class="login"><i
			class="fa fa-fw fa-user">Login</i></a>
		</c:if>
</div>
