<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="Exceptions.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Pet Shop</title>
<link rel="stylesheet" type="text/css" href="css/style2.css" />
<link rel="shortcut icon" type="image/png" href="images/p.png"/>

</head>
<body>
<c:if test="${empty index_home }">
<c:redirect url="/Home?page=index"/>
</c:if>
<div id="wrap">
       
       <%@ include file="template/header.jsp" %>
        
       <div class="center_content">
       	<div class="left_content">
        	
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Featured pets</div>
        
        	<div class="feat_prod_box">
            <div class="prod_img1"><a href="Detail?id=${catalogBrowser.getListProduct().get(0).getIdProduct() }"><img src="<c:out value="${catalogBrowser.getListProduct().get(0).getPicture()}"/>" alt="" title="" border="0" height="100%"width="100%" class="img"/></a></div>
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">${catalogBrowser.getListProduct().get(0).getName()}</div>
                    <p class="details">${catalogBrowser.getListProduct().get(0).getDescription()}</p>
                    <div class="box_bottom"><a href="Detail?id=${catalogBrowser.getListProduct().get(0).getIdProduct() }" class="more">- more details -</a><br/><br/></div>
        </div>
                    
                    
                </div>    
            <div class="clear"></div>
            </div>	
            
            
        	<div class="feat_prod_box">
            
            	<div class="prod_img2"><a href="Detail?id=${ catalogBrowser.getListProduct().get(3).getIdProduct() }"><img src="<c:out value="${catalogBrowser.getListProduct().get(3).getPicture()}"/>" alt="" title="" border="0" height="100%"width="100%"class="img"/></a></div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">${catalogBrowser.getListProduct().get(3).getName()}</div>
                    <p class="details">${catalogBrowser.getListProduct().get(3).getDescription()}</p>
                    
                   
                    
                    
                    <div class="box_bottom"><a href="Detail?id=${ catalogBrowser.getListProduct().get(3).getIdProduct() }" class="more">- more details -</a></div>
                </div>    </div>
            <div class="clear"></div>
            </div>      
            
            <div class="more_p_d"><a href="categories.jsp" class="more_p">&lt;&lt;&lt; show more pets &gt;&gt;&gt;</a></div>
            
            
           <div class="title"><span class="title_icon"><img src="images/bullet2.gif" alt="" title="" /></span>New pets</div> 
           
           <div class="new_products">
           
                    <div class="new_prod_box">
                        <a href="Detail?id=${ catalogBrowser.getListProduct().get(4).getIdProduct() }">${catalogBrowser.getListProduct().get(4).getName()}</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
                        <a href="Detail?id=${catalogBrowser.getListProduct().get(4).getIdProduct() } "><img src="<c:out value="${catalogBrowser.getListProduct().get(4).getPicture()}"/>" alt="" title="" class="thumb" border="0" width="100%"/></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="Detail?id=${ catalogBrowser.getListProduct().get(5).getIdProduct() }">${catalogBrowser.getListProduct().get(5).getName()}</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
                        <a href="Detail?id=${ catalogBrowser.getListProduct().get(5).getIdProduct() }"><img src="<c:out value="${catalogBrowser.getListProduct().get(5).getPicture()}"/>" alt="" title="" class="thumb" border="0" height="100%"width="100%"/></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="Detail?id=${catalogBrowser.getListProduct().get(6).getIdProduct() }">${catalogBrowser.getListProduct().get(6).getName()}</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/new_icon.gif" alt="" title="" /></span>
                        <a href="Detail?id=${catalogBrowser.getListProduct().get(6).getIdProduct() }"><img src="<c:out value="${catalogBrowser.getListProduct().get(6).getPicture()}"/>" alt="" title="" class="thumb" border="0" height="100%"width="100%"/></a>
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
</body>
</html>