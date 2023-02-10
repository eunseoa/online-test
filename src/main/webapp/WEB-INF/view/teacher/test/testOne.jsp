<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#titleBtn').click(function() {
					let html = 
						`
						<input type="text" name="testNo" value="${testTitle.testNo}">
						<input type="text" name="testTitle" value="${testTitle.testTitle}">
						<input type="date" name="createdate" value="${testTitle.createdate}">
						<button type="submit">제목 수정</button>
						`
					$(this.form).children('div').html(html);
				});
			});
		</script>
	</head>
	<body>
		<form method="post" action="${pageContext.request.contextPath}/teacher/test/modifyTestTitle">
			<div><h3>${testTitle.testTitle}</h3><button type="button" id="titleBtn">수정</button></div>
		</form>
		
		<div>
			<table>
				<c:forEach var="t" items="${testOne}">
					<form>
						<div>
							<c:if test="${t.exampleIdx == 1}">
								<tr>
									<th>
										${t.questionIdx}.&nbsp;${t.questionTitle}
										<a href="${pageContext.request.contextPath}/teacher/test/modifyQuestion?questionNo=${t.questionNo}">문제 수정</a>
									</th>
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
						</div>
					</form>
				</c:forEach>
			</table>
		</div>
	</body>
</html>