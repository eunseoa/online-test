<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<h3>학생 등록</h3>
		<form method="post" action="${pageContext.request.contextPath}/employee/student/addStudent">
			${errorMsg}
			<table border="1">
				<tr>
					<td>ID</td>
					<td><input type="text" name="studentId"></td>
				</tr>
				<tr>
					<td>Pw</td>
					<td><input type="password" name="studentPw"></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" name="studentName"></td>
				</tr>
			</table>
			<button type="submit">등록</button>
		</form>
	</body>
</html>