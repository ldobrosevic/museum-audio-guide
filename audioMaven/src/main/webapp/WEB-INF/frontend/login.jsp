<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en" >

<head>
      
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="frontend/css_nika/login.css" />
  <title>AppTownFunk Muzej</title>
      
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
</head>

<body>
	<c:if test="${user.username != null }">
		<c:redirect url="${pageContext.request.contextPath}/"/>
	</c:if>
 
  <div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <a class="navbar-brand" href="/">
        <img src="https://image.ibb.co/kpRSum/aflogo.png" width="100" height="30"  alt="">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="/">Naslovna</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/aboutus">O muzeju</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/exhibitions">Izložbe</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/exhibits">Izlošci</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/contact">Kontakt</a>
          </li>
        </ul>
        
        <ul class = "navbar-nav navbar-right">
			<c:if test="${user.username != null }">
				<li class="nav-item"><a class="nav-link" href="/"> ${user.username }
				<span class="sr-only">(current)</span></a></li>
				
				<li class="nav-item active"><a class="nav-link" href="/logout">Odjavi se</a></li>
			</c:if>
		
			<c:if test="${user.username == null }">
				<li class="nav-item active"><a class="nav-link" href="/login">Prijavi
						se <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/registration">Registriraj
						se</a></li>
			</c:if>
        </ul>
      </div>
    </nav>
  </div>

  <div class="wrapper">
    <form class="login" name="login" action="${pageContext.request.contextPath}/login" method="post">
      
      <p class="title">Prijava</p>
    	<c:if test="${errorMessage != null }">
			${errorMessage }
		</c:if>
      	
      
        <input type="text" placeholder="Korisnicko ime" name="username" autofocus required/>  
        <i class="fa fa-user"></i>  
        <input type="password" placeholder="Lozinka" name="password" required/>
      
        <i class="fa fa-key"></i>
        <a href="/forgotPassword">Zaboravili ste lozinku?</a>
 
        <button type=submit name="submit">
          <i class="spinner"></i>
          <span class="state">Prijavi se</span>
        </button>
    </form>
  </div>
  
</body>
</html>
