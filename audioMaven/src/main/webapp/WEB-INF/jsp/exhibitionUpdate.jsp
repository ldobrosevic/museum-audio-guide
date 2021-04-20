<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<form:form action="${pageContext.request.contextPath}/exhibitionUpdate/${exhibition.exhibitionId}"
			method="post" class="form-horizontal">
			<input type="text" name="name" value="${exhibition.nameOfExhibition}" required />
			<textarea name="description"
				rows="20" cols="80" required>${exhibition.description}</textarea>
			<input name="begin" type="date" value="${begin}"required />
			<input name="end" type="date" value="${end}"required />
			<label>Vrsta izložbe: </label><br> 
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