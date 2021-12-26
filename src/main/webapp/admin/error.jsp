<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ecommercial</title>
</head>
<body>
	<c:if test="${error != null }">
		<div class="alert alert-danger">
			<Strong>403</Strong> ${error}
		</div>
	</c:if>
</body>
</html>