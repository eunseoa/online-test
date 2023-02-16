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
		<script>
			$(document).ready(function() {
				$('#titleBtn').click(function() {
					let html = 
						`
						<div class="row" style="width: 600px;">
							<div class="col mb-0">
								<input type="hidden" name="testNo" value="${testTitle.testNo}">
								<input type="text" name="testTitle" class="form-control" style="width: 200px;" value="${testTitle.testTitle}">
							</div>
							<div class="col mb-0">
								<input type="date" name="createdate" class="form-control" style="width: 200px;" value="${testTitle.createdate}">
							</div>
							<div class="col mb-0">
								<button type="submit" class="btn rounded-pill me-2 btn-primary">제목 수정</button>
							</div>
						</div>
						`
					$(this.form).children('h4').html(html);
				});
			});
		</script>
	</head>
	<body>
		<div class="layout-wrapper layout-content-navbar">
			<div class="layout-container">
				<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
				<div class="layout-page">
					<div class="content-wrapper">
						<div class="container-xxl flex-grow-1 container-p-y">
							<form method="post" action="${pageContext.request.contextPath}/teacher/test/modifyTestTitle">
								<h4 class="fw-bold py-3 mb-4">${testTitle.testTitle}&nbsp;/&nbsp;<span class="text-muted fw-light">${testTitle.createdate}</span>
									<button type="button" class="btn btn-icon me-2 btn-label-primary" id="titleBtn">
										<span class="tf-icons bx bx bx-edit-alt"></span>
									</button>
								</h4>
							</form>
							<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-body">
											<div class="table-responsive text-nowrap">
												<table class="table table-borderless">
													<c:forEach var="t" items="${testOne}">
														<c:if test="${t.exampleIdx == 1}">
															<tr>
																<th><h5><strong>${t.questionIdx}.&nbsp;${t.questionTitle}</strong></h5></th>
																<th><a href="${pageContext.request.contextPath}/teacher/test/modifyQuestion?questionNo=${t.questionNo}">문제 수정</a></th>
															</tr>
														</c:if>
														<c:if test="${t.exampleIdx == 1}">
															<tr>
																<td colspan="2">
																	<c:if test="${t.answer eq '정답'}">
																		<span style="color: #FF3E1D">①&nbsp;&nbsp;<u>${t.exampleTitle}</u></span>
																	</c:if>
																	<c:if test="${t.answer eq '오답'}">
																		①&nbsp;&nbsp;${t.exampleTitle}
																	</c:if>
																</td>
															</tr>
														</c:if>
														<c:if test="${t.exampleIdx == 2}">
															<tr>
																<td colspan="2">
																	<c:if test="${t.answer eq '정답'}">
																		<span style="color: #FF3E1D">②&nbsp;&nbsp;<u>${t.exampleTitle}</u></span>
																	</c:if>
																	<c:if test="${t.answer eq '오답'}">
																		②&nbsp;&nbsp;${t.exampleTitle}
																	</c:if>
																</td>
															</tr>
														</c:if>
														<c:if test="${t.exampleIdx == 3}">
															<tr>
																<td colspan="2">
																	<c:if test="${t.answer eq '정답'}">
																		<span style="color: #FF3E1D">③&nbsp;&nbsp;<u>${t.exampleTitle}</u></span>
																	</c:if>
																	<c:if test="${t.answer eq '오답'}">
																		③&nbsp;&nbsp;${t.exampleTitle}
																	</c:if>
																</td>
															</tr>
														</c:if>
														<c:if test="${t.exampleIdx == 4}">
															<tr>
																<td colspan="2">
																	<c:if test="${t.answer eq '정답'}">
																		<span style="color: #FF3E1D">④&nbsp;&nbsp;<u>${t.exampleTitle}</u></span>
																	</c:if>
																	<c:if test="${t.answer eq '오답'}">
																		④&nbsp;&nbsp;${t.exampleTitle}
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