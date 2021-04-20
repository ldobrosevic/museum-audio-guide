<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en" >

<head>
      
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="frontend/css_nika/exhibitions-new.css" />
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
    var url = "exhibitions/" + string;    
    
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
  <h1>Sve izložbe</h1>
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
                    <li class="nav-item active">
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
  
  <div class="container" style="position: absolute; background-color: white;">
  
    <div class="row" style="margin-top:2%;"><p></p></div>
	<h1 style="margin-bottom:5%; text-align:center; ">Sve izložbe</h1>
	<h1></h1>
    <!--  <div class="row" style="margin-bottom:5%; text-align:center">
      <div class="col-sm"><strong>Naziv</strong></div>
      <div class="col-sm"><strong>Opis</strong></div>
      <div class="col-sm"><strong>Datum početka</strong></div>
      <div class="col-sm"><strong>Datum završetka</strong></div>
      <div class="col-sm"><strong>Slika</strong></div>
    </div>-->

 <c:forEach var="exhibitions" items="${exhibitions}">
    <div class="row" style="border-block-end: 2px solid #333333; margin-left:2.5%; margin-right:2.5%; margin-top:2.5%; margin-bottom:10%">
        <div class="col-sm" style="text-align: center;"><a href="/exhibitions/${exhibitions.exhibitionId}"><h4>${exhibitions.nameOfExhibition}</h4></a>
			<c:if test="${user.role == 'admin' }">
	          <a href="${pageContext.request.contextPath}/exhibitionUpdate/${exhibitions.exhibitionId}" class="btn btn-default">Update</a>
      		    -
       		  <a href="${pageContext.request.contextPath}/exhibitions" class="btn btn-default" onclick="deleteExhibit(${exhibitions.exhibitionId})">Delete</a>
			</c:if>	         
        </div>
        <!--  <div class="col-sm" style="text-align:center"><p><strong>Opis: </strong></p>${exhibitions.description}</div>-->
        <div class="col-sm" style="text-align: center;">Datum početka: ${exhibitions.dateBegin}</div>
        <div class="col-sm" style="text-align: center;">Datum završetka: ${exhibitions.dateEnd}</div>
        <div class="col-sm" style="text-align: center;"><a target="_blank" href="/img/Types/${exhibitions.typeofExhibition}.jpg"><img style="width:125px;height:125px" src="/img/Types/${exhibitions.typeofExhibition}.jpg" alt="${exhibitions.typeofExhibition}" class="img-thumbnail"></a></div>
    </div>
  </c:forEach>


    <!-- <table class="table table-bordered">
      
        <thead>
            <tr>
                <th scope="col" style="text-align: center">Naziv</th>
                <th scope="col" style="text-align: center">Opis</th>
                <th scope="col" style="text-align: center">Datum poÄetka</th>
                <th scope="col" style="text-align: center">Datum zavrÅ¡etka</th>
                <th scope="col" style="text-align: center">Slika</th>
            </tr>
        </thead>
        <tbody>Update
            <tr>
                <td style="width: 10%">Van Gogh Alive</td>
                <td>Van Gogh Alive je nevjerojatno, nadahnjujuÄe iskustvo koje se proÅ¡iruje maÅ¡tu. Ovo kreativno iskustvo svjetske klase ne smijete propustiti!</td>
                <td>2017-01-21</td>
                <td>2017-02-21</td>
                <td  style="text-align: center;"><img src="http://icdn.ensonhaber.com/resimler/diger/van-goh_6.jpg" alt="..." class="img-thumbnail"></td>
            </tr>

            <tr>
                <td>Rodin u MET-u</td>
                <td>Na stogodiÅ¡njicu smrti Augusta Rodina (1840.-1917.) MET slavi svoju povijesnu zbirku umjetniÄkog djela. 
                    Gotovo 50 Rodinovih djela od mramora, bronce, Å¾buke i terakote, koja predstavlja viÅ¡e od jednog stoljeÄa 
                    akvizicije i darova Muzeju, prikazana su u novoinstaliranoj i obnovljenoj Galeriji skulptura B. Gerald Cantor (galerija 800).</td>
                <td>2017-01-21</td>
                <td>2017-02-21</td>
                <td style="text-align: center;"><img src="http://cdn1.bostonmagazine.com/wp-content/uploads/2016/03/Rodin-PEM-peabody-essex-museum-4-1200x797.jpg" alt="..." class="img-thumbnail"></td>
            </tr>

            <tr>
                <td>Warholova kolekcija</td>
                <td>Muzej Andy Warhol ima najveÄu zbirku Warholove umjetnosti i arhiva u svijetu. Umjetnikov rad od 1940-ih do njegove 
                    smrti 1987. nalazi se na pet katova muzeja. Muzej takoÄer ima stalni film i video galeriju na Äetvrtom katu za 
                    gledanje pojedinaÄnih filmova i videozapisa o Å¾ivotu i djelu Andyja Warhola.</td>
                <td>2017-01-21</td>
                <td>2017-02-21</td>
                <td  style="text-align: center;"><img src="http://1.bp.blogspot.com/-AdlJWgmz1bM/UFdh92UxCQI/AAAAAAAAMgw/eSS051aMqSY/s1600/Andy+Warhol+Exhibit.jpg" alt="..." class="img-thumbnail"></td>
            </tr>

            <tr>
                <td>Dino izloÅ¾ba</td>
                <td>AmeriÄki prirodoslovni muzej ima jednu od najveÄih fosilnih zbirki dinosaura u svijetu. IstraÅ¾ite svjetski poznate eksponate dinosaura kroz dosad neviÄenu izloÅ¾bu ovih fascinantnih izumrlih Å¾ivina.</td>
                <td>2017-01-21</td>
                <td>2017-02-21</td>    
                <td  style="text-align: center;"><img src="http://ansp.org/~/media/Images/ans/visit/exhibits/dinosaurs/DinoHall_Tyranno_Will-Klein-636.ashx?h=420&w=636&la=en&hash=F35B0AA26C21124040FA8E1858CB3B9380A86C5F" alt="..." class="img-thumbnail"></td>
            </tr>            <tr>
              <td style="width: 10%">Van Gogh Alive</td>
              <td>Van Gogh Alive je nevjerojatno, nadahnjujuÄe iskustvo koje se proÅ¡iruje maÅ¡tu. Ovo kreativno iskustvo svjetske klase ne smijete propustiti!</td>
              <td>2017-01-21</td>
              <td>2017-02-21</td>
              <td  style="text-align: center;"><img src="http://icdn.ensonhaber.com/resimler/diger/van-goh_6.jpg" alt="..." class="img-thumbnail"></td>
          </tr>

          <tr>
              <td>Rodin u MET-u</td>
              <td>Na stogodiÅ¡njicu smrti Augusta Rodina (1840.-1917.) MET slavi svoju povijesnu zbirku umjetniÄkog djela. 
                  Gotovo 50 Rodinovih djela od mramora, bronce, Å¾buke i terakote, koja predstavlja viÅ¡e od jednog stoljeÄa 
                  akvizicije i darova Muzeju, prikazana su u novoinstaliranoj i obnovljenoj Galeriji skulptura B. Gerald Cantor (galerija 800).</td>
              <td>2017-01-21</td>
              <td>2017-02-21</td>
              <td style="text-align: center;"><img src="http://cdn1.bostonmagazine.com/wp-content/uploads/2016/03/Rodin-PEM-peabody-essex-museum-4-1200x797.jpg" alt="..." class="img-thumbnail"></td>
          </tr>

          <tr>
              <td>Warholova kolekcija</td>
              <td>Muzej Andy Warhol ima najveÄu zbirku Warholove umjetnosti i arhiva u svijetu. Umjetnikov rad od 1940-ih do njegove 
                  smrti 1987. nalazi se na pet katova muzeja. Muzej takoÄer ima stalni film i video galeriju na Äetvrtom katu za 
                  gledanje pojedinaÄnih filmova i videozapisa o Å¾ivotu i djelu Andyja Warhola.</td>
              <td>2017-01-21</td>
              <td>2017-02-21</td>
              <td  style="text-align: center;"><img src="http://1.bp.blogspot.com/-AdlJWgmz1bM/UFdh92UxCQI/AAAAAAAAMgw/eSS051aMqSY/s1600/Andy+Warhol+Exhibit.jpg" alt="..." class="img-thumbnail"></td>
          </tr>

          <tr>
              <td>Dino izloÅ¾ba</td>
              <td>AmeriÄki prirodoslovni muzej ima jednu od najveÄih fosilnih zbirki dinosaura u svijetu. IstraÅ¾ite svjetski poznate eksponate dinosaura kroz dosad neviÄenu izloÅ¾bu ovih fascinantnih izumrlih Å¾ivina.</td>
              <td>2017-01-21</td>
              <td>2017-02-21</td>    
              <td  style="text-align: center;"><img src="http://ansp.org/~/media/Images/ans/visit/exhibits/dinosaurs/DinoHall_Tyranno_Will-Klein-636.ashx?h=420&w=636&la=en&hash=F35B0AA26C21124040FA8E1858CB3B9380A86C5F" alt="..." class="img-thumbnail"></td>
          </tr>
        </tbody>
    </table>   -->

    <div class="row"><p></p></div>
  </div>
</div>

</body>
</html>