<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="Exceptions.jsp" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Pet Shop</title>
<link rel="shortcut icon" type="image/png" href="images/p.png"/>
<link rel="stylesheet" type="text/css" href="css/style2.css" />
</head>
<body>
<c:if test="${empty about_home }">
<c:redirect url="/Home?page=about"/>
</c:if>
<div id="wrap">

       
       
        <%@ include file="template/header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>About us</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            <img src="images/about.gif" alt="" title="" class="right" /> 
             </p>
					<p>We are a team of 6 people specialized in the field of e-commerce and drop-shipping. Your trust and satisfaction is our priority!
						<br/>
						<br/>
						<i> computer engineering student, passion and ambition!</i><br/></p>
						<ul>
						<li>Soufyane MECHITOUI</li>
						<li>Hanane ELMAAYOUF</li>
						<li>Maryem ALGHADI</li>
						<li>Assia Jebara</li>
						<li>Omar Benchennouf</li>
						<li>Zakariae El Yousfi</li>
						</ul>
						
						
             </div>	
             <div class="clear"></div>
        </div><!--end of left content-->
        
        <jsp:include page="/template/right_content.jsp" /> 
        <!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
        <%@ include file="template/footer.html" %>
              
       
    

</div>

  <%@ include file="template/script.html" %>
</body>
</html>