<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="hr">
  <head>
    <title>Dodaj administratora</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
           height: 100vh;
           background: url("https://preview.ibb.co/giKBn6/final2.jpg") 50% fixed;
           background-size:50%;
        }.container{
           display: flex;
           align-items: center;
           flex-direction: column;
           justify-content: center;
           width: 100%;
           min-height: 100%;
           padding: 20px;
           background: rgba(255, 255, 255, 1);
           box-shadow: #ff8c66;
           overflow:overlay;
        }.left {
           position: absolute;
           top:195px;
           left: 330px;
           width: 300px;
           border: 3px solid  #333333;
           padding: 10px;
        }.heading {
           position: absolute;
           top: 80px;
           text-allign:center;
        }.maxAllowedMsg{
           position:absolute;
           left: 650px;
           top: 200px;
           width: 600px;
           padding: 25px;
           margin: 25px
        }.maxAllowed{
           position:absolute;
           left: 1000px;
           top: 200px;
           padding: 25px;
           margin: 25px;
           color: #00b8e6;
        }.currentMsg{
           position:absolute;
           left: 650px;
           top: 250px;
           width: 600px;
           padding: 25px;
           margin: 25px
        }.current{
           position:absolute;
           left: 1000px;
           top: 250px;
           padding: 25px;
           margin: 25px;
           color: #00b8e6;
        }.table-editable {
           position: relative;
        }.table{
           width:950px;
        }tr{
           border: 2px solid #333333;
        }.addButton{
           position:absolute;
           top:350px;
           left:965px;
        }select{
           position:absolute;
           top:350px;
           left:705px;
           line-height:30px;
           height:30px;
           background-color:#00b8e6;
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
                        <a class="nav-link" href="index.html">Naslovna</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutus.html">O muzeju</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="exhibitions.html">Izlo??be</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="exhibits.html">Izlo??ci</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">Kontakt</a>
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
    <h2 class="heading">UPRAVLJANJE ADMINISTRATORIMA</h2>
    <img class="left" src="http://www.pvhc.net/img37/pdswfrzyiocgaufsfuev.png">
    <p class="maxAllowedMsg">Najve??i dopu??teni broj administratora: </p>
    <p class ="maxAllowed">5</p>
    <p class="currentMsg">Trenutni broj administratora: </p>
    <p class ="current">${numberOfAdmins}</p>

    <form role="form" data-toggle="validator" id="addAdministrator-form"
        action="${pageContext.request.contextPath}/addAdministrator"
        method="post">

            <input type="submit" class="addButton btn btn-primary" value="dodaj administratora"
                <c:if test="${numberOfAdmins >= 5}"><c:out value="disabled='disabled'"/></c:if>>
            
            <div class="form-group">
                <p>
                    <%
                        if (null != request.getAttribute("errorMessage")) {
                            out.println(request.getAttribute("errorMessage"));
                        }                        %>
                </p>    
                <select name="chosen">
                    <c:forEach var="user" items="${users}">
                        <option value="${user.username}">${user.username}</option>
                    </c:forEach>
                </select>
             </div>   

    </form>

    <div class="table-editable" style="margin-left:-60px;margin-top:600px;">
        <table class="table" rules="rows">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Username</th>
                    <th scope="col">First name</th>
                    <th scope="col">Last name</th>
                </tr>
            </thead>
            <c:forEach var="admins" items="${admins}">
                <tbody>
                    <tr>
                        <th>${admins.username}</th>
                        <th>${admins.firstName}</th>
                        <th>${admins.lastName}</th>
                    </tr>
                </tbody>
            </c:forEach>
        </table>
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
