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

<title>Paper Dashboard by Creative Tim</title>

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

<%--     <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath }/resources/css/demo.css" rel="stylesheet" />
 --%>
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
		<jsp:include page="/WEB-INF/views/project/team_sidebar_ch.jsp" />


		<div class="main-panel">
			<jsp:include page="/WEB-INF/views/project/header_ch.jsp" flush="false" />



			<div class="content">
				<div class="container-fluid">
					<div class="row">
						
						<div class="table-responsive">
							<button type="button" class="btn btn-danger btn-filter" id="done">완료된프로젝트</button>
							<button type="button" class="btn btn-danger btn-filter"
								id="doing">진행중프로젝트</button>

							<table id="mytable" class="table table-bordred table-striped">

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
														<c:otherwise>
															<td>완료</td>
														</c:otherwise>
													</c:choose>
													<td><p data-placement="top" data-toggle="tooltip"
															title="Delete">
															<button class="btn btn-danger btn-xs" data-title="Delete"
																id="deleteBtn" data-toggle="modal" data-target="#delete"
																name="${projectDTO.projectNo}">
																<span class="glyphicon glyphicon-trash"></span>
															</button>
														</p></td>
												</tr>
											</c:forEach>

										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>
								</tbody>
							</table>














							<div style="text-align: center">
								<ul class="pagination">
									<c:choose>
										<c:when test="${startPage==1 }">
											<li class="disabled"><a href="#"><span
													class="glyphicon glyphicon-chevron-left"></span></a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="${pageContext.request.contextPath }/admin/adminProject?pageNumber=${startPage-pageSu }&projectState=${projectState}&categoryNo=${categoryNo}&searchText=${searchText}"><span
													class="glyphicon glyphicon-chevron-left"></span></a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="${startPage }" end="${endPage }"
										var="pageNum" step="1">
										<li class="active"><a
											href="${pageContext.request.contextPath }/admin/adminProject?pageNumber=${pageNum}&projectState=${projectState}&categoryNo=${categoryNo}&searchText=${searchText}">${pageNum }</a></li>
									</c:forEach>

									<c:choose>
										<c:when test="${flag==true }">
											<li class="disabled"><a href="#"><span
													class="glyphicon glyphicon-chevron-right"></span></a></li>
										</c:when>
										<c:otherwise>
											<li><a
												href="${pageContext.request.contextPath }/admin/adminProject?pageNumber=${startPage+pageSu }&projectState=${projectState}&categoryNo=${categoryNo}&searchText=${searchText}"><span
													class="glyphicon glyphicon-chevron-right"></span></a></li>
										</c:otherwise>
									</c:choose>

								</ul>
							</div>
							<input type="hidden" id="flag" value="${flag }" /> <input
								type="hidden" id="curPage" value="${curPage }" /> <input
								type="hidden" id="endPage" value="${endPage }" /> <input
								type="hidden" id="totalRow" value="${totalRow }" /> <input
								type="hidden" id="rowCount" value="${rowCount }" /> <input
								type="hidden" id="projectState" value=${projectState } />

							<div>
								<select class="form-control" id="category">
									<option value="-1">선택</option>
									<option value="0">프로젝트명</option>
									<option value="1">과목명</option>
								</select>
								<div class="col-sm-6 col-sm-offset-3">
									<div id="imaginary_container">
										<div class="input-group stylish-input-group input-append">
											<input type="text" class="form-control" id="searchText"
												placeholder="Search"> <span
												class="input-group-addon">
												<button id="searchBtn">
													<span class="glyphicon glyphicon-search"></span>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Delete this
							entry</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Are you
							sure you want to delete this Record?
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success" data-dismiss="modal" id="deleteYesBtn">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>

				</div>
			</div>
		</div>

			<jsp:include page="/WEB-INF/views/project/footer_ch.jsp" flush="false" />
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

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/demo.js"></script> --%>
</html>