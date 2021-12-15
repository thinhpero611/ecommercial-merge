<%
String isUseCookie = (String)getServletContext().getAttribute("cookie");
String username = null;

// if cookie is was set to browser
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
	// using session storage
	username = (String)session.getAttribute("username");
}
%>