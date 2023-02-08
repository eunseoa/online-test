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
							<td>문제</td>
							<td>${t.questionTitle}</td>
						</tr>
					</c:if>
					<tr>
						<td>보기</td>
						<td>
							${t.exampleTitle} (${t.answer})
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<form method="post" action="${pageContext.request.contextPath}/teacher/test/addQuestion">
			<input type="hidden" name="testNo" value="${testNo}">
			<input type="hidden" name="questionCount" value="${testTitle.questionCount}">
			<c:set var="questionScore" value="${100 / testTitle.questionCount}"></c:set>
			<input type="hidden" name="questionScore" value="${Double.valueOf(questionScore).intValue()}">
			<c:forEach var="q" begin="1" end="${testTitle.questionCount}" step="1">
				<div>
					<table>
						<tr>
							<td>문제</td>
							<td>
								<input type="text" name="questionIdx" value="${q}" readonly>
							</td>
						</tr>
						<tr>
							<td>문제 이름</td>
							<td><input type="text" name="questionTitle" value="test"></td>
						</tr>
						<tr>
							<td>보기</td>
							<td>
								<div>
									번호 : <input type="text" name="exampleIdx" value="1" readonly>
									보기 : <input type="text" name="exampleTitle">
									<input type="radio" name="answer" value="1">
								</div>
								<div>
									번호 : <input type="text" name="exampleIdx" value="2" readonly>
									보기 : <input type="text" name="exampleTitle">
									<input type="radio" name="answer" value="2">
								</div>
								<div>
									번호 : <input type="text" name="exampleIdx" value="3" readonly>
									보기 : <input type="text" name="exampleTitle">
									<input type="radio" name="answer" value="3">
								</div>
								<div>
									번호 : <input type="text" name="exampleIdx" value="4" readonly>
									보기 : <input type="text" name="exampleTitle">
									<input type="radio" name="answer" value="4">
								</div>
							</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			<button type="submit">질문 등록</button>
		</form>
	</body>
</html>