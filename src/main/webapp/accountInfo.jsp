<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ecommercial</title>
<!-- external link -->
<jsp:include page="externalLink.jsp" />

<body>
	<!-- Navigation Bar -->
	<jsp:include page="navBar.jsp" />
	
	<!-- show error if it has to this page -->
	<c:if test="${error != null }">
		<div class="alert alert-danger"><strong>Error</strong>${error}</div>
	</c:if>
	
	<!-- show parameter action using jstl -->
<%-- 	<c:out value="${param['action']}" /> --%>
	
	<div class="table-responsive" style="height:300px">
	<table class="table table-hover">
		<tr>
			<th>Name</th>
			<th>Password</th>
			<th>age</th>
			<th>Address</th>
			<th>Phone Number</th>
			<th>Email</th>
		</tr>
	<c:if test="${param['action'] == null }">
		<tr>
			<td>${account.getName() }</td>
			<td>${account.getPassword()}</td>
			<td>${account.getAge()}</td>
			<td>${account.getAddress()}</td>
			<td>${account.getPhone()}</td>
			<td>${account.getUser()}</td>
			<td><a href="/accountInfo.jsp?action=update"><i class="fas fa-wrench"></i></a></td>
		</tr>
	</c:if>
	
	<!-- user do update action on this page -->
	<c:if test="${param['action'] == 'update' }">
		<form action="/AccountController" method="post">
			<tr>
				<td><input type="text" name="name" value="${account.getName() }" /></td>
				<td><input type="text" name="password" value="${account.getPassword()}" /></td>
				<td><input type="text" name="age" value="${account.getAge()}" /></td>
				<td><input type="text" name="address" value="${account.getAddress()}" /></td>
				<td><input type="text" name="phone" value="${account.getPhone()}" /></td>
				<td><input type="text" name="mail" value="${account.getUser()}" /></td>
				<input type="hidden" name="action" value="update" />
				<td><button type="submit">modify all<i class="fas fa-check"></i></button></td>
			</tr>
		</form>
	</c:if>
	</table>
	</div>

	<jsp:include page="freeText.jsp" />
	
	<!--  contact and more information -->
	<jsp:include page="footer.jsp" />
</body>
</html>