<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="Exceptions.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Pet Shop</title>
	<link rel="stylesheet" type="text/css" href="css/style2.css" />
	<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
	<link rel="shortcut icon" type="image/png" href="images/p.png"/>
	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/java.js"></script>
</head>
<body>
<c:if test="${empty details_home }">
<c:redirect url="/Detail"/>
</c:if>
<div id="wrap">
       
       
            <%@ include file="template/header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="Home">home</a> &gt;&gt; ${currentProduct.getName()}
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>${currentProduct.getName()}</div>
        
        	<div class="feat_prod_box_details">
            
            	<div class="prod_img1"><a href="#"><img src="<c:out value="${currentProduct.getPicture()}"/>" alt="" title="" border="0" width="110%" height="150%" class="img"/></a>
                
                </div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">Details</div>
                    <p class="details">${currentProduct.getDescription() }</p><br />${currentProduct.getDetails()}<br/>
                   <div class="price"><strong>PRICE:</strong> <span class="red">${currentProduct.getPrice()}$</span></div>
                  <form action="order" id="form" method="post">
	                        <input type="hidden" name="product" value="${currentProduct.idProduct}"/>
	                    	<img src="images/order_now.gif" alt="" title="" border="0"  role="button" class="more"  onclick="document.getElementById('form').submit();"/>
	                    </form>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            
              <br /><br />
                
            <div id="demo" class="demolayout">

                <ul id="demo-nav" class="demolayout">
                <li><a class="active" href="#tab1">More details</a></li>
                <li><a class="" href="#tab2">Related books</a></li>
                </ul>
    
            <div class="tabs-container">
            
                    <div style="display: block;" class="tab" id="tab1">
                                        <p class="more_details">${currentProduct.getAdvices()}  </p>
                                                      
                    </div>	
                    
                            <div style="display: none;" class="tab" id="tab2">
                   
                    
                   

                  <c:forEach items="${relatedbooks}" var="element">
                 
                        <div class="new_prod_box">
                        <a href="Detail?id=${element.getIdProduct() }"><c:out value="${element.getName()}"/></a>
                        <div class="new_prod_bg">
                        <a href="Detail?id=${element.getIdProduct() }"><img src="<c:out value="${element.getPicture() }"/>" width="100%" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>  
             </c:forEach>
            
                    <div class="clear"></div>
                            </div>	
            
            </div>


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
      <script type="text/javascript">

var tabber1 = new Yetii({
id: 'demo'
});

</script>
      
</body>


</html>