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
		<!-- 문제가 생성되지 않은 문제 리스트 -->
		<h2>문제 입력이 필요합니다</h2>
		<table border="1">
			<tr>
				<th>시험 제목</th>
				<th>시험 일자</th>
				<th></th>
			</tr>
			<c:forEach var="n" items="${notQueList}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/teacher/test/addQuestion?testNo=${n.testNo}">${n.testTitle}</a></td>
					<td>${n.createdate}</td>
					<td><a href="${pageContext.request.contextPath}/teacher/test/removeTest?testNo=${n.testNo}">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
		<form method="get" action="${pageContext.request.contextPath}/teacher/test/notQueTestList">
			<input type="text" name="searchWord" value="${searchWord}">
			<button type="submit">시험 검색</button>
		</form>
		<!-- 현재 페이지에 따른 처음 버튼 활성화 -->
		<c:if test="${currentPage == 1}">
			<span>처음</span>
		</c:if>
		<c:if test="${currentPage != 1}">
			<a href="${pageContext.request.contextPath}/teacher/test/notQueTestList?currentPage=1&searchWord=${searchWord}">처음</a>
		</c:if>
		
		<!-- 현재 페이지에 따른 이전 버튼 활성화 -->
		<c:if test="${prev == false}">
			<span>이전</span>	
		</c:if>
		<c:if test="${prev == true}">
			<a href="${pageContext.request.contextPath}/teacher/test/notQueTestList?currentPage=${startPage - 1}&searchWord=${searchWord}">이전</a>
		</c:if>
		
		<c:forEach var="t" begin="${startPage}" end="${endPage}" step="1">
			<a href="${pageContext.request.contextPath}/teacher/test/notQueTestList?currentPage=${t}&searchWord=${searchWord}">${t}</a>	
		</c:forEach>
		
		<!-- 현재 페이지에 따른 다음 버튼 활성화 -->
		<c:if test="${next == false}">
			<span>다음</span>	
		</c:if>
		<c:if test="${next == true}">
			<a href="${pageContext.request.contextPath}/teacher/test/notQueTestList?currentPage=${endPage + 1}&searchWord=${searchWord}">다음</a>			
		</c:if>
		
		<!-- 현재 페이지에 따른 마지막 버튼 활성화 -->
		<c:if test="${currentPage == lastPage}">
			<span>마지막</span>
		</c:if>
		<c:if test="${currentPage != lastPage}">
			<a href="${pageContext.request.contextPath}/teacher/test/notQueTestList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>			
		</c:if>
	</body>
</html>