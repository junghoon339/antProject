<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>개미와 베짱이, 대학조별과제 관리시스템</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap core CSS     -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Animation library for notifications   -->
<link
	href="${pageContext.request.contextPath }/resources/css/animate.min.css"
	rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link
	href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css"
	rel="stylesheet" />

<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.request.contextPath }/resources/css/themify-icons.css"
	rel="stylesheet">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#done")
								.click(
										function() {
											location.href = "${pageContext.request.contextPath}/admin/adminProject?projectState=1";
										});

						$("#doing")
								.click(
										function() {
											location.href = "${pageContext.request.contextPath}/admin/adminProject?projectState=0";
										});

						$("[data-toggle=tooltip]").tooltip();

						var userNo = "";
						$(document).on("click", "#deleteBtn", function() {
							userNo = $(this).attr("name")

						});

						$(document)
								.on(
										"click",
										"#deleteYesBtn",
										function() {
											alert(userNo);
											var flag = $("#flag").val();
											var endPage = $("#endPage").val();
											var curPage = $("#curPage").val();
											var totalRow = $("#totalRow").val();
											var rowCount = $("#rowCount").val();
											var projectState = $(
													"#projectState").val();

											if (flag == "true"
													&& curPage == endPage) {
												if (totalRow % rowCount == 1) {
													curPage = curPage - 1;
												}
											}

											location.href = "${pageContext.request.contextPath}/admin/project/delete?projectNo="
													+ parseInt(userNo)
													+ "&pageNumber="
													+ curPage
													+ "&projectState="
													+ parseInt(projectState);

										});

						$("#searchBtn")
								.click(
										function() {
											var projectState = $(
													"#projectState").val();
											if ($("#category").val() != -1) {
												location.href = "${pageContext.request.contextPath}/admin/adminProject?categoryNo="
														+ $("#category").val()
														+ "&searchText="
														+ $("#searchText")
																.val()
														+ "&projectState="
														+ parseInt(projectState);
											}

										});

						$("#screenBtn")
								.click(
										function() {
											window
													.open(
															"${pageContext.request.contextPath}/todo/list",
															"",
															"width=1350,height=700");

											location.href = "${pageContext.request.contextPath }/screenshot/test";
											window.close();
										});

					});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/sidebar_ch.jsp" />

		<div class="main-panel">
			<jsp:include page="/WEB-INF/views/project/header_ch.jsp"
				flush="false" />
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="content table-responsive table-full-width">
									<div
										style="text-align: right; margin-right: 20px; margin-bottom: 35px;">
										<button type="button" class="btn btn-Info" id="done">완료된프로젝트</button>
										<button type="button" class="btn btn-Info" id="doing">진행중프로젝트</button>
									</div>
									<table id="mytable" class="table table-hover">

										<thead>

											<th>프로젝트명</th>
											<th>시작날짜</th>
											<th>종료날짜</th>
											<th>과목명</th>
											<th>프로젝트 상태</th>
											<th>&nbsp;</th>


										</thead>
										<tbody>

											<c:choose>
												<c:when test="${projectList.size()!=0 }">
													<c:forEach items="${projectList}" var="projectDTO">
														<tr>
															<td>${projectDTO.projectName }</td>
															<td>${projectDTO.projectStartdate }</td>
															<td>${projectDTO.projectEnddate }</td>
															<td>${projectDTO.projectSubject }</td>
															<c:choose>
																<c:when test="${projectDTO.projectState==0 }">
																	<td>진행중</td>
																</c:when>
																<c:when test="${projectDTO.projectState==1 }">
																	<td>완료대기중</td>
																</c:when>
																<c:otherwise>
																	<td>완료</td>
																</c:otherwise>
															</c:choose>
															<td><p data-placement="top" data-toggle="tooltip"
																	title="Delete">
																	<button class="btn btn-Info" data-title="Delete"
																		id="deleteBtn" data-toggle="modal"
																		data-target="#delete" name="${projectDTO.projectNo}"
																		style="padding: 5px 9px;">
																		<span class="ti-close"></span>
																	</button>
																</p></td>
														</tr>
													</c:forEach>

												</c:when>
												<c:otherwise>
													<tr>
														<th colspan="6" style="text-align: center">데이터가 없습니다.<span
															class="ti-face-sad"></span>
														</th>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<c:choose>
										<c:when test="${projectList.size()!=0}">
											<div style="text-align: center">
												<ul class="pagination">

													<c:choose>
														<c:when test="${startPage==1 }">

															<li class="disabled"><a href="#"><div
																		class="icon-container">
																		<span class="ti-angle-double-left"></span>
																	</div>
																	</span></a></li>
														</c:when>
														<c:otherwise>
															<li><a
																href="${pageContext.request.contextPath }/admin/adminProject?pageNumber=${startPage-pageSu }&projectState=${projectState}&categoryNo=${categoryNo}&searchText=${searchText}"><div
																		class="icon-container">
																		<span class="ti-angle-double-left"></span>
																	</div></a></li>
														</c:otherwise>
													</c:choose>
													<c:forEach begin="${startPage }" end="${endPage }"
														var="pageNum" step="1">
														<li><a
															href="${pageContext.request.contextPath }/admin/adminProject?pageNumber=${pageNum}&projectState=${projectState}&categoryNo=${categoryNo}&searchText=${searchText}">${pageNum }</a></li>
													</c:forEach>

													<c:choose>
														<c:when test="${flag==true }">

															<li class="disabled"><a href="#"><div
																		class="icon-container">
																		<span class="ti-angle-double-right"></span>
																	</div></a></li>
														</c:when>
														<c:otherwise>
															<li><a
																href="${pageContext.request.contextPath }/admin/adminProject?pageNumber=${startPage+pageSu }&projectState=${projectState}&categoryNo=${categoryNo}&searchText=${searchText}"><div
																		class="icon-container">
																		<span class="ti-angle-double-right"></span>
																	</div></a></li>
														</c:otherwise>
													</c:choose>

												</ul>
											</div>
										</c:when>
									</c:choose>
									<input type="hidden" id="flag" value="${flag }" /> <input
										type="hidden" id="curPage" value="${curPage }" /> <input
										type="hidden" id="endPage" value="${endPage }" /> <input
										type="hidden" id="totalRow" value="${totalRow }" /> <input
										type="hidden" id="rowCount" value="${rowCount }" /> <input
										type="hidden" id="projectState" value=${projectState } />

									<div>
										<c:if test="${projectList.size()!=0}">
											<!-- 검색 -->
											<div class="container" style="width: 400px;">
												<div class="row">

													<div class="input-group">
														<div class="input-group-btn search-panel">

															<select class="btn btn-Info dropdown-toggle"
																data-toggle="dropdown" style="width: 90px" id="category">
																<option value="-1">선택</option>
																<option value="0">프로젝트명</option>
																<option value="1">과목명</option>
															</select>
														</div>

														<input type="hidden" name="search_param" value="all"
															id="search_param"> <input type="text"
															class="form-control" name="x" placeholder="검색어를 입력하세요."
															id="searchText" style="border: 1px solid #7cb679">
														<span class="input-group-btn">

															<button class="btn btn-Info" type="button" id="searchBtn">

																<div class="icon-container">
																	<span class="ti-search"></span>
																</div>

															</button>
														</span>

													</div>

												</div>
											</div>
										</c:if>
									</div>
								</div><!-- content table-responsive table-full-width -->

							</div>
						</div>
					</div>
				</div>
			</div> <!-- content -->
			
			<div class="modal fade" id="delete" tabindex="-1" role="dialog"
				aria-labelledby="edit" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							</button>
							<h4 class="modal-title custom_align" id="Heading">Delete
								this entry</h4>
						</div>
						<div class="modal-body">

							<div class="alert alert-danger">
								<span class="glyphicon glyphicon-warning-sign"></span> Are you
								sure you want to delete this Record?
							</div>

						</div>
						<div class="modal-footer ">
							<button type="button" class="btn btn-success"
								data-dismiss="modal" id="deleteYesBtn">
								<span class="glyphicon glyphicon-ok-sign"></span> Yes
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> No
							</button>
						</div>

					</div>
				</div>
			</div>

			<jsp:include page="/WEB-INF/views/project/footer_ch.jsp"
				flush="false" />
		</div>
	</div>

	<%-- <c:import url="/project/chat" /> --%>
</body>

<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"
	type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script
	src="${pageContext.request.contextPath }/resources/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap-notify.js"></script>


<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script
	src="${pageContext.request.contextPath }/resources/js/paper-dashboard.js"></script>

</html>