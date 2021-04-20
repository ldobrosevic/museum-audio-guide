<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link rel="stylesheet" type="text/css"
	href="/frontend/css_nika/index.css" />

<!-- Required for collapsed navbar menue to work -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"
	integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4"
	crossorigin="anonymous"></script>

<style>
body {
	font-family: "Open Sans", sans-serif;
	height: 100vh;
	background: url("https://preview.ibb.co/giKBn6/final2.jpg") 50% fixed;
	background-size: 50%;
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

	<script type="text/javascript">
function deleteExhibitDetail(string)
{
    var xmlhttp = new XMLHttpRequest();
    var url = "exhibitDetails/" + string;    
    
    try{
    	xmlhttp.open("DELETE",url,false);
   		xmlhttp.send();
   		
	}catch(e){alert("unable to connect to server");}
	
}
</script>
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
						<li class="nav-item"><a class="nav-link" href="/adminTools">
								${user.username } <span class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link" href="/logout">Odjavi
								se</a></li>
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
		<div class="container"
			style="position: absolute; background-color: white; text-align: center;">
			<div class="container"
				style="position: relative; margin-top: 100px; margin-bottom: 5%; right: 0%;">
				<h2>${exhibit.name}</h2>
			</div>
			<div class="row">
				<div class="col-sm" style="text-align: center;">
					<a target="_blank" href="${exhibit.image_path}"> <img
						style="width: 70%; border: 3px solid #333333; margin-bottom: 5%"
						src="${exhibit.image_path}">
					</a>
					<div>
						<!--  <a class="audioButton" href="${exhibit.audio_path}">Audio</a>-->
						<a href="${exhibit.audio_path}" class="btn btn-outline-dark"
							role="button">Audio</a>
					</div>
				</div>

				<div class="col-sm">
					<h3>Opis:</h3>
					${exhibit.description}
				</div>
			</div>

			<div class="row"
				style="border-block-end: 2px solid #333333; margin-left: 0%; margin-right: 45%; margin-top: 2%">
				<div class="col-sm" style="margin-right: 65%;">
					<c:if test="${user.role == 'admin' }">

						<p>
							<strong>Detalji</strong> <a
								href="/detailsUpload/${exhibit.exhibitId}"><button
									type="button">+</button></a>
						</p>
					</c:if>
				</div>
			</div>

			<c:forEach var="exhibitDetails" items="${exhibitDetails}">
				<div class="row"
					style="border-block-end: 2px solid #333333; margin-left: 5%; margin-right: 5%; margin-top: 2%;">
					<div class="col-sm" style="position: relative; right: 12%">
						<p>
							<a href="/exhibitDetails/${exhibitDetails.detailId}"><strong>${exhibitDetails.name}</strong></a>
						</p>
						
						<c:if test="${user.role == 'admin' }">
							<a
								href="${pageContext.request.contextPath}/detailsUpdate/${exhibitDetails.detailId}"
								class="btn btn-default">Update</a>-<a
								href="${pageContext.request.contextPath}/exhibitDetails"
								class="btn btn-default"
								onclick="deleteExhibitDetail(${exhibitDetails.detailId})">Delete</a>
						</c:if>
					</div>

					<div class="col-sm" style="position: relative; left: 1%">
						<p>
							<a target="_blank" href="${exhibitDetails.image_path}"> <img
								style="width: 70%; border: 3px solid #333333; margin-bottom: 5%"
								src="${exhibitDetails.image_path}">
							</a>
						</p>
					</div>

					<div class="col-sm">
						<!--  <p><strong><a href="${exhibitDetails.audio_path}" alt="Audio">Audio</a></strong></p>-->
						<p>
							<a href="${exhibitDetails.audio_path}"
								class="btn btn-outline-dark" role="button">Audio</a>
						</p>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="footer">
			<p>AppTownFunk @ Copyright 2017.</p>
		</div>
	</div>

	<!-- Optional JavaScript 
          <!-- jQuery first, then Popper.js, then Bootstrap JS 
          <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
      -->

</body>
</html>

<!-- http://www.layoutit.com/ -->