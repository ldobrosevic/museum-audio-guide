<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<title>Add administrator</title>
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
	<a href="/">Naslovnica</a>
	<h5>Max. number of administrators allowed: 5</h5>
	<h5>Current number : ${numberOfAdmins}</h5>

	<table class="table">
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

	<form role="form" data-toggle="validator" id="addAdministrator-form"
		action="${pageContext.request.contextPath}/addAdministrator"
		method="post">

		<div class="form-group">
			<p>
				<%
					if (null != request.getAttribute("errorMessage")) {
						out.println(request.getAttribute("errorMessage"));
					}
				%>
			</p>
			<label>Username: </label><br> 
			<select name="chosen">
				<c:forEach var="user" items="${users}">
					<option value="${user.username}">${user.username}</option>
				</c:forEach>
			</select>
		</div>
		<input type="submit" class="btn btn-primary" value="add administrator"
			<c:if test="${numberOfAdmins >= 5}"><c:out value="disabled='disabled'"/></c:if>>
		<!--<button type="submit" class="btn btn-primary"  >Add administrator</button>-->
	</form>


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


