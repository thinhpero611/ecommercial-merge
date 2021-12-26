<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<div class="d-md-flex flex-md-row">
	<c:forEach var="product" items="${popularProduct}" end="3"
		varStatus="row">
		<div class="mycard">
			<div class="img">
				<a
					href="<c:url value="/InformationProduct?id=${product.getId()}" />">
					<img src="${product.getSrc()}" alt="${product.getName()}" />
				</a>
			</div>
			<h6 class="text-center mt-2">${product.getName()}</h6>
			<p class="text-center"><i class="fas fa-dollar-sign"></i>${product.getPrice()}</p>
		</div>
	</c:forEach>
</div>