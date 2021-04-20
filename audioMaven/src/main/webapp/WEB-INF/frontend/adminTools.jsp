<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="hr">
  <head>
    <title>AppTownFunk Muzej</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



    <style>
        body {
           font-family: "Open Sans", sans-serif;
           height: 60vh;
           background: url("https://preview.ibb.co/giKBn6/final2.jpg") 50% fixed;
           background-size:50%;   
         }.container{
           display: flex;
           align-items: center;
           flex-direction: column;
           justify-content: center;
           width: 100%;
           min-height: 100%;
           margin-top:150px;
           padding: 20px;
           background: rgba(255, 255, 255, 1);
           box-shadow: #ff8c66;
           overflow:overlay;
        }.inner{
           allign-items:center;
           margin-top:50px;
           margin-left:0px;
        }.inner1{
           border:2px solid #333333;
           width:100px;
           min-height:80px;
           allign-items:center;
           padding-left:10px;
           paddin-right:10px;
           padding:20px;
           background: rgba(255, 255, 255, 1);
           margin-left:-700px;
           margin-top:30px
        }.inner2{
           border:2px solid #333333;
           width:100px;
           min-height:80px;
           allign-items:center;
           padding-left:10px;
           paddin-right:10px;
           padding:20px;
           background: rgba(255, 255, 255, 1);
           margin-left:-700px;
           margin-top:50px
        }.inner3{
           border:2px solid #333333;
           width:100px;
           min-height:80px;
           allign-items:center;
           padding-left:10px;
           paddin-right:10px;
           padding:20px;
           background: rgba(255, 255, 255, 1);
           margin-left:20px;
           margin-top:-280px
        }.inner4{
           border:2px solid #333333;
           width:100px;
           min-height:80px;
           allign-items:center;
           padding-left:10px;
           paddin-right:10px;
           padding:20px;
           background: rgba(255, 255, 255, 1);
           margin-left:20px;
           margin-top:50px
        }.inner5{
           border:2px solid #333333;
           width:100px;
           min-height:80px;
           allign-items:center;
           padding-left:10px;
           paddin-right:10px;
           padding:20px;
           background: rgba(255, 255, 255, 1);
           margin-left:700px;
           margin-top:-280px
        }.inner6{
           border:2px solid #333333;
           width:120px;
           min-height:80px;
           allign-items:center;
           padding-left:10px;
           paddin-right:10px;
           padding:20px;
           background: rgba(255, 255, 255, 1);
           margin-left:700px;
           margin-top:50px
        }.edit{
           color: #333333;
        }.footer{
           margin-top:50px;
        }
        
        


    </style>

</head>

  <body>
  <c:if test="${user.role != 'admin' }">
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
	          <li class="nav-item">
	            <a class="nav-link" href="/login">Prijavi se <span class="sr-only">(current)</span></a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="/registration">Registriraj se</a>
	          </li>
	        </ul>
	      </div>
	    </nav>
  </div>
  
<div class="container">
       <div class="inner">
       <h1 style="color: #333333;"><strong>ADMINISTRATOR TOOLS</strong></h1>         
       </div>
       <div class="inner1">
           <a class="edit" href="/editAdministrators" class="btn btn-lg btn-default"><i class="fa fa-pencil" aria-hidden="true"></i>EDIT ADMINS</a>         
        </div>
       <div class="inner2">
           <a class="edit"  href="/pageCount" class="btn btn-lg btn-default"><i class="fa fa-eye" aria-hidden="true"></i>VIEW USER COUNT</a>         
        </div>
       <div class="inner3">
           <a class="edit"  href="#" class="btn btn-lg btn-default"><i class="fa fa-paper-plane" aria-hidden="true"></i>SEND PROMO</a>         
        </div>
        <div class="inner4">
           <a class="edit"  href="/exhibitDetails" class="btn btn-lg btn-default"><i class="fa fa-file-text" aria-hidden="true"></i>EXHIBIT DETAILS</a>         
        </div>
         <div class="inner5">
           <a class="edit"  href="/exhibitUpload" class="btn btn-lg btn-default"><i class="fa fa-upload" aria-hidden="true"></i>EXHIBIT UPLOAD</a>         
        </div>
         <div class="inner6">
           <a class="edit"  href="/exhibitionUpload" class="btn btn-lg btn-default"><i class="fa fa-upload" aria-hidden="true"></i>EXHIBITION UPLOAD</a>         
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
