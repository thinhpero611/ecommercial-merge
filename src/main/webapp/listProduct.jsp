<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>

<c:set var="gridWidth" value="4"/>
<table>
	<c:forEach var="product" items="${products}" varStatus="row">
		<c:if test="${row.index % gridWidth == 0 }">
			<tr>
		</c:if>
		<!-- 		<div class=".col-sm-4" style="width: 300px; height: 400px;"> -->
		<td><my:card product="${product}" /></td>
		<!-- 		</div> -->
		<c:if test="${(row.index + 1) % gridWidth == 0 }">
			</tr>
		</c:if>
	</c:forEach>
</table>