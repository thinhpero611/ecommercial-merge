<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User's Information</title>
<!-- Add icon library -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<!-- navigation bar style -->
	<link rel="stylesheet" href="Styles/navBar.css">
	<!-- footer style -->
	<link rel="stylesheet" href="Styles/footer.css">
	
	<!-- global style -->
	<link rel="stylesheet" href="Styles/globalStyle.css">
</head>
<body>

<%@ page import="dao.AccountDAO, bean.Account, context.DBContext, java.sql.*" %>
  	<%
  	Connection conn = new DBContext().getConnection();
  	Account acc = new AccountDAO(conn).getAccountInfo((String)session.getAttribute("username")); 
  	%>
  	<!-- Navigation Bar -->
<jsp:include page="navBar.jsp" />
  	Name: <%= acc.getName() %><br>
  	Address: <%= acc.getAddress() %><br>
  	Phone Number: <%= acc.getPhone() %><br>
  	Email: <%= acc.getUser() %>
  	<!--  contact and more information -->
<jsp:include page="footer.jsp" />
</body>
</html>