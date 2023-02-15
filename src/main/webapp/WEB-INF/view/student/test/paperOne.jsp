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
			<c:forEach var="p" items="${paperOne}">
				<div>
					<c:if test="${p.exampleIdx == 1}">
						<tr>
							<th>
								${p.questionIdx}.&nbsp;${p.questionTitle}
							</th>
						</tr>
					</c:if>
					<c:if test="${p.exampleIdx == 1}">
						<tr>
							<td>1. ${p.exampleTitle}</td>
						</tr>
					</c:if>
					<c:if test="${p.exampleIdx == 2}">
						<tr>
							<td>2. ${p.exampleTitle}</td>
						</tr>
					</c:if>
					<c:if test="${p.exampleIdx == 3}">
						<tr>
							<td>3. ${p.exampleTitle}</td>
						</tr>
					</c:if>
					<c:if test="${p.exampleIdx == 4}">
						<tr>
							<td>4. ${p.exampleTitle}</td>
						</tr>
					</c:if>
				</div>
				<c:if test="${p.exampleAnswer eq '정답'}">
					<tr>
						<td>
							${p.exampleIdx}. &nbsp; ${p.exampleTitle}
						</td>
					</tr>
				</c:if>
				<c:if test="${p.exampleIdx == 4}">
					<tr>
						<td>
							${p.paperAnswer}. &nbsp; ${p.answerOx}
						</td>
					</tr>
				</c:if>
			</c:forEach>
			</table>
	</body>
</html>