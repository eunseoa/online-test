<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<c:forEach var="t" items="${testList}">
			<c:if test="${t.exampleIdx == 1}">
				<script>
					$(document).ready(function() {
						$('#paperBtn').click(function() {
							if($("input[name='answer${t.questionIdx}']:checked")) {
								var answer = $("input[name='answer${t.questionIdx}']:checked").val();
								console.log(answer);
								$("#answer${t.questionIdx}").val(answer);
							}
							$('#paperForm').submit();
						});
					});
				</script>
			</c:if>
		</c:forEach>
	</head>
	<body>
		<form method="post" action="${pageContext.request.contextPath}/student/test/addPaper" id="paperForm">
			<div>${testTitle.testTitle}</div>
			<div>${testTitle.questionCount}</div>
			<div>${testTitle.createdate}</div>
			<div>${loginStudent.studentNo}</div>
			<input type="hidden" name="questionCount" value="${testTitle.questionCount}">
			<input type="hidden" name="studentNo" value="${loginStudent.studentNo}">
			<input type="hidden" name="testNo" value="${testTitle.testNo}">
			<table>
				<c:forEach var="t" items="${testList}">
					<div>
						<c:if test="${t.exampleIdx == 1}">
							<tr>
								<th>
									${t.questionIdx}.&nbsp;${t.questionTitle}
									<input type="text" name="questionNo" value="${t.questionNo}">
									<input type="hidden" name="questionScore" value="${t.questionScore}">
									<input type="hidden" id="answer${t.questionIdx}" name="answer" value="0">
								</th>
							</tr>
						</c:if>
						<c:if test="${t.exampleIdx == 1}">
							<tr>
								<td>${t.exampleTitle}</td>
								<td><input type="radio" name="answer${t.questionIdx}" value="1"></td>
							</tr>
						</c:if>
						<c:if test="${t.exampleIdx == 2}">
							<tr>
								<td>${t.exampleTitle}</td>
								<td><input type="radio" name="answer${t.questionIdx}" value="2"></td>
							</tr>
						</c:if>
						<c:if test="${t.exampleIdx == 3}">
							<tr>
								<td>${t.exampleTitle}</td>
								<td><input type="radio" name="answer${t.questionIdx}" value="3"></td>
							</tr>
						</c:if>
						<c:if test="${t.exampleIdx == 4}">
							<tr>
								<td>${t.exampleTitle}</td>
								<td><input type="radio" name="answer${t.questionIdx}" value="4"></td>
							</tr>
						</c:if>
					</div>
				</c:forEach>
			</table>
			<button type="button" id="paperBtn">제출</button>
		</form>
	</body>
</html>