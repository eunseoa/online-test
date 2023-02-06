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
		<form method="post" action="${pageContext.request.contextPath}/teacher/addTest">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="testTitle"></td>
				</tr>
				<tr>
					<td>문제</td>
					<td><input type="text" name="questionIdx"></td>
				</tr>
				<tr>
					<td>문제 이름</td>
					<td><input type="text" name="questionTitle"></td>
				</tr>
				<tr>
					<td>보기</td>
					<td>
						<div>
							번호 : <input type="text" name="exampleIdx">
							보기 : <input type="text" name="exampleTitle">
							정답 여부 : <input type="text" name="answer">
						</div>
						<div>
							번호 : <input type="text" name="exampleIdx">
							보기 : <input type="text" name="exampleTitle">
							정답 여부 : <input type="text" name="answer">
						</div>
						<div>
							번호 : <input type="text" name="exampleIdx">
							보기 : <input type="text" name="exampleTitle">
							정답 여부 : <input type="text" name="answer">
						</div>
						<div>
							번호 : <input type="text" name="exampleIdx">
							보기 : <input type="text" name="exampleTitle">
							정답 여부 : <input type="text" name="answer">
						</div>
					</td>
				</tr>
			</table>
			<button type="submit">시험 등록</button>
		</form>
	</body>
</html>