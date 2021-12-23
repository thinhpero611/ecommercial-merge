<div class="d-md-flex flex-md-row search-container">
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
</div>