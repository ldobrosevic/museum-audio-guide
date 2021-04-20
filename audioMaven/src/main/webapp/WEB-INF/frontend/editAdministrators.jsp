<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="hr">

 <head>
    <title>AppTownFunk Muzej</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous" />
  	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    
  	<link rel="stylesheet" href="/frontend/css_nika/editAdmins.css">
    
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
  
  	<div class="row">
  		<h1 class="header" style="text-allign:center; font-size:200;margin-top:10%">UPRAVLJANJE ADMINISTRATORIMA</h1>
  	</div>
  
  	<div class="row conLab">
	  	<div class ="media">
	  		<img class="align-self-start mr-3" style="border: 3px solid  #333333; width:35%; margin:5px" src="http://www.pvhc.net/img37/pdswfrzyiocgaufsfuev.png" alt="Generic placeholder image">
	  		<div class="media-body">
			    <h3 class="maxAdmins" style="font-size:200%; margin-bottom:10%" >Najveći dopušteni broj administratora: 5</h3>
			    <h3 class="currentAdmins"  style="font-size:200%; margin-bottom:10%">Trenutni broj administratora: ${numberOfAdmins}</h3>
			    <div class="container conLab" style="border:1px solid black">
				    <form role="form" data-toggle="validator" id="addAdmins-form"
				        action="${pageContext.request.contextPath}/addAdmins"
				        method="post">
				        
			  				 <div class="form-group">
				                <p>
				                    <%
				                        if (null != request.getAttribute("errorMessage")) {
				                            out.println(request.getAttribute("errorMessage"));
				                        }                        %>
				                </p>    
				                <select name="chosen" class="form-control-lg form-control">
				                    <c:forEach var="user" items="${users}">
				                        <option value="${user.username}">${user.username}</option>
				                    </c:forEach>
				                </select>
				             </div>   
				
				            <input type="submit" class="btn btn-dark btn-lg"  value="dodaj administratora"
				                <c:if test="${numberOfAdmins >= 5}"><c:out value="disabled='disabled'"/></c:if>>  
				    </form>
				</div>	    
		    </div>
		</div>
	</div>

	   

	<div class="row conLab tableRow">
	
		<script type="text/javascript">
			var checkForm = function(form){
	    	var inputs = form.getElementsByTagName('input');
	    	for(var i = 0, l = inputs.length; i < l; i++){
	        	var input = inputs[i];
	        	if(input.type == "checkbox" && input.checked)
	            	return true;
	    	}
	    	alert('Nijedan administrator nije odabran');
	    	return false;
			};
		</script>	
		
		<form role="form" data-toggle="validator"
		 id="removeAdmins-form"
		 action="${pageContext.request.contextPath}/removeAdmins"
		 method="post" onsubmit="return checkForm(this);">

		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col" style="text-align: center">Nadimak</th>
					<th scope="col" style="text-align: center">Ime</th>
					<th scope="col" style="text-align: center">Prezime</th>
					<th scope="col" style="text-align: center">Odabir</th>
				</tr>
			</thead>
			<c:forEach var="admins" items="${admins}">
				<tbody>
					<tr>
						<th scope="row">${admins.username}</th>
						<td>${admins.firstName}</td>
						<td>${admins.lastName}</td>
						<td>
						 <div class="form-check">
						  <label class="form-check-label">
						   <input class="form-check-input" type="checkbox" name="selected"
							value="${admins.username}">
						  </label>
						 </div>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<input type="submit" class="btn btn-dark btn-lg btn-block"
			value="Oduzmi administratorska prava"
			<c:if test="${numberOfAdmins == 0}"><c:out value="disabled='disabled'"/></c:if>>
		<c:if test="${numberOfAdmins == 0}">
			<h4 style="color: red; text-align: center; margin-top: 10px">Sustav
				nema administratora, gumb za uklanjanje je onemogucen.</h4>
		</c:if>
	</form>
	
	</div>
    
 </div>


 <div class="footer">
   <p>AppTownFunk @ Copyright 2017.</p>
 </div>
  
 </body>   
</html>
    