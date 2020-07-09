<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyHome</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="jumbotron text-center" style="margin-bottom:0">
		<h1>MyHome Page</h1>
		<p>Welcome to MyHome Page</p>
	</div>
	<!-- navbar -->
	<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
	  <ul class="navbar-nav">
	    <li class="nav-item active">
	      <a class="nav-link" href="index.jsp">Home</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="member/signup.jsp">SignUp</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="login/sigin.jsp">SignIn</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="member/members.jsp">Members</a>
	    </li>
	  </ul>
	</nav>
	<!-- navbar  -->
	<div class="container" style="margin-top:30px;margin-bottom:30px">
		<div class="row" style="height:450px">
			<div class="col-md-3">
				<ul class="list-group">
					<li class="list-group-item"><a href="#">Menu1</a></li>
					<li class="list-group-item"><a href="#">Menu2</a></li>
					<li class="list-group-item"><a href="#">Menu3</a></li>
					<li class="list-group-item"><a href="#">Menu4</a></li>
				</ul>
			</div>
			<div class="col-md-9 text-center">
				<h2>Contents Title</h2>
				<h4>Sub Title</h4>
			</div>
		</div>
	</div>
	<footer class="jumbotron text-center">
		<p>Footer Copyright by chan</p>
	</footer>
</div>
</body>
</html>