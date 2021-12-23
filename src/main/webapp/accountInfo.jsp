<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ecommercial</title>
<!-- external link -->
<jsp:include page="externalLink.jsp" />
</head>
<body>

	<%@ page
		import="dao.AccountDAO, bean.Account, context.DBContext, java.sql.*"%>
	<%
	Connection conn = new DBContext().getConnection();
	Account acc = new AccountDAO(conn).getAccountInfo((String) session.getAttribute("username"));
	%>
	<!-- Navigation Bar -->
	<jsp:include page="navBar.jsp" />
	<div style="height:300px">
	<table class="table table-hover">
		<tr>
			<th>Name</th>
			<th>Address</th>
			<th>Phone Number</th>
			<th>Email</th>
		</tr>
		<tr>
			<td><%=acc.getName()%></td>
			<td><%=acc.getAddress() == null ? "Not set" : acc.getAddress()%></td>
			<td><%=acc.getPhone() == null ? "Not set" : acc.getPhone()%></td>
			<td><%=acc.getUser()%></td>
		</tr>
	</table>
	</div>
	
	<jsp:include page="freeText.jsp" />
	
	<!--  contact and more information -->
	<jsp:include page="footer.jsp" />
</body>
</html>