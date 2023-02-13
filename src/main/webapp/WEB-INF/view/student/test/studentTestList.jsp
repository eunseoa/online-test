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
			<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
		</div>
		<h2>시험 리스트</h2>
		<table border="1">
			<tr>
				<th>시험 제목</th>
				<th>시험 일자</th>
				<th></th>
			</tr>
			<c:forEach var="t" items="${testList}">
				<tr>
					<td>${t.testTitle}</td>
					<td>${t.createdate}</td>
					<td>
						<c:if test="${t.paperNo == 0}">
							<a href="${pageContext.request.contextPath}/student/test/addPaper?testNo=${t.testNo}">시험보기</a>
						</c:if>
						<c:if test="${t.paperNo != 0}">
							<a>결과 보기</a>
						</c:if>
					</td>
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