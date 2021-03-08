<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Exceptions.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style2.css" />
<link rel="shortcut icon" type="image/png" href="images/p.png"/>
</head>
<body>
<c:if test="${empty categories_home }">
<c:redirect url="/Home?page=categories"/>
</c:if>
<div id="wrap">
      <%@ include file="template/header.jsp" %>
       
       
       
       <div class="center_content">
       	<div class="left_content">
       	 <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Available pets</div>
          
            <div class="new_products">
                     <c:forEach items="${catalogBrowser.getListProduct()}" var="element">
                       <c:if test="${element.getCategory() == 'pet' }">
                        <div class="new_prod_box">
                        <a href="Detail?id=${element.getIdProduct() }"><c:out value="${element.getName()}"/></a>
                        <div class="new_prod_bg">
                        <a href="Detail?id=${element.getIdProduct() }"><img src="<c:out value="${element.getPicture() }"/>" width="100%" alt="" title="" class="thumb" border="0" /></a>
                        </div> 
                               
                    </div>  
                    </c:if>
                    </c:forEach>
                    </div>
                    <div class="clear"></div>
                    
          <div class="title" id="accessories"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>pet equipment</div>
          
            <div class="new_products">
                     <c:forEach items="${catalogBrowser.getListProduct()}" var="element">
                       <c:if test="${element.getCategory()!='pet' }">
                        <div class="new_prod_box">
                        <a href="Detail?id=${element.getIdProduct() }"><c:out value="${element.getName()}"/></a>
                        <div class="new_prod_bg">
                        <a href="Detail?id=${element.getIdProduct() }"><img src="<c:out value="${element.getPicture() }"/>" width="100%" alt="" title="" class="thumb" border="0" /></a>
                        </div> 
                               
                    </div>  
                    </c:if>
                    </c:forEach>
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