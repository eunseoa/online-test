<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<h2>문제 수정</h2>
		<form method="post" action="${pageContext.request.contextPath}/teacher/test/modifyQuestion">
			<c:forEach var="q" items="${questionOne}">
				<table>
					<c:if test="${q.exampleIdx == 1}">
						<tr>
							<td>
								<input type="hidden" name="testNo" value="${q.testNo}">
								<input type="hidden" name="questionNo" value="${q.questionNo}">
								${q.questionIdx}.&nbsp;<input type="text" name="questionTitle" value="${q.questionTitle}">
							</td>
						</tr>
					</c:if>
					<c:if test="${q.exampleIdx == 1}">
						<tr>
							<td>
								<input type="hidden" name="questionNo" value="${q.questionNo}">
								<input type="hidden" name="exampleNo" value="${q.exampleNo}">
								<input type="text" name="exampleTitle" value="${q.exampleTitle}">
								<select name="answer">
									<option value="오답" <c:out value="${q.answer == '오답' ? 'selected':'' }"/>>오답</option>
									<option value="정답" <c:out value="${q.answer == '정답' ? 'selected':'' }"/>>정답</option>
								</select>
							</td>
						</tr>
					</c:if>
					<c:if test="${q.exampleIdx == 2}">
						<tr>
							<td>
								<input type="hidden" name="questionNo" value="${q.questionNo}">
								<input type="hidden" name="exampleNo" value="${q.exampleNo}">
								<input type="text" name="exampleTitle" value="${q.exampleTitle}">
								<select name="answer">
									<option value="오답" <c:out value="${q.answer == '오답' ? 'selected':'' }"/>>오답</option>
									<option value="정답" <c:out value="${q.answer == '정답' ? 'selected':'' }"/>>정답</option>
								</select>
							</td>
						</tr>
					</c:if>
					<c:if test="${q.exampleIdx == 3}">
						<tr>
							<td>
								<input type="hidden" name="questionNo" value="${q.questionNo}">
								<input type="hidden" name="exampleNo" value="${q.exampleNo}">
								<input type="text" name="exampleTitle" value="${q.exampleTitle}">
								<select name="answer">
									<option value="오답" <c:out value="${q.answer == '오답' ? 'selected':'' }"/>>오답</option>
									<option value="정답" <c:out value="${q.answer == '정답' ? 'selected':'' }"/>>정답</option>
								</select>
							</td>
						</tr>
					</c:if>
					<c:if test="${q.exampleIdx == 4}">
						<tr>
							<td>
								<input type="hidden" name="questionNo" value="${q.questionNo}">
								<input type="hidden" name="exampleNo" value="${q.exampleNo}">
								<input type="text" name="exampleTitle" value="${q.exampleTitle}">
								<select name="answer">
									<option value="오답" <c:out value="${q.answer == '오답' ? 'selected':'' }"/>>오답</option>
									<option value="정답" <c:out value="${q.answer == '정답' ? 'selected':'' }"/>>정답</option>
								</select>
							</td>
						</tr>
					</c:if>
				</table>
			</c:forEach>
			<button type="submit">문제 수정</button> 
		</form>
	</body>
</html>