<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<title>Remove exhibits</title>
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
	<script type="text/javascript">
	var checkForm = function(form){
	    var inputs = form.getElementsByTagName('input');
	    for(var i = 0, l = inputs.length; i < l; i++){
	        var input = inputs[i];
	        if(input.type == "checkbox" && input.checked)
	            return true;
	    }
	    alert('Nijedan izložak nije odabran');
	    return false;
	};
	</script>
	<form role="form" data-toggle="validator"
		id="removeExhibits-form"
		action="${pageContext.request.contextPath}/removeExhibits/${exhibitionId}"
		method="post" onsubmit="return checkForm(this);">

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Select</th>
					<th scope="col">Name</th>
				</tr>
			</thead>
			<c:forEach var="exhibits" items="${exhibits}">
				<tbody>
					<tr>
						<th scope="row"><input type="checkbox" name="selected"
							value="${exhibits.exhibitId}"></th>
						<th>${exhibits.name}</th>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<input type="submit" class="btn btn-primary btn-lg btn-block"
			value="Remove selected exhibits">
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

