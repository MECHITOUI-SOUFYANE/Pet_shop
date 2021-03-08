<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" errorPage="Exceptions.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Checkout</title>
		<link rel="stylesheet" type="text/css" href="css/checkout-style.css">
		<link rel="shortcut icon" type="image/png" href="images/p.png"/>
	</head>
	<body>
		<div class="row">
			  <div class="col-75">
		    <div class="container">
		      <form action="payment" method="post">
		      
		        <div class="row">
		          <div class="col-50">
		            <h3>Billing Address</h3>
		            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
		            <input type="text" id="fname" name="firstname" value="${User.login}" placeholder="John M. Doe">
		            <label for="email"><i class="fa fa-envelope"></i> Email</label>
		            <input type="text" id="email" name="email" value="${User.email}" placeholder="john@example.com">
		            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
		            <input type="text" id="adr" name="address" value="${User.adress}" placeholder="542 W. 15th Street">
		            <label for="city"><i class="fa fa-institution"></i> City</label>
		            <input type="text" id="city" name="city" placeholder="New York">
		
		            <div class="row">
		              <div class="col-50">
		                <label for="state">State</label>
		                <input type="text" id="state" name="state" placeholder="NY">
		              </div>
		              <div class="col-50">
		                <label for="zip">Zip</label>
		                <input type="text" id="zip" name="zip" placeholder="10001">
		              </div>
		            </div>
		          </div>
		
		          <div class="col-50">
		            <h3>Payment</h3>
		            <label for="fname">Accepted Cards</label>
		            <div class="icon-container">
		             	 <img alt="" src="images/visa.png">
		           		 <img alt="" src="images/mastercard-logo.png">
		            	 <img alt="" src="images/paypal.png">
		            </div>
		            <label for="cname">Name on Card</label>
		            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
		            <label for="ccnum">Credit card number</label>
		            <input type="number" id="ccnum" name="cardnumber"  class="number" placeholder="1111-2222-3333-4444">
		            
		            <div class="row">
		              <div class="col-50">
		                <label for="expyear">Exp </label>
		                <input type="number"  id="expmounth" class="number" name="expyear" placeholder="MM">/
		                <input type="number"  id="expyear" name="expyear" class="number" placeholder="YY">
		              </div>
		              <div class="col-50">
		                <label for="cvv">CVV</label>
		                <input type="number" id="cvv" class="number" name="cvv" placeholder="352">
		              </div>
		            </div>
		          </div>
		          
		        </div>
		        <label>
		          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
		        </label>
		        <input  id="btn-checkout" type="submit" value="Continue to checkout" class="btn">
		      </form>
		    </div>
		  </div>
		  <div class="col-25">
		    <div class="container">
		      <h4>Cart
		        <span class="price" style="color:black">
		          <i class="fa fa-shopping-cart"></i>
		          <b>${items}</b>
		        </span>
		      </h4>
		      <c:forEach items="${cart}" var ="cart">
		      	<p class="product-name">
		      		${cart.product.name} 
		      		<c:if test="${cart.quantity gt 1}"> (${cart.quantity}) </c:if>
		      		<span class="price">${cart.product.price} $</span>
		      		<br>
		      		<c:if test="${cart.quantity gt 1}"> 
		      	 		<small style="opacity:0.5;margin-top:-2px; color:#ccc ; float:right;">${cart.prix}$</small> 
		      	 	</c:if>
		      	 </p>		      	
		      </c:forEach>
		      <hr>
		      <p>Total &amp; shipping <span class="price" style="color:black"><b>${shoppingTotal}</b></span></p>
		    </div>
		  </div>
		</div>
		<script type="text/javascript" src="js/sweetAlert.js"></script>
		<script type="text/javascript">
		
		    document.getElementById("btn-checkout").addEventListener("click",function(){
		    	Swal.fire({
					  
					  icon: 'success',
					  html:'<b>Payement complet</b>',
					  showCloseButton: false,
					  showCancelButton: false,
					  focusConfirm: false,
					  
					})
		    	
		    })
		    
		    
		     
		</script>
		
		
	</body>
</html>