<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<head>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="frontend/css_nika/register.css">

<title>AppTownFunk Muzej</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

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
        	xmlhttp.open("POST",url,true);
       		xmlhttp.send();
    	}catch(e){alert("unable to connect to server");}
    	
	}

	

	</script>

</head>

<body>
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<a class="navbar-brand" href="/"> <img
				src="https://image.ibb.co/kpRSum/aflogo.png" width="100" height="30"
				alt="">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="/">Naslovna</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/aboutus">O
							muzeju</a></li>
					<li class="nav-item"><a class="nav-link" href="/exhibitions">Izložbe</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/exhibits">Izlošci</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/contact">Kontakt</a>
					</li>
				</ul>
				<ul class="navbar-nav navbar-right">
					<c:if test="${user.username != null }">
						<li class="nav-item"><a class="nav-link" href="/">
								${user.username } <span class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link" href="/logout">Odjavi
								se</a></li>
					</c:if>

					<c:if test="${user.username == null }">
						<li class="nav-item"><a class="nav-link" href="/login">Prijavi
								se <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item active"><a class="nav-link" href="/registration">Registriraj
								se</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</div>

	<div class="wrapper">

		<form name="registration" class="register"
			onSubmit="return formValidation()"
			action="${pageContext.request.contextPath}/registration"
			method="post">
			<p class="title">Registracija</p>

			<input type="text" placeholder="Ime" name="firstname" required
				autofocus /> <i class="fa fa-address-card-o"></i> <input type="text"
				placeholder="Prezime" name="lastname" required autofocus /> <i
				class="fa fa-address-card-o"></i> <input type="text"
				placeholder="Korisnicko ime" name="username"
				onblur="checkExist('username')" required /> <i class="fa fa-user"></i>
			<span id="usernameExists"></span> <input type="email"
				placeholder="E-mail adresa" name="email"
				onblur="checkExist('email')" required /> <i
				class="fa fa-envelope-o"></i> <span id="emailExists"></span> <input
				type="password" placeholder="Lozinka" name="password" required /> <i
				class="fa fa-key"></i> <input type="password"
				placeholder="Ponovljena lozinka" name="confirmpassword" required />
			<i class="fa fa-key"></i>

			<button type="submit" name="submit">
				<i class="spinner"></i> <span class="state">Registriraj se</span>
			</button>

			<hr>

			<p>
				Već ste registrirani?<a href="/login"> Prijavite se.</a>
			</p>
		</form>
	</div>
</body>

</html>
