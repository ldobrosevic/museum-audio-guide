<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="hr">
<head>
<title>Izložak</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
</head>

<body>

	<h1>${exhibit.name}</h1>
	
	<p>${exhibit.description}</p>
	
	<img src="${exhibit.image_path}" alt="Image">
	
	<a href="${exhibit.audio_path}">Poslušaj zvučni opis izloška</a>	
	
	<h3>Detalji vezani uz ${exhibit.name}</h3>
	
	<div>
		<a href="/detailsUpload/${exhibit.exhibitId}">Dodaj detalj</a>
	</div>
	
	<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Naziv detalja</th>
					<th scope="col">Slika</th>
				</tr>
			</thead>
			<c:forEach var="exhibitDetails" items="${exhibitDetails}">
				<tbody>
					<tr>
						<th><a href="/exhibitDetails/${exhibitDetails.detailId}">${exhibitDetails.name}</a></th>
						<th><img src="image/${exhibitDetails.image_path}" alt="Image"></th>
					</tr>
				</tbody>
			</c:forEach>
	</table>
	

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