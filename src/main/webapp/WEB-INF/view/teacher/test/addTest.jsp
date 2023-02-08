<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<table>
			
		</table>
		<form method="post" action="${pageContext.request.contextPath}/teacher/test/addTest">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="testTitle"></td>
				</tr>
				<tr>
					<td>시험 일자</td>
					<td><input type="date" name="createdate"></td>
				</tr>
				<tr>
					<td>문제 개수</td>
					<td>
						<select name="questionCount">
							<option value="5">5문제</option>
							<option value="10">10문제</option>
							<option value="15">15문제</option>
							<option value="20">20문제</option>
							<option value="25">25문제</option>
						</select>
					</td>
				</tr>
			</table>
			<button type="submit">시험 등록</button>
		</form>
	</body>
</html>