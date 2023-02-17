<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
	<div class="app-brand demo">
		<span class="app-brand-text demo menu-text fw-bolder ms-2">Online-Test</span>
	</div>
	<div class="menu-inner-shadow"></div>
	<ul class="menu-inner py-1">
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/student/test/studentTestList" class="menu-link">
				<i class="menu-icon tf-icons bx bx-user"></i>
				<span data-i18n="Analytics">시험 리스트</span>
			</a>
		</li>
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/student/test/testScoreList?studentNo=${loginStudent.studentNo}" class="menu-link">
				<i class="menu-icon tf-icons bx bx-glasses"></i>
				<span data-i18n="Analytics">시험 결과</span>
			</a>
		</li>
		
		<li class="menu-header small text-uppercase">
			<span class="menu-header-text">Log</span>
		</li>
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/student/modifyStudentPw" class="menu-link">
				<i class="menu-icon tf-icons bx bx-cog"></i>
				<span data-i18n="Analytics">비밀번호 수정</span>
			</a>
		</li>
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/student/logout" class="menu-link">
				<i class="menu-icon tf-icons bx bx-user-minus"></i>
				<span data-i18n="Analytics">로그아웃</span>
			</a>
		</li>
		
		<li class="menu-header small text-uppercase">
			<span class="menu-header-text">기능</span>
		</li>
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/loginEmp" class="menu-link">
				<i class="menu-icon tf-icons bx bx-plus"></i>
				<span data-i18n="Analytics">관리자 로그인</span>
			</a>
		</li>
		<li class="menu-item">
			<a href="${pageContext.request.contextPath}/loginTeacher" class="menu-link">
				<i class="menu-icon tf-icons bx bx-plus"></i>
				<span data-i18n="Analytics">강사 로그인</span>
			</a>
		</li>
	</ul>
</aside>