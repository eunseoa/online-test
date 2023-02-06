<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<div>
			<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
		</div>
		<a href="${pageContext.request.contextPath}/teacher/addTest">시험 등록</a>
		<h2>Test List</h2>
		<table border="1">
			<tr>
				<th>시험 제목</th>
				<th>시험 일자</th>
			</tr>
			<c:forEach var="t" items="${list}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/teacher/testOne?testNo=${t.testNo}">${t.testTitle}</a></td>
					<td>${t.createdate}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>