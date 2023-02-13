<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<c:forEach var="q" begin="1" end="${testTitle.questionCount}" step="1">
			<script>
				$(document).ready(function() {
					$('#queBtn').click(function() {
						if($("input[name='answer${q}']:checked")) {
							var answer = $("input[name='answer${q}']:checked").val();
							console.log(answer);
							$("#answer${q}").val(answer);
						}
						$('#examplForm').submit();
					});
				});
			</script>
		</c:forEach>
	</head>
	<body>
		<h3>${testTitle.testTitle}</h3>
		<form method="post" action="${pageContext.request.contextPath}/teacher/test/addQuestion" id="examplForm">
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
							<td><input type="text" name="questionTitle" value="test"><input type="hidden" id="answer${q}" name="answer"></td>
						</tr>
						<tr>
							<td>보기</td>
							<td>
								<div>
									번호 : <input type="text" name="exampleIdx" value="1" readonly>
									보기 : <input type="text" name="exampleTitle" value="${q}-1">
									<input type="radio" name="answer${q}" value="1">
								</div>
								<div>
									번호 : <input type="text" name="exampleIdx" value="2" readonly>
									보기 : <input type="text" name="exampleTitle" value="${q}-2">
									<input type="radio" name="answer${q}" value="2">
								</div>
								<div>
									번호 : <input type="text" name="exampleIdx" value="3" readonly>
									보기 : <input type="text" name="exampleTitle" value="${q}-3">
									<input type="radio" name="answer${q}" value="3">
								</div>
								<div>
									번호 : <input type="text" name="exampleIdx" value="4" readonly>
									보기 : <input type="text" name="exampleTitle" value="${q}-4">
									<input type="radio" name="answer${q}" value="4">
								</div>
							</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			<button type="button" id="queBtn">질문 등록</button>
		</form>
	</body>
</html>