<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en" >

<head>
      
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="frontend/css_nika/exhibitions.css" />
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
            <a class="nav-link" href="/exhibitions">Izlozbe</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/exhibits">Izlosci</a>
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

	<h1>Svi datalji-sluzi samo za testiranje</h1>
	<h1></h1>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th scope="col" style="text-align: center">Naziv</th>
                <th scope="col" style="text-align: center">Opis</th>
                <th scope="col" style="text-align: center">Audio</th>
                <th scope="col" style="text-align: center">Slika</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="details" items="${details}">
            <tr>
                <td style="width: 10%"><a href="/exhibitDetails/${details.detailId}">${details.name}</a></td>
                <td>${details.description}</td>
                <td><a href="${details.audio_path}">Audio</a></td>
                <td  style="text-align: center;width:210px">
                	<a target="_blank" href="${details.image_path}">
                		<img src="${details.image_path}" style="width:200px;" alt="..." class="img-thumbnail">
                	</a>
                </td>
                <td style="width: 10%">
					<a href="${pageContext.request.contextPath}/detailsUpdate/${details.detailId}" class="btn btn-default">Update</a>
				</td>	
                <td style="width: 10%">
					<a href="${pageContext.request.contextPath}/exhibitDetails" class="btn btn-default" onclick="deleteExhibitDetail(${details.detailId})">Delete</a>
				</td>
            </tr>
         </c:forEach>
        </tbody>
    </table>  

  </div>

</body>
</html>