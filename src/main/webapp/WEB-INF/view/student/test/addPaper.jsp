<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<c:forEach var="t" items="${testList}">
			<c:if test="${t.exampleIdx == 1}">
				<script>
					$(document).ready(function() {
						$('#paperBtn').click(function() {
							if($("input[name='answer${t.questionIdx}']:checked")) {
								var answer = $("input[name='answer${t.questionIdx}']:checked").val();
								console.log(answer);
								$("#answer${t.questionIdx}").val(answer);
							}
							$('#paperForm').submit();
						});
					});
				</script>
			</c:if>
		</c:forEach>
	</head>
	<body>
		<div class="layout-wrapper layout-content-navbar">
			<div class="layout-container">
				<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
				<div class="layout-page">
					<div class="content-wrapper">
						<div class="container-xxl flex-grow-1 container-p-y">
							<h4 class="fw-bold py-3 mb-4">${testTitle.testTitle}&nbsp;/&nbsp;<span class="text-muted fw-light">${testTitle.createdate}</span></h4>
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-body">
											<div class="table-responsive text-nowrap">
												<form method="post" action="${pageContext.request.contextPath}/student/test/addPaper" id="paperForm">
													<input type="hidden" name="questionCount" value="${testTitle.questionCount}">
													<input type="hidden" name="studentNo" value="${loginStudent.studentNo}">
													<input type="hidden" name="testNo" value="${testTitle.testNo}">
													<table class="table table-borderless">
														<c:forEach var="t" items="${testList}">
															<c:if test="${t.exampleIdx == 1}">
																<tr>
																	<th>
																		<input type="hidden" name="questionNo" value="${t.questionNo}">
																		<input type="hidden" name="questionScore" value="${t.questionScore}">
																		<input type="hidden" id="answer${t.questionIdx}" name="answer" value="0">
																		<h5><strong>${t.questionIdx}.&nbsp;${t.questionTitle}</strong>&nbsp;&nbsp;&nbsp;[<fmt:formatNumber type="number" maxFractionDigits="0"  value="${t.questionScore}" />점]</h5>
																	</th>
																</tr>
															</c:if>
															<c:if test="${t.exampleIdx == 1}">
																<tr>
																	<td>
																		<input class="form-check-input" type="radio" name="answer${t.questionIdx}" value="1">&nbsp;&nbsp;
																		<input type="hidden" name="exampleIdx" value="1">
																		①&nbsp;&nbsp;${t.exampleTitle}
																	</td>
																</tr>
															</c:if>
															<c:if test="${t.exampleIdx == 2}">
																<tr>
																	<td>
																		<input class="form-check-input" type="radio" name="answer${t.questionIdx}" value="1">&nbsp;&nbsp;
																		<input type="hidden" name="exampleIdx" value="2">
																		②&nbsp;&nbsp;${t.exampleTitle}
																	</td>
																</tr>
															</c:if>
															<c:if test="${t.exampleIdx == 3}">
																<tr>
																	<td>
																		<input class="form-check-input" type="radio" name="answer${t.questionIdx}" value="1">&nbsp;&nbsp;
																		<input type="hidden" name="exampleIdx" value="3">
																		③&nbsp;&nbsp;${t.exampleTitle}
																	</td>
																</tr>
															</c:if>
															<c:if test="${t.exampleIdx == 4}">
																<tr>
																	<td>
																		<input class="form-check-input" type="radio" name="answer${t.questionIdx}" value="1">&nbsp;&nbsp;
																		<input type="hidden" name="exampleIdx" value="4">
																		④&nbsp;&nbsp;${t.exampleTitle}
																	</td>
																</tr>
															</c:if>
														</c:forEach>
													</table>
													<div align="right">
														<button class="btn rounded-pill me-2 btn-primary btn-lg" type="button">제출하기</button>
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