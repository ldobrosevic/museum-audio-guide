<%@page import="org.hibernate.validator.internal.util.privilegedactions.GetAnnotationParameter"%>
<%@page import="hr.fer.apptownfunk.models.TypeOfExhibition"%>
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
		<form:form action="${pageContext.request.contextPath}/exhibitions"
			method="post" class="form-horizontal">
			<input type="text" name="name" placeholder="Name of exhibition"
				required />
			<textarea name="description" placeholder="Description of exhibition"
				rows="20" cols="80" required></textarea>
			<input name="begin" type="date" required />
			<input name="end" type="date" required />
			<label>Vrsta izlozbe: </label><br> 
			<select name="chosen">
				<c:forEach var="types" items="${enums}">
					<option value="${types}">${types.type}</option>
				</c:forEach>
			</select>
			<input type="submit" name="Upload">
		</form:form>
	</div>
</body>
</html>