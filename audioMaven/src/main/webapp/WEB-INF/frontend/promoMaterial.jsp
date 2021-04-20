<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>
<meta http-equiv="Content-Type" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>AppTownFunk muzej</title>
<!--  
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet" type="text/css"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"
	type="text/css"></link>
	-->
	
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  	<link rel="stylesheet" href="frontend/css_nika/addexhibit.css" />
  	
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
  
   <!-- Required for collapsed navbar menue to work -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
</head>
<body>
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
				<li class="nav-item"><a class="nav-link" href="/adminTools"> ${user.username }
				<span class="sr-only">(current)</span></a></li>
				
				<li class="nav-item"><a class="nav-link" href="/logout">Odjavi se</a></li>
			</c:if>
		
			<c:if test="${user.username == null }">
				<li class="nav-item"><a class="nav-link" href="/login">Prijavi
						se <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/registration">Registriraj
						se</a></li>
			</c:if>
        </ul>
      </div>
    </nav>
  </div>
  
  
	<div class="container">
		<form:form action="${pageContext.request.contextPath}/sendPromo"
			method="post" class="addexhibition">
			<p>
				<%
					if (null != request.getAttribute("errorMessage")) {
						out.println(request.getAttribute("errorMessage"));
					}
				%>
			</p>
			<p class="title">Promo materijal - slanje putem elektroničke pošte</p>
			<input type="text" name="subject" placeholder="Subjekt" autofocus required />
			<textarea name="mailBody" placeholder="Tijelo poruke"
				cols="79" rows="5" required></textarea>
						
			<button type="submit" name="submit">
       			 <i class="spinner"></i>
        		<span class="state">Pošalji</span>
     		 </button>
			
		</form:form>
	</div>
	<div class="footer">
        <p>AppTownFunk @ Copyright 2017.</p>
    </div>
	
</body>
</html>