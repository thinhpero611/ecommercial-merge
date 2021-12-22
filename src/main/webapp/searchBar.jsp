<div class="d-flex flex-row search-container">
	<div class="dropdown">
		<button type="button"
			class="btn btn-white dropdown-toggle text-success"
			data-toggle="dropdown">Category</button>
		<div class="dropdown-menu">
			<h5 class="dropdown-header text-success">Dropdown header</h5>
			<a class="dropdown-item text-success" href="#">Link 1</a> <a
				class="dropdown-item text-success" href="#">Link 2</a> <a
				class="dropdown-item" href="#">Link 3</a>
			<h5 class="dropdown-header text-success">Dropdown header</h5>
			<a class="dropdown-item text-success" href="#">Another link</a>
		</div>
	</div>
	<div>
		<form class="form-row" action="/SearchController">
			<div class="col">
				<input type="text" class="form-control form-control"
					placeholder="Search.." name="search" style="width: 60vw">
			</div>
			<div class="col">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</form>
	</div>
	<div class="ml-auto">
		<i class="fa fa-cart-arrow-down text-danger"></i>
		<a href="cart.jsp" class="btn btn-outline-danger">Cart Store</a>
	</div>
</div>