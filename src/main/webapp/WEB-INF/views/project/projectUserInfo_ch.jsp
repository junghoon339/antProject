<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Insert title here</title>
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<!-- Bootstrap core CSS     -->
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Animation library for notifications   -->
<link
	href="${pageContext.request.contextPath }/resources/css/animate.min.css"
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
<!--  Paper Dashboard core CSS    -->
<link
	href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css"
	rel="stylesheet" />
<!-- 필요한 css는 이 밑에 넣어주면 됨 -->
<!-- 스크립트는 body 맨 아래쪽에 -->
</head>
<body>
	<div class="wrapper">
		<jsp:include page="sidebar_ch.jsp" />
		<div class="main-panel">
			<jsp:include page="header_ch.jsp" flush="false" />
			<div class="content">
				<div class="container-fluid">
					<!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
					<!-- 
						작성할때 template.html 에서
						<div class="row">부터 참고하면서 작성하면 됨
					-->
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">팀원정보</h4>
									<p class="category">Here is a subtitle for this table</p>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<th>이름</th>
											<th>학교</th>
											<th>학과</th>
											<th>역할</th>
											<c:if test="${projectUserRole=='조장'}">
												<th>Edit & Delete</th>
											</c:if>

										</thead>
										<tbody>
											<c:choose>
												<c:when test="${projectUserList!=null}">
													<c:forEach items="${projectUserList}" var="projectUserDTO">
														<tr>
															<td>${projectUserDTO.userName}</td>
															<td>${projectUserDTO.userSchool}</td>
															<td>${projectUserDTO.userMajor}</td>
															<td>${projectUserDTO.projectuserRole.projectUserTask}</td>
															<c:if test="${projectUserRole=='조장'}">
																<td><span data-placement="top"
																	data-toggle="tooltip" title="Edit">
																		<button class="btn btn-primary btn-xs"
																			data-title="Edit" id="editBtn" data-toggle="modal"
																			data-target="#edit"
																			name="${projectUserDTO.userNo}/${projectUserDTO.userName}/${projectUserDTO.projectuserRole.projectUserTask}">
																			<span class="glyphicon glyphicon-pencil"></span>
																		</button>
																</span> <span data-placement="top" data-toggle="tooltip"
																	title="Delete">
																		<button class="btn btn-danger btn-xs"
																			data-title="Delete" id="delBtn" data-toggle="modal"
																			data-target="#delete" name="${projectUserDTO.userNo}">
																			<span class="glyphicon glyphicon-trash"></span>
																		</button>
																</span></td>
															</c:if>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<!-- 팀원이 없을경우-->
													팀원이 없을수가 없습니다.ㅎㅎㅎ
												</c:otherwise>
											</c:choose>

										</tbody>
									</table>
									<c:if test="${projectUserRole=='조장'}">
										<button class="btn btn-primary btn-xs" data-title="Edit" id="editBtn" data-toggle="modal" data-target="#add"
											name="${projectUserDTO.userNo}/${projectUserDTO.userName}/${projectUserDTO.projectuserRole.projectUserTask}">
											<span class="glyphicon glyphicon-plus" data-toggle="modal">팀원추가</span>
										</button>
									
									</c:if>

									<div class="clearfix"></div>

								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
			<jsp:include page="footer_ch.jsp" flush="false" />
		</div>
	</div>


	<!-- modal -->
	<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">역할</h4>
				</div>
				<form name="f" action="${pageContext.request.contextPath}/project/updateProjectUserTask" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<div class="modal-body">
						<div class="form-group" id="userName"></div>
						<div class="form-group">
							<input class="form-control" type="text" name="projectUserTask"
								id="projectUserTask" value="">
						</div>
						<input type="hidden" name="userNo" id="userNo" value="">
					</div>
					<div class="modal-footer ">
						<button type="submit" class="btn btn-warning btn-lg"
							id="updateBtn" style="width: 100%;">
							<span class="glyphicon glyphicon-ok-sign"></span>수정
						</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
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
					<h4 class="modal-title custom_align" id="Heading">조원 삭제하기</h4>
				</div>

				<form name="form"
					action="${pageContext.request.contextPath}/project/deleteProjectUser"
					method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<div class="modal-body">
						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> 조원을
							삭제하시겠습니까?
						</div>
						<input type="hidden" name="userNo" id="delUserNo">
					</div>

					<div class="modal-footer ">
						<button type="submit" class="btn btn-success" id="delYesBtn">
							<span class="glyphicon glyphicon-ok-sign"></span>네
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>아뇨
						</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>


	<div class="modal fade" id="add" tabindex="-1" role="dialog"
		aria-labelledby="add" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">팀원추가</h4>
				</div>
				<form
					action="${pageContext.request.contextPath}/project/addProjectUser"
					method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<div class="modal-body">
						<div class="form-group">
							팀원ID : <input class="form-control" type="text" name="userId" />
							<p></p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-warning btn-lg"
							style="width: 100%;">
							<span class="glyphicon glyphicon-ok-sign"></span> 초대하기
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- modal end -->


	<!-- script -->


	<!--   Core JS Files   -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
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
	<!-- 필요한 자바스크립트 파일은 여기에 넣어주면 됨 -->
		<script type="text/javascript">
		$(document).ready(function() {
			$("[data-toggle=tooltip]").tooltip();

			$(document).on("click", "#editBtn", function() {
				var userNoNameTask = $(this).attr("name");

				var arr = userNoNameTask.split('/');
				var userNo = parseInt(arr[0]); //java로 넘어가기위해 int로 형변환
				var userName = arr[1];
				var projectUserTask = arr[2];

				$("#userName").html(userName);
				$("#projectUserTask").attr("value", projectUserTask);
				$("#userNo").attr("value", userNo);
			})

			$(document).on("click", "#delBtn", function() {
				var delUserNo = parseInt($(this).attr("name"));
				$("#delUserNo").attr("value", delUserNo);
			})
		});
	</script>

</body>
</html>