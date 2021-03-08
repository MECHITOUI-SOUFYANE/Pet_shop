
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="right_content">
        	
               
                
              <c:if test='${items != 0}'>
	              <div class="cart">
	                  <div class="title">
	                  	<span class="title_icon"><img src="images/cart.gif" alt="" title="" /></span>
	                  	My cart
	                  </div>
	                  <div class="home_cart_content">
	                      ${items} x items | <span class="red">TOTAL: ${total} $</span>
	                  </div>
	                  <form action="cart" id="form2" method="post">
		                 <a  type="submit" style="cursor : pointer;" role="button" onclick="document.getElementById('form2').submit();" class="view_cart">view cart</a>
		              </form>              
	              </div>
              </c:if>
                       
            	
        
        
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>About Our Shop</div> 
             <div class="about">
             <p>
             <img src="images/about.gif" alt="" title="" class="right" />
             Welcome to our shop. Here you will easily find your pet that you want to adopt to add to your life a new and loyal friend, as well as the equipment that he will need in terms of food and housing ...
             </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>Promotions</div> 
                    <div class="new_prod_box">
                        <a href="Detail?id=${catalogBrowser.getListProduct().get(9).getIdProduct() }">${catalogBrowser.getListProduct().get(9).getName()}</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="Detail?id=${catalogBrowser.getListProduct().get(9).getIdProduct() }"><img src="<c:out value="${catalogBrowser.getListProduct().get(9).getPicture()}"/>" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="Detail?id=${catalogBrowser.getListProduct().get(12).getIdProduct()}">${catalogBrowser.getListProduct().get(12).getName()}</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="Detail?id=${catalogBrowser.getListProduct().get(12).getIdProduct()}"><img src="<c:out value="${catalogBrowser.getListProduct().get(12).getPicture()}"/>" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="Detail?id=${catalogBrowser.getListProduct().get(15).getIdProduct()}">${catalogBrowser.getListProduct().get(15).getName()}</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="Detail?id=${catalogBrowser.getListProduct().get(15).getIdProduct()}"><img src="<c:out value="${catalogBrowser.getListProduct().get(15).getPicture()}"/>" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>              
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>Categories</div> 
                
                <ul class="list">
                <li><a href="categories.jsp#accessories">accesories</a></li>
                <li><a href="specials.jsp">specials pets</a></li>
                                                           
                </ul>
                
            </div> 
                
                    
             
                      
             
        
        </div>
