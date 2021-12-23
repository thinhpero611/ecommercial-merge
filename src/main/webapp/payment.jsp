<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${username != null }">
	<!-- complete payment -->
	<div class="container-fluid">
		<h2 class="text-center text-success">Complete Payment</h2>
		<form action="<c:url value="/Payment?" />" method="POST">
			<div class="form-group">
				<label for="address">Address:</label> <input type="text" value="${ address}"
					name="address" class="form-control" placeholder="Enter your Adress"
					id="address">
			</div>
			<div class="form-group">
				<label for="Pnumber">Phone Number: </label> <input type="text" value="${phoneNumber }"
					name="phoneNumber" class="form-control"
					placeholder="Enter your phone number" id="Pnumber">
			</div>
			<div class="form-group">
				<label for="discount">Discount (code):</label> <input type="text"
					name="discount" class="form-control"
					placeholder="Enter discount code" id="discount">
			</div>
			<button type="submit" class="btn btn-danger">Purchase</button>
		</form>
	</div>
</c:if>

<c:if test="${username == null }">
	<div style="height: 500px">
		<h2 class="text-danger text-center m-5">
			Please <a href="login.jsp" class="text-warning"><strong>Log
					In</strong></a> to Complete our payment !
		</h2>
	</div>
</c:if>

