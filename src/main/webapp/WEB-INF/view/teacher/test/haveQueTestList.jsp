<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
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
			<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
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
											<div align="right">
												<button type="button" class="btn rounded-pill me-2 btn-primary" data-bs-toggle="modal" data-bs-target="#backDropModal"><i class="menu-icon tf-icons bx bx-plus"></i>ADD</button>
												<div class="modal fade" id="backDropModal" data-bs-backdrop="static" tabindex="-1">
													<div class="modal-dialog">
														<form class="modal-content" method="post" action="${pageContext.request.contextPath}/teacher/test/addTest">
															<div class="modal-header">
																<h5 class="modal-title" id="backDropModalTitle">Test</h5>
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<div class="col mb-3">
																		<label for="nameBackdrop" class="form-label">Test Title</label>
																		<input type="text" id="nameBackdrop" name="testTitle" class="form-control">
																	</div>
																</div>
																<div class="row g-2">
																	<div class="col mb-0">
																		<label for="emailBackdrop" class="form-label">Question</label>
																		<select name="questionCount" class="form-select">
																			<option value="5">5문제</option>
																			<option value="10">10문제</option>
																			<option value="15">15문제</option>
																			<option value="20">20문제</option>
																			<option value="25">25문제</option>
																		</select>
																	</div>
																	<div class="col mb-0">
																		<label for="dobBackdrop" class="form-label">DOB</label>
																		<input type="date" id="dobBackdrop" name="createdate" class="form-control">
																	</div>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>
																<button type="submit" class="btn btn-primary">Save</button>
															</div>
														</form>
													</div>
												</div>
											</div>
											<div class="table-responsive text-nowrap">
												<table class="table text-center">
													<thead>
														<tr>
															<th style="width: 900px;">TITLE</th>
															<th style="width: 400px;">CREATEDATE</th>
														</tr>
													</thead>
													<tbody class="table-border-bottom-0">
														<c:forEach var="h" items="${haveQueList}">
															<tr>
																<td style="width: 900px;"><a href="${pageContext.request.contextPath}/teacher/test/testOne?testNo=${h.testNo}">${h.testTitle}</a></td>
																<td style="width: 400px;">${h.createdate}</td>
															</tr>
														</c:forEach>
													</tbody>
													
												</table>
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
																	<a class="page-link" href="${pageContext.request.contextPath}/teacher/test/haveQueTestList?currentPage=1&searchWord=${searchWord}"><i class="tf-icon bx bx-chevrons-left"></i></a>
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
																	<a class="page-link" href="${pageContext.request.contextPath}/teacher/test/haveQueTestList?currentPage=${currentPage - 1}&searchWord=${searchWord}"><i class="tf-icon bx bx-chevron-left"></i></a>
																</li>
															</c:if>
															
															<c:forEach var="e" begin="${startPage}" end="${endPage}" step="1">
																<li class="page-item">
																	<a class="page-link" href="${pageContext.request.contextPath}/teacher/test/haveQueTestList?currentPage=${e}&searchWord=${searchWord}">${e}</a>	
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
																	<a class="page-link" href="${pageContext.request.contextPath}/teacher/test/haveQueTestList?currentPage=${currentPage + 1}&searchWord=${searchWord}">
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
																	<a class="page-link" href="${pageContext.request.contextPath}/teacher/test/haveQueTestList?currentPage=${lastPage}&searchWord=${searchWord}"><i class="tf-icon bx bx-chevrons-right"></i></a>
																</li>	
															</c:if>
														</ul>
													</nav>
												</div>
											</div>
											<form method="get" action="${pageContext.request.contextPath}/teacher/test/haveQueTestList">
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
		<div class="layout-overlay layout-menu-toggle"></div>
		<script src="../../assets/vendor/libs/jquery/jquery.js"></script>
		<script src="../../assets/vendor/libs/popper/popper.js"></script>
		<script src="../../assets/vendor/js/bootstrap.js"></script>
		<script src="../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
		<script src="../../assets/vendor/js/menu.js"></script>
		<script src="../../assets/vendor/libs/apex-charts/apexcharts.js"></script>
		<script src="../../assets/js/main.js"></script>
		<script src="../../assets/js/ui-modals.js"></script>
		<script src="../../assets/js/dashboards-analytics.js"></script>
		<script async defer src="https://buttons.github.io/buttons.js"></script>
	</body>
</html>