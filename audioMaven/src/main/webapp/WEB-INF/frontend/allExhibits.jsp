<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en" >

<head>
      
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="/frontend/css_nika/exhibitions-new.css" />
  <title>AppTownFunk Muzej</title>
      
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

<!-- Required for collapsed navbar menue to work -->
  	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
</head>

<body>
 
 <script type="text/javascript">
function deleteExhibit(string)
{
    var xmlhttp = new XMLHttpRequest();
    var url = "exhibits/" + string;    
    
    try{
    	xmlhttp.open("DELETE",url,false);
   		xmlhttp.send();
   		
	}catch(e){alert("unable to connect to server");}
	
}
</script>

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
  <div class="container-fluid">
  <h1>Svi izlošci</h1>
	<h1></h1>
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
          <li class="nav-item active">
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
  <div class="container" style="position: absolute; background-color: white;">
    <div class="row" style="margin-top:2%;"><p></p></div>
	<h1 style="margin-bottom:5%; text-align:center; ">Svi izlošci</h1>
	<h1></h1>
    <!--<div class="row" style="margin-bottom:5%; text-align:center">
      <div class="col-sm"><strong>Naziv</strong></div>
      <div class="col-sm"><strong>Opis</strong></div>
      <div class="col-sm"><strong>Slika</strong></div>
    </div>-->

<c:forEach var="exhibits" items="${exhibits}">
    <div class="row" style="border-block-end: 2px solid #333333; margin-left:2.5%; margin-right:2.5%; margin-top:2.5%;margin-bottom:10%">
        <div class="col-sm" style="text-align: center;"><a href="/exhibits/${exhibits.exhibitId}"><h4>${exhibits.name}</h4></a>      
			<c:if test="${user.role == 'admin' }">
		         <a href="${pageContext.request.contextPath}/exhibitUpdate/${exhibits.exhibitId}" class="btn btn-default">Update</a>
		         -
		         <a href="${pageContext.request.contextPath}/exhibits" class="btn btn-default" onclick="deleteExhibit(${exhibits.exhibitId})">Delete</a>
			</c:if>	         
        </div>
        <div class="col-sm">Opis: ${exhibits.description}</div>
        <div class="col-sm" style="text-align: center;">
        			<a target="_blank" href="${exhibits.image_path}">
                		<img src="${exhibits.image_path}" style="width: 200px" alt="${exhibits.image_path}" class="img-thumbnail">
                	</a>
        </div>
    </div>
  </c:forEach>
    <div class="row"><p></p></div>
  </div>
</div>

</body>
</html>