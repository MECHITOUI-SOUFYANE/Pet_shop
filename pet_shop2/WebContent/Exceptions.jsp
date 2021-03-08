<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Fatal Error</title>
		<link rel="stylesheet" type="text/css" href="css/theme.min.css">
		<link rel="shortcut icon" type="image/png" href="images/p.png"/>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="card text-white bg-danger mb-3" style="max-width: 100%;">
					  <div class="card-header text-center">Error</div>
					  <div class="card-body">
					  	<form action="Home" method="post" id="exceptionForm">
					  		<p class="card-text">The server has detected an error please 
					  			<a style="cursor: pointer;" onclick="document.getElementById('exceptionForm').submit()">click here</a>	
					  		to rediret to home page</p>
					   		<small class="card-text" >All data well be removed </small>
					  	</form>					    
					  </div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>