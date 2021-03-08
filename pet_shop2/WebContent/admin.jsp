<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="Exceptions.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Administration</title>
		<link rel="stylesheet" type="text/css" href="css/theme.min.css">		
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
		<link rel="stylesheet" type="text/css" href="css/adminStyle.css">
		<link rel="shortcut icon" type="image/png" href="images/p.png"/>
	</head>
	<body>
		<!-- Vertical navbar -->
		<div class="vertical-nav bg-primary" id="sidebar">
		  <div class="py-4 px-3 mb-4 bg-primary">
		    <div class="media d-flex align-items-center"><img src="images/admin.png" alt="..." width="65" class="mr-3 rounded-circle img-thumbnail shadow-sm">
		      <div class="media-body">
		        <h4 class="m-0 text-white">Admin</h4>
		        <p class="font-weight-light text-muted text-white mb-0">Web developer</p>
		      </div>
		    </div>
		  </div>
		
		  <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Main</p>
		
		  <ul class="nav flex-column bg-primary mb-0">
		    <li class="nav-item">
		      <a href="index.jsp" class="nav-link text-white font-italic ">
		                <i class="fa fa-th-large mr-3 text-info fa-fw"></i>
		                Home
		            </a>
		    </li>
		    <li class="nav-item">
		      <a href="#allShopping" class="nav-link text-white font-italic">
		                <i class="fas fa-shopping-cart mr-3 text-info fa-fw"></i>
		                All Shopping
		            </a>
		    </li>
		    <li class="nav-item users">
		      <a href="#Connected-users" class="nav-link  text-white font-italic">
		                <i class="fas fa-users online mr-3 text-info fa-fw"></i>
		                Online users
		            </a>
		    </li>
		    
		    <li class="nav-item">
		      <a href="#All-users" class="nav-link  text-white font-italic">
		                <i class="fas fa-users mr-3 text-info fa-fw"></i>
		                All users
		            </a>
		    </li>
		    
		  </ul>
		  <ul class="nav flex-column justify-content-end bg-primary mb-0">
		    <li class="nav-item">
		      <form action="logout" method="post"  id="form-logout">
		           <input type="hidden" name="logout">
		           <a style="cursor: pointer ;" class="nav-link text-white font-italic" type="submit" role="button" onclick='document.getElementById("form-logout").submit();'>
		                <i class="fas fa-sign-out-alt mr-3 text-info fa-fw"></i>
		                Logout
		            </a>		           		      	
		      </form>
		    </li>
		  </ul>
		</div>
		<!-- End vertical navbar -->
		
		
		<!-- Page content holder -->
		<div class="page-content p-5" id="content">
		  <!-- Toggle button -->
		  <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4"><i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold">Toggle</small></button>
		
		  <!-- Demo content -->
		  
		  
		  <c:choose>
		  	<c:when test="${!show}">
		  		<%@ include file ="template/main.html" %>
		  	</c:when>	  	
		  	<c:when test="${show}">
		  		<%@ include file ="template/show.html" %>
		  	</c:when>
		  </c:choose>
		</div>  
		<!-- End demo content -->
		
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.bunlde.min.js"></script>
		<script type="text/javascript">
		$(function() {
			  // Sidebar toggle behavior
			  $('#sidebarCollapse').on('click', function() {
			    $('#sidebar, #content').toggleClass('active');
			  });
			});
		     $('.nav-item').hover(function(){
		    	 $(this).css('background-color','#041828');
		    	 
		     },function(){
		    	 $(this).css('background-color','#2c3e50')
		     })
		     $('.users').hover(function(){
			    	 $(".online").removeClass("text-info");
			    	 $(".online").addClass("text-success");
			    	 
			     },function(){
			    	 $(".online").removeClass("text-success");
			    	 $(".online").addClass("text-info");
			     })
		     
		</script>
	</body>
</html>