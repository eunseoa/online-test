<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
		<title>${testTitle.testTitle}</title>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="layout-wrapper layout-content-navbar">
			<div class="layout-container">
				<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
				<div class="layout-page">
					<div class="content-wrapper">
						<div class="container-xxl flex-grow-1 container-p-y">
							<h4 class="fw-bold py-3 mb-4">${paperTitle.testTitle}&nbsp;/&nbsp;<span class="text-muted fw-light">${paperTitle.createdate}</span></h4>
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-body">
											<div class="table-responsive text-nowrap">
												<table class="table table-borderless">
													<c:forEach var="p" items="${paperOne}">
														<c:if test="${p.exampleIdx == 1}">
															<tr>
																<th>
																	<c:if test="${p.answerOx eq '정답'}">
																		<h5><strong><i class='bx bx-check' style="color: blue"></i>${p.questionIdx}.&nbsp;${p.questionTitle}</strong>&nbsp;&nbsp;&nbsp;[${p.questionScore}점]</h5>
																	</c:if>
																	<c:if test="${p.answerOx eq '오답'}">
																		<h5><strong><i class='bx bx-x' style="color: red"></i>${p.questionIdx}.&nbsp;${p.questionTitle}</strong>&nbsp;&nbsp;&nbsp;[${p.questionScore}점]</h5>
																	</c:if>
																</th>
															</tr>
														</c:if>
														<c:if test="${p.exampleIdx == 1}">
															<tr>
																<td>
																	<c:if test="${p.exampleAnswer eq '정답'}">
																		<span style="color: black; background-color: pink;">①&nbsp;&nbsp;<u>${p.exampleTitle}</u></span>
																	</c:if>
																	<c:if test="${p.exampleAnswer eq '오답'}">
																		①&nbsp;&nbsp;${p.exampleTitle}
																	</c:if>
																</td>
															</tr>
														</c:if>
														<c:if test="${p.exampleIdx == 2}">
															<tr>
																<td>
																	<c:if test="${p.exampleAnswer eq '정답'}">
																		<span style="color: black; background-color: pink;">②&nbsp;&nbsp;<u>${p.exampleTitle}</u></span>
																	</c:if>
																	<c:if test="${p.exampleAnswer eq '오답'}">
																		②&nbsp;&nbsp;${p.exampleTitle}
																	</c:if>
																</td>
															</tr>
														</c:if>
														<c:if test="${p.exampleIdx == 3}">
															<tr>
																<td>
																	<c:if test="${p.exampleAnswer eq '정답'}">
																		<span style="color: black; background-color: pink;">③&nbsp;&nbsp;<u>${p.exampleTitle}</u></span>
																	</c:if>
																	<c:if test="${p.exampleAnswer eq '오답'}">
																		③&nbsp;&nbsp;${p.exampleTitle}
																	</c:if>
																</td>
															</tr>
														</c:if>
														<c:if test="${p.exampleIdx == 4}">
															<tr>
																<td>
																	<c:if test="${p.exampleAnswer eq '정답'}">
																		<span style="color: black; background-color: pink;">④&nbsp;&nbsp;<u>${p.exampleTitle}</u></span>
																	</c:if>
																	<c:if test="${p.exampleAnswer eq '오답'}">
																		④&nbsp;&nbsp;${p.exampleTitle}
																	</c:if>
																</td>
															</tr>
														</c:if>
														<c:if test="${p.exampleIdx == 4}">
															<tr>
																<td>
																	<span>제출한 답 : </span>
																	<c:if test="${p.answerOx eq '정답'}">
																		<span style="color: blue;"><u>${p.paperAnswer}번</u></span>
																	</c:if>
																	<c:if test="${p.answerOx eq '오답'}">
																		<span style="color: red"><u>${p.paperAnswer}번</u></span>
																	</c:if>
																</td>
															</tr>
														</c:if>
													</c:forEach>
												</table>
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