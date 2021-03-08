<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="Exceptions.jsp"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Pet Shop</title>
<link rel="stylesheet" type="text/css" href="css/style3.css" />
<link rel="stylesheet" type="text/css" href="css/style2.css" />
<link rel="shortcut icon" type="image/png" href="images/p.png"/>
</head>
<body>
<c:if test="${empty register_home }">
<c:redirect url="/Home?page=register"/>
</c:if>
<div id="wrap">

           <%@ include file="template/header.jsp" %>
       
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Register</div>
        
        	<div class="feat_prod_box_details">
            
              	<div class="contact_form">
                <div class="form_subtitle">create new account</div>
                 <form method="post" name="register"  action="Register">   
                  <span id="inf" >${inscription.getResultat()}</span>        
                    <div class="form_row">
                    <label class="contact"><strong>Username:</strong></label>
                    <input type="text" class="contact_input" name="username" value="<c:out value="${user.getLogin()}"/>" />
                    <br/><br/><br/>
                    <label class="">${inscription.erreurs['username']}</label>
                    </div>  


                    <div class="form_row">
                    <label class="contact"><strong>Password:</strong></label>
                    <div class="password"><input type="password" class="contact_input" id="password" name="password" value="<c:out value="${user.getPassword()}"/>"/>
                   <br/><div class="eye_register" onclick="fct()"><i class="mask" id="eye" ></i></div></div>
                  
                    <br/>
                    <span class="erreur">${inscription.erreurs['password']}</span>
                    </div> 

                    <div class="form_row">
                    <label class="contact"><strong>Email:</strong></label>
                    <input type="text" class="contact_input" name="email" value="<c:out value="${user.getEmail()}"/>"/>
                    <br/><br/><br/>
                    <span class="erreur">${inscription.erreurs['email']}</span>
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>Phone:</strong></label>
                    <input type="text" class="contact_input" name="phone" value="<c:out value="${user.getPhone()}"/>"/>
                    <br/><br/><br/>
                    <span class="erreur">${inscription.erreurs['phone']}</span>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>Company:</strong></label>
                    <input type="text" class="contact_input" name="company" value="<c:out value="${user.getCompany()}"/>"/>
                    <br/><br/><br/>
                    <span class="erreur">${inscription.erreurs['company']}</span>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>Adrres:</strong></label>
                    <input type="text" class="contact_input" name="adress" value="<c:out value="${user.getAdress()}"/>" />
                    <br/><br/><br/>
                    <span class="erreur">${inscription.erreurs['adress']}</span>
                    </div>                    
                                                                 
                    <div class="form_row">
                        <div class="terms">
                        <input type="checkbox" name="terms" />
                        I agree to the <a href="#">terms &amp; conditions</a>     <br/><br/>
                    <span class="erreur">${terms}</span>                    </div>
                    </div> 

                    
                    <div class="form_row">
                    <input type="submit" class="register" value="register" />
                    </div>  
                    
                  </form> 
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
<script type='text/javascript'>
   let mdp=document.getElementById("password");
   let eye=document.getElementById("eye");
   let etat=false;
   function fct(){
	   if(!etat){
       mdp.setAttribute('type','text');
       eye.setAttribute('class','unmask');
       etat=true;
	   }
	   else{  
		   mdp.setAttribute('type','password');
		   eye.setAttribute('class','mask');
	       etat=false;
	   }
   };
</script>
      <%@ include file="template/script.html" %>

</body>
</html>