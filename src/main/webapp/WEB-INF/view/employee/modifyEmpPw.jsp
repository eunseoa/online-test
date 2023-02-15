<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />
		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet"/>
		<link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />
		<link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
	    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
	    <link rel="stylesheet" href="../assets/css/demo.css" />
	    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
	    <link rel="stylesheet" href="../assets/vendor/css/pages/page-auth.css" />
	    <script src="../assets/vendor/js/helpers.js"></script>
	    <script src="../assets/js/config.js"></script>
	</head>
	<body>
		<div class="container-xxl">
			<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
			<div class="authentication-wrapper authentication-basic container-p-y" style="margin-left: 50px;">
				<div class="authentication-inner py-4">
					<div class="card">
						<div class="card-body">
							<div class="app-brand justify-content-center">
								<span class="app-brand-text demo text-body fw-bolder">${loginEmp.empName}</span>
							</div>
							<!-- /Logo -->
							<h4 class="mb-2">Change Password 🔒</h4>
							<form class="mb-3" method="post" action="${pageContext.request.contextPath}/employee/modifyEmpPw">
								<div class="mb-3">
									<label for="newPw" class="form-label">New PASSWORD</label> 
									<input type="text" class="form-control" id="newPw" name="newPw" autofocus />
								</div>
								<div class="mb-3">
									<label for="oldPw" class="form-label">Check PASSWORD</label> 
									<input type="text" class="form-control" id="oldPw" name="oldPw" autofocus />
								</div>
								<button class="btn btn-primary d-grid w-100" type="button">Change</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>