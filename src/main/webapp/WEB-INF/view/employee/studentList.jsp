<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Student List</title>
	</head>
	<body>
		<div>
			<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
		</div>
		<h3>Teacher List</h3>
		<a href="${pageContext.request.contextPath}/employee/student/addStudent">학생등록</a>
		<table border="1">
			<tr>
				<th>studentId</th>
				<th>studentName</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="s" items="${list}">
				<tr>
					<td>${s.studentId}</td>
					<td>${s.studentName}</td>
					<td><a href="${pageContext.request.contextPath}/employee/student/studentList?studentNo=${s.studentNo}">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<form method="get" action="${pageContext.request.contextPath}/employee/student/studentList">
			<input type="text" name="searchWord" value="${searchWord}">
			<button type="submit">이름 검색</button>
		</form>
		<div>
			<!-- 현제 페이지에 따른 처음 버튼 활성화 -->
			<c:if test="${currentPage == 1}">
				<span>처음</span>
			</c:if>
			<c:if test="${currentPage != 1}">
				<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=1&searchWord=${searchWord}">처음</a>
			</c:if>
			
			<!-- 현제 페이지에 따른 이전 버튼 활성화 -->
			<c:if test="${prev == false}">
				<span>이전</span>	
			</c:if>
			<c:if test="${prev == true}">
				<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${currentPage - 1}&searchWord=${searchWord}">이전</a>
			</c:if>
			
			<c:forEach var="t" begin="${startPage}" end="${endPage}" step="1">
				<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${t}&searchWord=${searchWord}">${t}</a>	
			</c:forEach>
			
			<!-- 현제 페이지에 따른 다음 버튼 활성화 -->
			<c:if test="${next == false}">
				<span>다음</span>	
			</c:if>
			<c:if test="${next == true}">
				<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${currentPage + 1}&searchWord=${searchWord}">다음</a>			
			</c:if>
			
			<!-- 현제 페이지에 따른 마지막 버튼 활성화 -->
			<c:if test="${currentPage == lastPage}">
				<span>마지막</span>
			</c:if>
			<c:if test="${currentPage != lastPage}">
				<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>			
			</c:if>
		</div>
	</body>
</html>