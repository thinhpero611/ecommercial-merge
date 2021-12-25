<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="d-md-flex flex-md-row search-container mt-5">
	<div class="dropdown">
		<button type="button"
			class="btn btn-white dropdown-toggle text-success"
			data-toggle="dropdown">Category</button>
		<div class="dropdown-menu">
			<h5 class="dropdown-header text-success">CellPhone</h5>
			<a class="dropdown-item text-success" href="/SearchController?search=iPhone 11">i Phone 11</a> 
			<a class="dropdown-item text-success" href="/SearchController?search=iPhone X">i Phone X</a> 
			<a class="dropdown-item text-success" href="/SearchController?search=iPhone 8">i Phone 8</a>
			<a class="dropdown-item text-success" href="/SearchController?search=iPhone 7">i Phone 7</a>
		</div>
	</div>
	<div>
		<form class="form-row" action="/SearchController">
			<div class="col">
				<input type="text" class="form-control form-control"
					placeholder="Search.." name="search" style="width: 60vw" value="${keyword}">
			</div>
			<div class="col">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</form>
	</div>
	<div class="ml-auto">
		<a href="cart.jsp" class="btn btn-outline-danger">
		<i class="fa fa-cart-arrow-down text-danger"></i>
		Cart Store<span class="badge badge-warning">${cart.getSize()}</span></a>
	</div>
	<c:if test="${username != null }">
	<div class="dropdown">
		<button type="button" class="btn btn-muted dropdown-toggle" data-toggle="dropdown">
			<i class="far fa-user-circle"></i>
		</button>
		<div class="dropdown-menu" style="transform: translate3d(-189px, 41px, 0px);">
			<a class="dropdown-item" href="/accountInfo.jsp">Email: ${username}</a>
		  	<a class="dropdown-item" href="/ListAllOrders">Show All My Orders</a>
		  	<a class="dropdown-item" href="/Logout">Log Out</a>
		</div>
	</div>
</c:if>
</div>