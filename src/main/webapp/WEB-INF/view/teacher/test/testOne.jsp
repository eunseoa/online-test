<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<h3>${testTitle.testTitle}</h3>
		<!-- jquery 이용해서 동적으로 수정 -->
		<form method="post" action="${pageContext.request.contextPath}/teacher/test/modifyTestTitle">
			<input type="text" name="testNo" value="${testTitle.testNo}">
			<input type="text" name="testTitle" value="${testTitle.testTitle}">
			<input type="date" name="createdate" value="${testTitle.createdate}">
			<button type="submit">제목 수정</button>
		</form>
		<div>
			<table>
				<c:forEach var="t" items="${testOne}">
					<c:if test="${t.exampleIdx == 1}">
						<tr>
							<th>${t.questionIdx}.&nbsp;${t.questionTitle}</th>
						</tr>
					</c:if>
					<c:if test="${t.exampleIdx == 1}">
						<tr>
							<td>${t.exampleTitle} (${t.answer})</td>
						</tr>
					</c:if>
					<c:if test="${t.exampleIdx == 2}">
						<tr>
							<td>${t.exampleTitle} (${t.answer})</td>
						</tr>
					</c:if>
					<c:if test="${t.exampleIdx == 3}">
						<tr>
							<td>${t.exampleTitle} (${t.answer})</td>
						</tr>
					</c:if>
					<c:if test="${t.exampleIdx == 4}">
						<tr>
							<td>${t.exampleTitle} (${t.answer})</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</body>
</html>