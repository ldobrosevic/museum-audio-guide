<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>  
</head>
	
<body>
	<c:if test="${user.username != null }">
		<c:redirect url="${pageContext.request.contextPath}/"/>
	</c:if>

	<form name="login" action="${pageContext.request.contextPath}/login" method="post">
	
		<ul>
		  <li><label for="username">Username:</label></li>
		  <li><input type="text" name="username" required /></li>  
		
		  <li><label for="password">Password:</label></li>
		  <li><input type="password" name="password" required /></li>  
		  
		  <li><input type="submit" name="submit" value="Sign in" /></li>  
		</ul>
	</form>
</body>
</html>
