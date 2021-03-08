<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="Exceptions.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Pet Shop</title>
<link rel="stylesheet" type="text/css" href="css/style2.css" />
<link rel="shortcut icon" type="image/png" href="images/p.png"/>
</head>
<body>
<div id="wrap">

       <%@ include file="template/header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My cart</div>
        
        	<div class="feat_prod_box_details">
            
            <table class="cart_table">
            	<tr class="cart_title">
                	<td>Item pic</td>
                	<td>Book name</td>
                    <td>Unit price</td>
                    <td>Qty</td>
                    <td>Total</td>               
                </tr>
                
                <c:forEach items="${cart}" var ="cart">
                	<tr>
	                	<td><a href="Detail?id=${cart.product.getIdProduct() }"><div style=" width:37px;height:35px;"><img src="<c:out value="${cart.product.getPicture() }"/>" alt="" title="" border="0" class="cart_thumb" width="100%" Height="100%"/></div></a></td>
	                	<td>${cart.product.name}</td>
	                    <td>${cart.product.price}</td>
	                    <td>${cart.quantity}</td>
	                    <td>${cart.prix} $</td>               
	                </tr>   
                </c:forEach>
            	       
            	
                <tr>
                <td colspan="4" class="cart_total"><span class="red">TOTAL SHIPPING:</span></td>
                <td> ${shopping}$</td>                
                </tr>  
                
                <tr>
                <td colspan="4" class="cart_total"><span class="red">TOTAL:</span></td>
                <td> ${shoppingTotal}$</td>                
                </tr>                  
            
            </table>
            <form action="verify" method="post" id="verify">
            	<input  class="continue" style ="background-color:green; color : white;" type="submit"  name="continue"  value="&lt; continue"  >
            	<input  class="checkout" style ="background-color:green; color : white; float : right;" type="submit" name="checkout" value = "checkout"  />
            </form>

            </div>	
            
              

            

            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <%@ include file="template/right_content.jsp" %>
       <!--end of right content-->

       <div class="clear"></div>
       </div><!--end of center content-->
        <%@ include file="template/footer.html" %>
     
</div>

      <%@ include file="template/script.html" %>
</body>
</html>