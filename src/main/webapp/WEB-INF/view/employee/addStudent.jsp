<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	</head>
	<body>
		<h3>학생 등록</h3>
		<form>
			<div>
				<input type="text" id="id">
				<button type="button" id="ckBtn">중복 검사</button>
			</div>
		</form>
		<form method="post" action="${pageContext.request.contextPath}/employee/student/addStudent" id="addForm">
			${errorMsg}
			<table border="1">
				<tr>
					<td>ID</td>
					<td><input type="text" name="studentId" id="studentId" readonly></td>
				</tr>
				<tr>
					<td>Pw</td>
					<td><input type="password" name="studentPw"></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" name="studentName"></td>
				</tr>
			</table>
			<button type="submit" id="addBtn">학생 추가</button>
		</form>
		<script>
			$('#ckBtn').click(function() {
				$.ajax({
					url : 'idck'
					, type : 'get'
					, data : {studentId : $('#id').val()}
					, success : function(model){ // model : 'YES' / 'NO'
						if(model == 'YES') {
							// 사용가능한 아이디
							$('#studentId').val($('#id').val());
						} else {
							// 사용중인 아이디
							alert($('#id').val() + '는 사용중인 아이디입니다');
						}
					}
				})
			})
		
			$('#addBtn').click(function() {
				// 폼 유효성 검사
				// 폼 액션 전송
			});
		</script>
	</body>
</html>