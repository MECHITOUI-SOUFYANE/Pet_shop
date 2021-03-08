
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="header">
       		<div class="logo"><a href="index.jsp"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li class="selected"><a href="index.jsp">home</a></li>
            <li><a href="about.jsp">about us</a></li>
            <li><a href="categories.jsp">pets</a></li>
            <li><a href="specials.jsp">specials pets</a></li>
            <c:if test="${User == null}">
            	<li><a href="myaccount.jsp">my account</a></li>
         	    <li><a href="register.jsp">register</a></li>
            </c:if>
            <li><a href="details.jsp">prices</a></li>
            <c:if test="${User != null}">
            	<li>
            		<form action="logout" id="logout-header" method="post">
            		<input type="hidden" name ="logout" >
            			<a type="submit" role="button" style="cursor : pointer;" onclick='document.getElementById("logout-header").submit();'>Logout</a>	
            		</form>            		
            	</li>
            </c:if> 
            </ul>
        </div>
                 
</div> 
<div id="google_translate_element" style="float:right;"></div>   