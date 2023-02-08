<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<div>
			<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
		</div>
		<a href="${pageContext.request.contextPath}/teacher/test/addTest">시험 등록</a>
		<h2>Test List</h2>
		<table border="1">
			<tr>
				<th>시험 제목</th>
				<th>시험 일자</th>
			</tr>
			<c:forEach var="t" items="${list}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/teacher/test/addQuestion?testNo=${t.testNo}">${t.testTitle}</a></td>
					<td>${t.createdate}</td>
				</tr>
			</c:forEach>
		</table>
		<form method="get" action="${pageContext.request.contextPath}/teacher/test/testList">
			<input type="text" name="searchWord" value="${searchWord}">
			<button type="submit">시험 검색</button>
		</form>
		<div>
			<!-- 현재 페이지에 따른 처음 버튼 활성화 -->
			<c:if test="${currentPage == 1}">
				<span>처음</span>
			</c:if>
			<c:if test="${currentPage != 1}">
				<a href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=1&searchWord=${searchWord}">처음</a>
			</c:if>
			
			<!-- 현재 페이지에 따른 이전 버튼 활성화 -->
			<c:if test="${prev == false}">
				<span>이전</span>	
			</c:if>
			<c:if test="${prev == true}">
				<a href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${startPage - 1}&searchWord=${searchWord}">이전</a>
			</c:if>
			
			<c:forEach var="t" begin="${startPage}" end="${endPage}" step="1">
				<a href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${t}&searchWord=${searchWord}">${t}</a>	
			</c:forEach>
			
			<!-- 현재 페이지에 따른 다음 버튼 활성화 -->
			<c:if test="${next == false}">
				<span>다음</span>	
			</c:if>
			<c:if test="${next == true}">
				<a href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${endPage + 1}&searchWord=${searchWord}">다음</a>			
			</c:if>
			
			<!-- 현재 페이지에 따른 마지막 버튼 활성화 -->
			<c:if test="${currentPage == lastPage}">
				<span>마지막</span>
			</c:if>
			<c:if test="${currentPage != lastPage}">
				<a href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>			
			</c:if>
		</div>
	</body>
</html>