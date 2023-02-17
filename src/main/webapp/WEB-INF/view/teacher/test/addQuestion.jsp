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
		<c:forEach var="q" begin="1" end="${testTitle.questionCount}" step="1">
			<script>
				$(document).ready(function() {
					$('#queBtn').click(function() {
						if($("input[name='answer${q}']:checked")) {
							var answer = $("input[name='answer${q}']:checked").val();
							console.log(answer);
							$("#answer${q}").val(answer);
						}
						$('#examplForm').submit();
					});
				});
			</script>
		</c:forEach>
	</head>
	<body>
		<div class="layout-wrapper layout-content-navbar">
			<div class="layout-container">
				<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
				<div class="layout-page">
					<div class="content-wrapper">
						<div class="container-xxl flex-grow-1 container-p-y">
							<h4 class="fw-bold py-3 mb-4">${testTitle.testTitle}&nbsp;/&nbsp;<span class="text-muted fw-light">${testTitle.createdate}</span></h4>
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-body">
											<div class="table-responsive text-nowrap">
												<form method="post" action="${pageContext.request.contextPath}/teacher/test/addQuestion" id="examplForm">
													<input type="hidden" name="testNo" value="${testNo}">
													<input type="hidden" name="questionCount" value="${testTitle.questionCount}">
													<c:set var="questionScore" value="${100 / testTitle.questionCount}"></c:set>
													<input type="hidden" name="questionScore" value="${Double.valueOf(questionScore).intValue()}">
													<table class="table table-borderless">
														<c:forEach var="q" begin="1" end="${testTitle.questionCount}" step="1">
															<tr>
																<th>
																	<input type="hidden" name="questionIdx" value="${q}" readonly>
																	<input type="hidden" id="answer${q}" name="answer">
																	<div class="input-group input-group-lg" style="width: 900px;">
																		<span class="input-group-text" id="basic-addon-search31">${q}</span>
																		<input type="text" class="form-control" name="questionTitle" aria-describedby="basic-addon-search31" placeholder="문제를 입력해주세요"/>&nbsp;&nbsp;&nbsp;[<fmt:formatNumber type="number" maxFractionDigits="0"  value="${questionScore}" />점]
																	</div>
																</th>
															</tr>
															<tr>
																<td>
																	<div>
																		<input type="hidden" name="exampleIdx" value="1">
																		<div class="input-group" style="width: 500px;">
																			<div class="input-group-text">
																				<input class="form-check-input mt-0" type="radio" name="answer${q}" value="1" aria-label="Radio button for following text input">
																			</div>
																			<input type="text" class="form-control" name="exampleTitle" aria-label="Text input with radio button" placeholder="1번보기를 입력해주세요">
																		</div>
																	</div>
																	<br>
																	<div>
																		<input type="hidden" name="exampleIdx" value="2">
																		<div class="input-group" style="width: 500px;">
																			<div class="input-group-text">
																				<input class="form-check-input mt-0" type="radio" name="answer${q}" value="2" aria-label="Radio button for following text input">
																			</div>
																			<input type="text" class="form-control" name="exampleTitle" aria-label="Text input with radio button" placeholder="2번보기를 입력해주세요">
																		</div>
																	</div>
																	<br>
																	<div>
																		<input type="hidden" name="exampleIdx" value="3">
																		<div class="input-group" style="width: 500px;">
																			<div class="input-group-text">
																				<input class="form-check-input mt-0" type="radio" name="answer${q}" value="3" aria-label="Radio button for following text input">
																			</div>
																			<input type="text" class="form-control" name="exampleTitle" aria-label="Text input with radio button" placeholder="3번보기를 입력해주세요">
																		</div>
																	</div>
																	<br>
																	<div>
																		<input type="hidden" name="exampleIdx" value="4">
																		<div class="input-group" style="width: 500px;">
																			<div class="input-group-text">
																				<input class="form-check-input mt-0" type="radio" name="answer${q}" value="4" aria-label="Radio button for following text input">
																			</div>
																			<input type="text" class="form-control" name="exampleTitle" aria-label="Text input with radio button" placeholder="4번보기를 입력해주세요">
																		</div>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</table>
													<div align="right">
														<button class="btn rounded-pill me-2 btn-primary btn-lg" type="button">문제 등록</button>
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