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
		<form:form action="${pageContext.request.contextPath}/detailsUpdate/${detail.detailId}"
			method="post" modelAttribute="fileBucket"
			enctype="multipart/form-data" class="form-horizontal">
			<p>
				<%
					if (null != request.getAttribute("errorMessage")) {
						out.println(request.getAttribute("errorMessage"));
					}
				%>
			</p>
			<input type="text" name="name" value="${detail.name}" required />
			<textarea name="description"
				rows="20" cols="80" required>${detail.description}</textarea>
			<p>Trenutna slika</p>
			<a target="_blank" href="${detail.image_path}">
						<img src="${detail.image_path}" alt="Image">
				</a>
			<form:input type="file" path="files[0].file" id="files[0].file"/>
			<p>Trenutni audio zapis</p>
			<a href="${detail.audio_path}">Audio</a>
			<form:input type="file" path="files[1].file" id="files[1].file"/>
			<input type="submit" name="Update">
		</form:form>
	</div>
</body>
</html>