<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring 4 MVC File Upload Example</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet" type="text/css"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"
	type="text/css"></link>
</head>
<body>
	<a href="/">Naslovnica</a>
	<div class="form-container">
		<form:form action="${pageContext.request.contextPath}/exhibits"
			method="post" modelAttribute="fileBucket"
			enctype="multipart/form-data" class="form-horizontal">
			<p>
				<%
					if (null != request.getAttribute("errorMessage")) {
						out.println(request.getAttribute("errorMessage"));
					}
				%>
			</p>
			<input type="text" name="name" placeholder="Name of exhibit" required />
			<textarea name="description" placeholder="Description of exhibit"
				rows="20" cols="80" required></textarea>
			<p>Molimo odaberite sliku za upload</p>
			<form:input type="file" path="files[0].file" id="files[0].file"/>
			<p>Molimo odaberite audio za upload</p>
			<form:input type="file" path="files[1].file" id="files[1].file"/>
			<input type="submit" name="Upload">
		</form:form>
	</div>
</body>
</html>