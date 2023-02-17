<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
		<title>시험 리스트</title>
		<meta name="description" content="" />
		<link rel="icon" type="image/x-icon" href="../../assets/img/favicon/favicon.ico" />
		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />
		<link rel="stylesheet" href="../../assets/vendor/fonts/boxicons.css" />
		<link rel="stylesheet" href="../../assets/vendor/css/core.css" class="template-customizer-core-css" />
		<link rel="stylesheet" href="../../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
		<link rel="stylesheet" href="../../assets/css/demo.css" />
		<link rel="stylesheet" href="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
		<link rel="stylesheet" href="../../assets/vendor/libs/apex-charts/apex-charts.css" />
		<script src="../../assets/vendor/js/helpers.js"></script>
		<script src="../../assets/js/config.js"></script>
	</head>
	<body>
		<div class="layout-wrapper layout-content-navbar">
			<div class="layout-container">
			<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
				<div class="layout-page">
					<div class="content-wrapper">
						<div class="container-xxl flex-grow-1 container-p-y">
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header">
											<h5 class="card-header">Test List</h5>
										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-md mb-4 mb-md-0">
													<div class="accordion mt-3" id="accordionExample">
														<c:forEach var="t" items="${testList}">
															<div class="card accordion-item">
																<h2 class="accordion-header" id="headingTwo">
																	<button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#accordionTwo" aria-expanded="false" aria-controls="accordionTwo">
																		${t.testTitle}
																	</button>
																</h2>
																<div id="accordionTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
																	<div class="accordion-body">
																		<!-- 점수, 등수 등등 추가 -->
																		${t.totalScore}점
																		${t.createdate}
																		<a href="${pageContext.request.contextPath}/student/test/paperOne?testNo=${t.testNo}&studentNo=${loginStudent.studentNo}">상세보기</a>
																	</div>
																</div>
															</div>
														</c:forEach>
													</div>
												</div>
											</div>
											<br>
											<div>
												<nav aria-label="Page navigation">
													<ul class="pagination justify-content-center">
														<!-- 현재 페이지에 따른 처음 버튼 활성화 -->
														<c:if test="${currentPage == 1}">
															<li class="page-item prev">
																<a class="page-link"><i class="tf-icon bx bx-chevrons-left"></i></a>
															</li>
														</c:if>
														<c:if test="${currentPage != 1}">
															<li class="page-item prev">
																<a class="page-link" href="${pageContext.request.contextPath}/student/test/testScoreList?currentPage=1&searchWord=${searchWord}&studentNo=${studentNo}"><i class="tf-icon bx bx-chevrons-left"></i></a>
															</li>
														</c:if>
														
														<!-- 현재 페이지에 따른 이전 버튼 활성화 -->
														<c:if test="${prev == false}">
															<li class="page-item prev">
																<a class="page-link" ><i class="tf-icon bx bx-chevron-left"></i></a>
															</li>
														</c:if>
														<c:if test="${prev == true}">
															<li class="page-item prev">
																<a class="page-link" href="${pageContext.request.contextPath}/student/test/testScoreList?currentPage=${currentPage - 1}&searchWord=${searchWord}&studentNo=${studentNo}"><i class="tf-icon bx bx-chevron-left"></i></a>
															</li>
														</c:if>
														
														<c:forEach var="e" begin="${startPage}" end="${endPage}" step="1">
															<li class="page-item">
																<a class="page-link" href="${pageContext.request.contextPath}/student/test/testScoreList?currentPage=${e}&searchWord=${searchWord}&studentNo=${studentNo}">${e}</a>	
															</li>
														</c:forEach>
														
														<!-- 현재 페이지에 따른 다음 버튼 활성화 -->
														<c:if test="${next == false}">
															<li class="page-item next">
																<a class="page-link"><i class="tf-icon bx bx-chevron-right"></i></a>
															</li>
														</c:if>
														<c:if test="${next == true}">
															<li class="page-item next">
																<a class="page-link" href="${pageContext.request.contextPath}/student/test/testScoreList?currentPage=${currentPage + 1}&searchWord=${searchWord}&studentNo=${studentNo}">
																	<i class="tf-icon bx bx-chevron-right"></i>
																</a>
															</li>		
														</c:if>
														
														<!-- 현재 페이지에 따른 마지막 버튼 활성화 -->
														<c:if test="${currentPage == lastPage}">
															<li class="page-item next">
																<a class="page-link"><i class="tf-icon bx bx-chevrons-right"></i></a>
															</li>
														</c:if>
														<c:if test="${currentPage != lastPage}">
															<li class="page-item next">
																<a class="page-link" href="${pageContext.request.contextPath}/student/test/testScoreList?currentPage=${lastPage}&searchWord=${searchWord}&studentNo=${studentNo}"><i class="tf-icon bx bx-chevrons-right"></i></a>
															</li>	
														</c:if>
													</ul>
												</nav>
											</div>
											<form method="get" action="${pageContext.request.contextPath}/student/test/testScoreList">
												<div class="input-group mb-3 justify-content-center" style="width: 500px; margin: auto;">
													<input type="text" name="searchWord" value="${searchWord}" class="form-control" placeholder="Search.." aria-describedby="button-addon2">
													<button class="btn btn-outline-primary" type="submit" id="button-addon2"><i class="bx bx-search fs-4 lh-0"></i></button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="content-backdrop fade"></div>
					</div>
				</div>
			</div>
		</div>
		<script src="../../assets/vendor/libs/jquery/jquery.js"></script>
	    <script src="../../assets/vendor/libs/popper/popper.js"></script>
	    <script src="../../assets/vendor/js/bootstrap.js"></script>
	    <script src="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	    <script src="../../assets/vendor/js/menu.js"></script>
	    <script src="../../assets/js/main.js"></script>
	    <script async defer src="https://buttons.github.io/buttons.js"></script>
	</body>
</html>