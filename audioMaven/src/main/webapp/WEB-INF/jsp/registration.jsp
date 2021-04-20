<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
	<a href="/">Naslovnica</a>
	<script>
	 function formValidation()  
	    {  
	     var firstname = document.registration.firstname;  
	     var lastname = document.registration.lastname;  
	     var username = document.registration.username;  
	     var email = document.registration.email;
	     var password = document.registration.password;  
	     var confirmpassword = document.registration.confirmpassword;  
	    if(firstname_validation(firstname)) 
	    {  
	        if(firstname_validation(lastname))
	        {  
	            if(allLetter(username))  
	            {
 	            	if(checkExistCur(username))
	            	{ 
 	            		if(checkExistCurEmail(email))
 	            		{
 	 	            	  	if(password_validation(password,7,12))  
 		                	{
 		                		if(confirmpassword_validation(confirmpassword, password))
 		                		{
 		                			return true;
 		                		}	               
 		                	}
 	            			
 	            		}
 	            	} 
 	            }  
	        }  
	    }  
	    return false;  
	    }  

	function firstname_validation(firstname)
	{
	    var fn_len = firstname.value.length;
	    if(fn_len == 0)
	    {
	    alert('Please input your first name');
	    firstname.focus();
	    return false;
	    }
	    return true;
	}

	function password_validation(password, mx, my)
	{
	    var pass_len = password.value.length;
	    if(pass_len == 0 || pass_len >= my || pass_len < mx)
	    {
	    alert('Please enter password with length between ' +mx+ ' and ' + my);
	    password.focus();
	    return false;
	    }
	    return true;
	}
	
	function confirmpassword_validation(confirmpassword, password)
	{
		if(confirmpassword.value.localeCompare(password.value) == 0)
		{
			return true;
		}
		alert('Please enter matching password');
		confirmpassword.focus();
		return false;
	}
	
	function checkExistCur(username)
	{		
		var alreadyExists = "username is already in use!"; 
		var isE = document.getElementById("usernameExists").innerHTML;
		if(isE.trim().localeCompare(alreadyExists) != 0)
		{
			return true;
		}
		alert('Please use a different username');
		username.focus();
		return false;
	}
	
	function checkExistCurEmail(email)
	{		
		var alreadyExists = "email is already in use!"; 
		var isE = document.getElementById("emailExists").innerHTML;
		if(isE.trim().localeCompare(alreadyExists) != 0)
		{
			return true;
		}
		alert('Please use a different e-mail address');
		email.focus();
		return false;
	}



	function allLetter(username)
	{
	    var letters = /^[A-Za-z0-9]+$/;
	    if(username.value.match(letters))
	    {
	    return true;
	    }
	    else
	    {
	    alert('Username must only contain letters and numbers');
	    username.focus();
	    return false;
	    }
	}
	
	

	function checkExist(string)
	{
        var xmlhttp = new XMLHttpRequest();
        var parameter = document.forms["registration"][string].value;
        if(parameter == "") return;
        var url = "exists?" + string + "=" + parameter;
        xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                if(xmlhttp.responseText.trim() == (string + " is already in use!"))
                {
                	document.getElementById(string+"Exists").style.color = "red";
                }
                else
                {
                	document.getElementById(string+"Exists").style.color = "green";
                }
                document.getElementById(string+"Exists").innerHTML = xmlhttp.responseText;
            }
        };
        
        
        try{
        	xmlhttp.open("GET",url,true);
       		xmlhttp.send();
    	}catch(e){alert("unable to connect to server");}
    	
	}

	

	</script>  
</head>
	
<body>
	<form name="registration" onSubmit="return formValidation()" action="${pageContext.request.contextPath}/registration" method="post">
	
	<ul>
	  <li><label for="firstname">First name:</label></li>
	  <li><input type="text" name="firstname" size="12" required /></li>  

	  <li><label for="lastname">Last name:</label></li>
	  <li><input type="text" name="lastname" size="12" required /></li>  

	  <li><label for="username">Username:</label></li>
	  <li><input type="text" name="username" size="12" onblur="checkExist('username')" required /><span id="usernameExists"></span></li>  
	
	  <li><label for="password">Password:</label></li>
	  <li><input type="password" name="password" size="12" required /></li>  
	  
	  <li><label for="confirmpassword">Confirm Password:</label></li>
	  <li><input type="password" name="confirmpassword" size="12" required /></li>  
	  
	  <li><label for="email">E-mail address:</label></li>
	  <li><input type="email" name="email" size="12" onblur="checkExist('email')" required /><span id="emailExists"></span></li>  
	  
	  <li><input type="submit" name="submit" value="Register" /></li>  
	</ul>
</form>
</body>
</html>
