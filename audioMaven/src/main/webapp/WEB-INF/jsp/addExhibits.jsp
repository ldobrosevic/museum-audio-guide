<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<a href="/">Naslovnica</a>
<h1>Svi izlosci</h1>
<div>
	<script type="text/javascript">
		var checkForm = function(form) {
			var inputs = form.getElementsByTagName('input');
			for (var i = 0, l = inputs.length; i < l; i++) {
				var input = inputs[i];
				if (input.type == "checkbox" && input.checked)
					return true;
			}
			alert('Nijedan izložak nije odabran');
			return false;
		};
	</script>
	<form role="form" data-toggle="validator" id="addExhibits-form"
		action="${pageContext.request.contextPath}" method="post"
		onSubmit="return checkForm(this);">
		<table style="width: 100%" class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Select</th>
					<th scope="col">Ime</th>
				</tr>
			</thead>
			<c:forEach var="exhibits" items="${exhibits}">

				<tr>
					<th scope="row"><input type="checkbox" name="selected"
						value="${exhibits.exhibitId}"></th>
					<th><a href="/exhibits/${exhibits.exhibitId}">${exhibits.name}</a></th>

				</tr>
			</c:forEach>
		</table>
		<input type="submit" class="btn btn-primary btn-lg btn-block"
			value="Add exhibits">

	</form>

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