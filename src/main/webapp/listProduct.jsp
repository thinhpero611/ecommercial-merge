<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<c:if test="${!products.isEmpty()}">
<c:set var="gridWidth" value="3" />
<!-- 	<table> -->
		<c:forEach var="product" items="${products}" varStatus="row">
			<c:if test="${row.index % gridWidth == 0 }">
<!-- 				<tr> -->
			<div class="col-sm-4">
			</c:if>
			
			<td><my:card product="${product}" /></td>
			
			<c:if test="${(row.index + 1) % gridWidth == 0 }">
<!-- 				</tr> -->
			</div>
			</c:if>
		</c:forEach>
<!-- 	</table> -->
</c:if>

<!-- if not found any product show this part -->
<c:if test="${products.isEmpty()}">
	<div style="height: 300px">
		<h2 class="text-center text-danger">
			Sorry We Can't Find Any product in store! Please try an other <strong>key
				word</strong>
		</h2>
	</div>
</c:if>