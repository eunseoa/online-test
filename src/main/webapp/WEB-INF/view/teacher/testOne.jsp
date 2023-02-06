<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<c:forEach var="t" items="${list}">
			${t.testNo}<br>
			${t.testTitle}<br>
			${t.questionIdx}, ${t.questionTitle}<br>
		</c:forEach>
	</body>
</html>