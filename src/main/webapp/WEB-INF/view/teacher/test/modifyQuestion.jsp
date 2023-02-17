<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
		<title></title>
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
							<h4 class="fw-bold py-3 mb-4">문제수정</h4>
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-body">
											<div class="table-responsive text-nowrap">
												<form method="post" action="${pageContext.request.contextPath}/teacher/test/modifyQuestion">
													<table class="table table-borderless">
														<c:forEach var="q" items="${questionOne}">
															<c:if test="${q.exampleIdx == 1}">
																<tr>
																	<th>
																		<input type="hidden" name="testNo" value="${q.testNo}">
																		<input type="hidden" name="questionNo" value="${q.questionNo}">
																		<div class="input-group input-group-lg" style="width: 900px;">
																			<span class="input-group-text" id="basic-addon-search31">${q.testNo}</span>
																			<input type="text" class="form-control" name="questionTitle" value="${q.questionTitle}" aria-describedby="basic-addon-search31"/>
																		</div>
																	</th>
																</tr>
															</c:if>
															<c:if test="${q.exampleIdx == 1}">
																<tr>
																	<td>
																		<div>
																			<input type="hidden" name="questionNo" value="${q.questionNo}">
																			<input type="hidden" name="exampleNo" value="${q.exampleNo}">
																			<div class="input-group" style="width: 500px;">
																				<div class="input-group-text">
																					<input class="form-check-input mt-0" type="radio" name="answer" value="1" aria-label="Radio button for following text input" <c:out value="${q.answer == '정답' ? 'checked':'' }"/>>
																				</div>
																				<input type="text" class="form-control" name="exampleTitle" value="${q.exampleTitle}" aria-label="Text input with radio button">
																			</div>
																		</div>
																	</td>
																</tr>
															</c:if>
															<c:if test="${q.exampleIdx == 2}">
																<tr>
																	<td>
																		<div>
																			<input type="hidden" name="questionNo" value="${q.questionNo}">
																			<input type="hidden" name="exampleNo" value="${q.exampleNo}">
																			<div class="input-group" style="width: 500px;">
																				<div class="input-group-text">
																					<input class="form-check-input mt-0" type="radio" name="answer" value="2" aria-label="Radio button for following text input" <c:out value="${q.answer == '정답' ? 'checked':'' }"/>>
																				</div>
																				<input type="text" class="form-control" name="exampleTitle" value="${q.exampleTitle}" aria-label="Text input with radio button">
																			</div>
																		</div>
																	</td>
																</tr>
															</c:if>
															<c:if test="${q.exampleIdx == 3}">
																<tr>
																	<td>
																		<div>
																			<input type="hidden" name="questionNo" value="${q.questionNo}">
																			<input type="hidden" name="exampleNo" value="${q.exampleNo}">
																			<div class="input-group" style="width: 500px;">
																				<div class="input-group-text">
																					<input class="form-check-input mt-0" type="radio" name="answer" value="3" aria-label="Radio button for following text input" <c:out value="${q.answer == '정답' ? 'checked':'' }"/>>
																				</div>
																				<input type="text" class="form-control" name="exampleTitle" value="${q.exampleTitle}" aria-label="Text input with radio button">
																			</div>
																		</div>
																	</td>
																</tr>
															</c:if>
															<c:if test="${q.exampleIdx == 4}">
																<tr>
																	<td>
																		<div>
																			<input type="hidden" name="questionNo" value="${q.questionNo}">
																			<input type="hidden" name="exampleNo" value="${q.exampleNo}">
																			<div class="input-group" style="width: 500px;">
																				<div class="input-group-text">
																					<input class="form-check-input mt-0" type="radio" name="answer" value="4" aria-label="Radio button for following text input" <c:out value="${q.answer == '정답' ? 'checked':'' }"/>>
																				</div>
																				<input type="text" class="form-control" name="exampleTitle" value="${q.exampleTitle}" aria-label="Text input with radio button">
																			</div>
																		</div>
																	</td>
																</tr>
															</c:if>
														</c:forEach> 
													</table>
													<div align="right">
														<button class="btn rounded-pill me-2 btn-primary btn-lg" type="submit">문제 수정</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>