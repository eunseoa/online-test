<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Emp List</title>
	</head>
	<body>
		<div>
			<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
		</div>
		<h1>Employee List</h1>
		<a href="${pageContext.request.contextPath}/employee/addEmp">사원등록</a>
		<a href="${pageContext.request.contextPath}/employee/logout">로그아웃</a>
		<table border="1">
			<tr>
				<th>empId</th>
				<th>empName</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="e" items="${list}">
				<tr>
					<td>${e.empId}</td>
					<td>${e.empName}</td>
					<td>
						<a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<form method="get" action="${pageContext.request.contextPath}/employee/empList">
			<input type="text" name="searchWord" value="${searchWord}">
			<button type="submit">이름 검색</button>
		</form>
		<div>
			<c:if test="${currentPage == 1}">
				<a>처음</a>
			</c:if>
			<c:if test="${currnetPage != 1}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1&searchWord=${searchWord}">처음</a>
			</c:if>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage - 1}&searchWord=${searchWord}">이전</a>			
			</c:if>
			<c:if test="${lastPage > currentPage}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage + 1}&searchWord=${searchWord}">다음</a>			
			</c:if>
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage + 1}&searchWord=${searchWord}">다음</a>		
			<c:if test="${currentPage != lastPage}">
				<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>			
			</c:if>
		</div>
	</body>
</html>