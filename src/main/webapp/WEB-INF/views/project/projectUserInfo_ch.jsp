<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
<security:csrfMetaTags/>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="sidebar_ch.jsp" />
		<div class="main-panel">
			<jsp:include page="header_ch.jsp" flush="false" />
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">팀원정보</h4>
									<p class="category"></p>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<th>이름</th>
											<th>학교</th>
											<th>학과</th>
											<th>역할</th>
											<c:if test="${projectUserRole=='조장'} && ${projectState=='0'}">
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
															<c:if test="${projectUserRole=='조장'} && ${projectState=='0'}">
																<td><span data-placement="top"
																	data-toggle="tooltip" title="Edit">
																		<button class="btn btn-primary btn-xs editBtn"
																			data-title="Edit" id="editBtn" data-toggle="modal"
																			data-target="#edit"
																			name="${projectUserDTO.userNo}/${projectUserDTO.userName}/${projectUserDTO.projectuserRole.projectUserTask}">
																			<span class="glyphicon glyphicon-pencil"></span>
																		</button>
																</span> <span data-placement="top" data-toggle="tooltip"
																	title="Delete">
																		<button class="btn btn-danger btn-xs delBtn"
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
										　<button class="btn btn-primary btn-xs" data-title="add" id="addBtn" data-toggle="modal" data-target="#add"
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
							<input class="form-control border-input" type="text" name="projectUserTask" id="projectUserTask" value="" style="width:100%">
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



	<div class="modal fade" id="delete" tabindex="-1" role="dialog"	aria-labelledby="edit" aria-hidden="true">
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


	<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">팀원추가</h4>
				</div>
				<form id="inviteForm" action="${pageContext.request.contextPath}/project/addProjectUser" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<div class="modal-body">
						<div class="form-group">
							초대할 팀원의 아이디를 입력해 주세요<p><p/>
							<input class="form-control border-input" type="text" name="userId" id="invitedUserId" style="width:100%;"/>
							<p></p>
						</div>
					</div>
				</form>
					<div class="modal-footer">
<!-- 					<button type="submit" class="btn btn-warning btn-lg" style="width: 100%;">
 -->					<button id="inviteBtn" class="btn btn-warning btn-lg" style="width: 100%;">
							<span class="glyphicon glyphicon-ok-sign"></span> 초대하기
						</button>
					</div>
				
			</div>
		</div>
	</div>
	<!-- modal end -->


	<!--   Core JS Files   -->
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

			//팀원역할 수정
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
	
			//팀원삭제
			$(document).on("click", "#delBtn", function() {
				var delUserNo = parseInt($(this).attr("name"));
				$("#delUserNo").attr("value", delUserNo);
			})
			
			//완료대기중(1), 완료된 조별과제(2) 버튼 비활성화
			if("${projectState}"=="1" || "${projectState}"=="2"){
				//$("#editBtn").attr("style", "display:none");
				//$("#delBtn").attr("style", "display:none");
				
				$(".btn btn-primary btn-xs editBtn").disabled=true;
				$(".delBtn").disabled=true;
				
				
				$("#addBtn").attr("style","display:none");	
			}
			
		});
		
		
		var header = $("meta[name='_csrf_header']").attr("content");
		var token = $("meta[name='_csrf']").attr("content");
		
		//초대하기버튼클릭시 이미 속해있는 조원인지 확인 후 처리
		$("#inviteBtn").click(function(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/project/selectChkProjectMember",
				data: "userId="+$("#invitedUserId").val(),
				dataType: "text",
	            beforeSend : function(xhr){
	                   xhr.setRequestHeader(header, token);
	            },
				success: function(result){
					console.log("ajax 결과 : " + result);
 					if(result==""){//조원초대가능
 						alert("초대가 가능한 회원입니다.");
 						$("#inviteForm").submit();
					}else{//이미 속해있는 조원일 경우
						alert("이미 조원으로 등록되어있는 회원입니다.")
						//${pageContext.request.contextPath}/project/addProjectUser로 userId갖고 이동
						
					} 
				},
				error: function(err){
					console.log("이미 속해있는 조원인지 확인 오류발생 : "+err);
				}
			})
		});
		
	</script>

</body>
</html>