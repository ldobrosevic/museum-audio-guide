<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<a href="/">Naslovnica</a>
<h1>Sve izlozbe</h1>

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

<div>
	<table style="width: 100%">
		<tr>
			<th>Ime</th>
			<th>Opis</th>
			<th>Datum pocetka</th>
			<th>Datum zavrsetka</th>

		</tr>

		<c:forEach var="exhibitions" items="${exhibitions}">

			<tr>
				<th><a href="/exhibitions/${exhibitions.exhibitionId}">${exhibitions.nameOfExhibition}</a></th>
				<th>${exhibitions.description}</th>
				<th>${exhibitions.dateBegin}</th>
				<th>${exhibitions.dateEnd}</th>
				<th><img src="/img/Types/${exhibitions.typeofExhibition}.jpg" alt="${exhibitions.typeofExhibition}" class="img-thumbnail"></th>
				<th>
					<a href="${pageContext.request.contextPath}/exhibitionUpdate/${exhibitions.exhibitionId}" class="btn btn-default">Update</a>
				</th>
				<th>
					<a href="${pageContext.request.contextPath}/exhibitions" class="btn btn-default" onclick="deleteExhibit(${exhibitions.exhibitionId})">Delete</a>
				</th>
			</tr>
		</c:forEach>
	</table>

</div>

<style>
img {
	border: 1px solid #ddd; /* Gray border */
	border-radius: 4px; /* Rounded border */
	padding: 5px; /* Some padding */
	width: 150px; /* Set a small width */
}

/* Add a hover effect (blue shadow) */
img:hover {
	box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}
</style>