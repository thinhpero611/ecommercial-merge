<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Bootstrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- icon library -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	
	 /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
	 .row.content {height: 550px}
	 
	 /* Set gray background color and 100% height */
	 .sidenav.my-pic {
	   background-image: url("/../image/bg-image3.jpg");
	   background-repeat: repeat;
	   height: 100%;
	   object-fit: cover;
	 }
	     
	 /* On small screens, set height to 'auto' for the grid */
	 @media screen and (max-width: 767px) {
	   .row.content {height: auto;} 
	 }
	</style>
</head>
<body>

<nav class="navbar navbar-inverse visible-xs">
	<div class="container-fluid">
    	<div class="navbar-header">
      		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>                        
      		</button>
      		<a class="navbar-brand" href="#">AWESOME TEAM</a>
    	</div>
    	<div class="collapse navbar-collapse" id="myNavbar">
      		<ul class="nav navbar-nav">
        		<li class="active"><a href="#">Dashboard</a></li>
        		<li><a href="#">User Profile</a></li>
		        <li><a href="#">Table</a></li>
		        <li><a href="#">Maps</a></li>
		        <li><a href="#">Icons</a></li>
		        <li><a href="#">Notifications</a></li>
			</ul>
    	</div>
  	</div>
</nav>

<div class="container-fluid">
	<div class="row content">
		<!-- side navigation -->
    	<jsp:include page="sidenav.jsp" />
    	
    	<%@ include file="switchLoginAndLogoutLogic.jsp" %>
      	<% 
      	String user = (String) session.getAttribute("username");
      	if (user != null) { %>
    	<div class="col-sm-9" style="background: #0072B5;">
    	
      		<div class="row">
      			<div class="col-sm-8">
	        		<h2><b>Dashboard</b></h2>
	        		<h4>Dreamming Company and A Big Mind Ever</h4>
      			</div>
      			<!-- switch between login part and logout part -->
      			
      			<div class="col-sm-4 well bg-info">
      				<ul class="nav nav-pills">
      					<li><a href="/ListController"><span class="glyphicon glyphicon-home"></span>Home</a></li>
      					<Li><a class=""><i class="far fa-user-circle"><%= user %></i></a></Li>
      					<li><a href="/Logout" class="logout">Logout</a></li>
      				</ul>
      			</div>
      		</div>
      		
      		<!-- fake statistic information about product sale -->
		    <jsp:include page="statistic.jsp" />
	  		
	  		<!-- fake table of user -->
		    <jsp:include page="table.jsp" />
			
			<!-- fake progress bar -->
			<jsp:include page="progress.jsp" />
		</div>
		<%} else {%>
		<!-- send alert message to client -->
		<div class="alert alert-danger">
    		<strong>Warning!</strong> You don't have permission to access this page.<br>
  		</div>
  		
  		<!-- redirect to home page -->
  		<div class="text-center">
    		<h2><a href="/ListController">this</a> will send you to home page. Thanks!</h2>
  		</div>
		<% } %>	
	</div>
</div>

</body>
</html>
