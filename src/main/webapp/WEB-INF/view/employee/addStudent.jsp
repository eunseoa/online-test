<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="icon" type="image/x-icon" href="../../assets/img/favicon/favicon.ico" />
		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet"/>
		<link rel="stylesheet" href="../../assets/vendor/fonts/boxicons.css" />
		<link rel="stylesheet" href="../../assets/vendor/css/core.css" class="template-customizer-core-css" />
	    <link rel="stylesheet" href="../../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
	    <link rel="stylesheet" href="../../assets/css/demo.css" />
	    <link rel="stylesheet" href="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
	    <link rel="stylesheet" href="../../assets/vendor/css/pages/page-auth.css" />
	    <script src="../../assets/vendor/js/helpers.js"></script>
	    <script src="../../assets/js/config.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="container-xxl">
			<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
			<div class="authentication-wrapper authentication-basic container-p-y" style="margin-left: 50px;">
				<div class="authentication-inner py-4">
					<div class="card">
						<div class="card-body">
							<div class="app-brand justify-content-center">
								<span class="app-brand-text demo text-body fw-bolder">사원 추가</span>
							</div>
							<h4 class="mb-2">🚀</h4>
							<p class="mb-4">${errorMsg}</p>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="id" placeholder="아이디 중복검사" aria-label="Recipient's username" aria-describedby="button-addon2">
								<button class="btn btn-outline-primary" type="button" id="ckBtn">Button</button>
							</div>
							<form method="post" action="${pageContext.request.contextPath}/employee/student/addStudent" id="addForm">
								<div class="mb-3">
									<label for="empId" class="form-label">ID</label> 
									<input type="text" class="form-control" name="studentId" id="studentId" readonly autofocus />
								</div>
								<div class="mb-3 form-password-toggle">
									<div class="d-flex justify-content-between">
										<label class="form-label" for="studentPw"> PASSWORD</label> 
									</div>
									<div class="input-group input-group-merge">
										<input type="password" class="form-control" id="studentPw" name="studentPw" aria-describedby="password" /> 
										<span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
									</div>
								</div>
								<div class="mb-3">
									<label for="empName" class="form-label">Name</label> 
									<input type="text" class="form-control" id="studentName" name="studentName" autofocus />
								</div>
								<button class="btn btn-primary d-grid w-100" type="submit">추가</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="../assets/vendor/libs/jquery/jquery.js"></script>
	    <script src="../assets/vendor/libs/popper/popper.js"></script>
	    <script src="../assets/vendor/js/bootstrap.js"></script>
	    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	    <script src="../assets/vendor/js/menu.js"></script>
	    <script src="../assets/js/main.js"></script>
	    <script async defer src="https://buttons.github.io/buttons.js"></script>
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