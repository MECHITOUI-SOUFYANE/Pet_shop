<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="Exceptions.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Pet Shop</title>
<link rel="stylesheet" type="text/css" href="css/style2.css" />
<link rel="shortcut icon" type="image/png" href="images/p.png"/>

</head>
<body>
<c:if test="${empty specials_home }">
<c:redirect url="/Home?page=specials"/>
</c:if>
<div id="wrap">

      
             <%@ include file="template/header.jsp" %>
       
       <div class="center_content">
       	<div class="left_content">
        	
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Special gifts</div>
        
        	<div class="feat_prod_box">
            
            	<div class="prod_img1"><a href="Detail?id=${catalogBrowser.getListProduct().get(4).getIdProduct () }"><img src="<c:out value="${catalogBrowser.getListProduct().get(4).getPicture()}"/>" alt="" title="" border="0" height="100%"width="100%" class="img"/></a></div>
                
                <div class="prod_det_box">
                	<span class="special_icon"><img src="images/special_icon.gif" alt="" title="" /></span>
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">${catalogBrowser.getListProduct().get(4).getName() }</div>
                    <p class="details">${catalogBrowser.getListProduct().get(4).getDescription() }</p>
                    <a href="Detail?id=${catalogBrowser.getListProduct().get(4).getIdProduct () }" class="more">- more details -</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            
            
        	<div class="feat_prod_box">
            
            	<div class="prod_img1"><a href="Detail?id=${catalogBrowser.getListProduct().get(5).getIdProduct () }"><img src="<c:out value="${catalogBrowser.getListProduct().get(5).getPicture()  }"/>" alt="" title="" border="0" height="100%"width="100%" class="img"/></a></div>
                
                <div class="prod_det_box">
                <span class="special_icon"><img src="images/special_icon.gif" alt="" title="" /></span>
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">${catalogBrowser.getListProduct().get(5).getName() }</div>
                    <p class="details">${catalogBrowser.getListProduct().get(5).getDescription() }</p>
                    <a href="Detail?id=${catalogBrowser.getListProduct().get(5).getIdProduct () }" class="more">- more details -</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>
            <div class="feat_prod_box">
            
            	<div class="prod_img1"><a href="Detail?id=${catalogBrowser.getListProduct().get(7).getIdProduct () }"><img src="<c:out value="${catalogBrowser.getListProduct().get(7).getPicture()  }"/>" alt="" title="" border="0" height="100%"width="100%" class="img"/></a></div>
                
                <div class="prod_det_box">
                <span class="special_icon"><img src="images/special_icon.gif" alt="" title="" /></span>
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">${catalogBrowser.getListProduct().get(7).getName() }</div>
                    <p class="details">${catalogBrowser.getListProduct().get(7).getDescription() }</p>
                    <a href="Detail?id=${catalogBrowser.getListProduct().get(7).getIdProduct () }" class="more">- more details -</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>
            <div class="feat_prod_box">
            
            	<div class="prod_img1"><a href="Detail?id=${catalogBrowser.getListProduct().get(6).getIdProduct () }"><img src="<c:out value="${catalogBrowser.getListProduct().get(6).getPicture()  }"/>" alt="" title="" border="0" height="100%"width="100%" class="img"/></a></div>
                
                <div class="prod_det_box">
                	<span class="special_icon"><img src="images/special_icon.gif" alt="" title="" /></span>
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">${catalogBrowser.getListProduct().get(6).getName() }</div>
                    <p class="details">${catalogBrowser.getListProduct().get(6).getDescription() }</p>
                    <a href="dDetail?id=${catalogBrowser.getListProduct().get(6).getIdProduct () }" class="more">- more details -</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
           <div class="clear"></div>
        </div>
        <!--end of left content-->
      <%@ include file="template/right_content.jsp" %>
        <!--end of right content-->
         <div class="clear"></div>
       </div><!--end of center content-->
             <%@ include file="template/footer.html" %>
               
         </div>
      <%@ include file="template/script.html" %>

</body>
</html>