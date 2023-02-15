<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
		<title>Login</title>
		<meta name="description" content="" />
		<link rel="icon" type="image/x-icon" href="./assets/img/favicon/favicon.ico" />
		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />
		<link rel="stylesheet" href="./assets/vendor/fonts/boxicons.css" />
		<link rel="stylesheet" href="./assets/vendor/css/core.css" class="template-customizer-core-css" />
		<link rel="stylesheet" href="./assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
		<link rel="stylesheet" href="./assets/css/demo.css" />
		<link rel="stylesheet" href="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
		<link rel="stylesheet" href="./assets/vendor/css/pages/page-auth.css" />
		<link rel="stylesheet" href="./assets/vendor/css/pages/page-misc.css" />
		<script src="./assets/vendor/js/helpers.js"></script>
		<script src="./assets/js/config.js"></script>
	</head>
	<body>
		<!-- 로그인 전 -->
		<c:if test="${loginStudent == null}">
			<div class="container-xxl">
				<div class="authentication-wrapper authentication-basic container-p-y">
					<div class="authentication-inner">
						<div class="card">
							<div class="card-body">
								<div class="app-brand justify-content-center">
									<span class="app-brand-text demo text-body fw-bolder">Studnet</span>
								</div>
								<h4 class="mb-2">Welcome! 👋</h4>
								<form method="post" action="${pageContext.request.contextPath}/loginStudent">
									<div class="mb-3">
										<label for="id" class="form-label">ID</label>
										<input type="text" class="form-control" id="id" name="studentId" autofocus />
									</div>
									<div class="mb-3 form-password-toggle">
										<div class="d-flex justify-content-between">
											<label class="form-label" for="password">Password</label> 
										</div>
										<div class="input-group input-group-merge">
											<input type="password" id="password" class="form-control" name="studentPw" aria-describedby="password" /> 
											<span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
										</div>
									</div>
									<div class="mb-3">
										<button class="btn btn-primary d-grid w-100" type="submit">Login</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<!-- 로그인 상태 -->
		<c:if test="${loginStudent != null}">
			<div class="container-xxl container-p-y">
				<div class="misc-wrapper">
					<h2 class="mb-2 mx-2">${loginStudent.studentName}님, 반갑습니다</h2>
					<p class="mb-4 mx-2">&nbsp;</p>
					<a href="${pageContext.request.contextPath}/student/test/testList" class="btn btn-primary">Home</a>
					<div class="mt-4">
						<img src="./assets/img/illustrations/girl-doing-yoga-light.png"
							alt="girl-doing-yoga-light" width="500" class="img-fluid"
							data-app-dark-img="illustrations/girl-doing-yoga-dark.png"
							data-app-light-img="illustrations/girl-doing-yoga-light.png" />
					</div>
				</div>
			</div>
		</c:if>
		<div class="layout-overlay layout-menu-toggle"></div>
		<script src="./assets/vendor/libs/jquery/jquery.js"></script>
		<script src="./assets/vendor/libs/popper/popper.js"></script>
		<script src="./assets/vendor/js/bootstrap.js"></script>
		<script src="./assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
		<script src="./assets/vendor/js/menu.js"></script>
		<script src="./assets/vendor/libs/apex-charts/apexcharts.js"></script>
		<script src="./assets/js/main.js"></script>
		<script src="./assets/js/dashboards-analytics.js"></script>
		<script async defer src="https://buttons.github.io/buttons.js"></script>
	</body>
</html>