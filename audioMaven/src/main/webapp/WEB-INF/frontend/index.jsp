<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html lang="en">
<head>
<title>AppTownFunk Muzej</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous" />
<link rel="stylesheet" type="text/css" href="css/index.css" />

<style>
body {
	font-family: "Open Sans", sans-serif;
	height: 100vh;
	background: url("https://preview.ibb.co/giKBn6/final2.jpg") 50% fixed;
	background-size: 50%;
}

.carousel-inner>.carousel-item>img {
	margin: auto;
	width: 100%;
}

.myboxnews>table {
	margin: auto;
	margin-top: 20px;
}

p {
	margin-top: 10px;
	margin-left: 5px;
	margin-right: 5px;
}
</style>
<style>
	/* unvisited link */
	a:link {
   	 color: black;
	}

	/* visited link */
	a:visited {
    	color: black;
	}

	/* mouse over link */
	a:hover {
   	 color: orange;
	}

/* selected link */
	a:active {
   	 color: orange;
	}

</style>

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
					<li class="nav-item active"><a class="nav-link" href="/">Naslovna</a>
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

	<div class="header"></div>

	<div class="container">
		<div class="container" style="background-color: white;">
			<br> <br>

			<div id="carouselExampleControls" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="/caruselLovre1.jpg"
							alt="First slide">
						<!--  <div class="carousel-caption d-sm-block d-md-block">
							<h3>Dobrodošli u muzej muzeja</h3>
							<p>Nadamo se da ćete doživjeti našu stranicu muzeja kao
								nadahnuti vodič kroz predivna iskustva koja smo pripremili za
								Vas, i sretni smo pozvati vas da istražite sve izuzetne izložbe
								i pripadajuće izloške.</p>
						</div>-->
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="/caruselLovre2.jpg"
							alt="Second slide">
						<!--<div class="carousel-caption d-sm-block d-md-block">
							<h3>Naslov 2. : Izlozba 2.</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
								aute irure dolor in reprehenderit in voluptate velit esse cillum
								dolore eu fugiat nulla pariatur. Excepteur sint occaecat
								cupidatat non proident, sunt in culpa qui officia deserunt
								mollit anim id est laborum.</p>
						</div>-->
					</div>

				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleControls"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

			<h3 style="margin-top: 5%; margin-left: 8%;">Najnovije izložbe:
			</h3>

			<div class="container" style="margin-left: 2px; margin-right: 3px; margin-top: 2px;">
				<div class="card-deck" style="margin-bottom:5px">
				      <c:forEach var="exhibitions" items="${exhibitions}">
				      	<!--  <div class="w-25 hidden-xs-down hidden-md-up"> -->
				        <div class="card mb-4">
				            <img class="card-img-top" src="/img/Types/${exhibitions.typeofExhibition}.jpg" alt="${exhibitions.typeofExhibition}">
				            <div class="card-body">
				                <h5 class="card-title"><a href="/exhibitions/${exhibitions.exhibitionId}">${exhibitions.nameOfExhibition}</a></h5>
				                <p class="card-text">${exhibitions.description}</p>
				            </div>
				            <div class="card-footer">
				        		<small class="text-muted">Od ${exhibitions.dateBegin} do ${exhibitions.dateEnd}</small>
				        	</div>
				       <!--  </div> -->
				        </div>
				      </c:forEach>
		    	</div>
				<div class="row">
					<p></p>
				</div>

			</div>
		</div>
	</div>

	<div class="footer">
		<p>AppTownFunk @ Copyright 2017.</p>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>

</body>
</html>

<!-- http://www.layoutit.com/ -->