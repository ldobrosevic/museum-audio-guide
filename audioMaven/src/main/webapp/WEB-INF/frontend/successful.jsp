<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
  <head>
    <title>AppTownFunk Muzej</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Refresh" content="2;url=${pageContext.request.contextPath}/">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">

 <!-- Required for collapsed navbar menue to work -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
    <style>
        body {
           font-family: "Open Sans", sans-serif;
           height: 60vh;
           background: url("https://preview.ibb.co/giKBn6/final2.jpg") 50% fixed;
           background-size:50%;   

         }.container{
           margin-top:20%;
           margin-left:auto;
           margin-right:auto;
           allign-items:center;
           width: 600px;
           min-height: 100px;
           padding: 20px;
           background: rgba(255, 255, 255, 1);
           
           
        }.inner{
           border:1px solid #ffffff;
           width:560px;
           min-height:80px;
           allign-items:center;
           padding:5px;
        }.successLink{
           color: #333333;
        }.footer{
           margin-top:300px;
        }
        
        


    </style>

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
                        <a class="nav-link" href="/index">Naslovna</a>
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

       <div class="inner">
           <p class="success"><strong> ${message} </strong></p>              
            <a class="successLink" href="/">Stisnite ovdje ako vas stranica ne preusmjeri za par sekundi.</a>           
        </div>
        
</div>
    

    <div class="footer">
        <p>AppTownFunk @ Copyright 2017.</p>
    </div>
   
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>


  </body>
</html>

<!-- http://www.layoutit.com/ -->