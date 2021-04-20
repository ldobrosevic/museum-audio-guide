<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<a href="/">Naslovnica</a>
<h1>Detalji</h1>
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
<div>
	<table style="width: 100%">
		<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Audio</th>
			<th>Image</th>

		</tr>

		<c:forEach var="details" items="${details}">

			<tr>
				<th><a href="/exhibitDetails/${details.detailId}">${details.name}</a></th>
				<th>${details.description}</th>
				<th><a href="${details.audio_path}">Audio</a></th>

				<th><a target="_blank" href="${details.image_path}">
						<img src="${details.image_path}" alt="Image">
				</a></th>
				<th>
					<a href="${pageContext.request.contextPath}/detailsUpdate/${details.detailId}" class="btn btn-default">Update</a>
				</th>
				<th>
					<a href="${pageContext.request.contextPath}/exhibitDetails" class="btn btn-default" onclick="deleteExhibitDetail(${details.detailId})">Delete</a>
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
