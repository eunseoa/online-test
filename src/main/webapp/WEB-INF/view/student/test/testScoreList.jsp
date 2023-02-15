<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<h2>시험 리스트</h2>
		<table border="1">
			<tr>
				<th>시험 제목</th>
				<th>점수</th>
				<th>시험 일자</th>
				<th></th>
			</tr>
			<c:forEach var="t" items="${testList}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/student/test/paperOne?testNo=${t.testNo}&studentNo=${loginStudent.studentNo}">${t.testTitle}</a></td>
					<td>${t.totalScore}</td>
					<td>${t.createdate}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>