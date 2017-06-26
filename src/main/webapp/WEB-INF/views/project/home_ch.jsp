<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<security:csrfMetaTags />
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
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Animation library for notifications   -->
<link
	href="${pageContext.request.contextPath }/resources/css/animate.min.css"
	rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link
	href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css"
	rel="stylesheet" />


<!--  Fonts and icons  -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.request.contextPath }/resources/css/themify-icons.css"
	rel="stylesheet">

<script type="text/javascript">
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");
	var regNumber = /^[0-9]*$/;
	$(document)
			.ready(
					function() {
						$(document).on("focusout", "[name='userScore']", function(){
							
							if(!regNumber.test($(this).val())){
								alert("숫자만 입력해주세요.");
								$(this).val("");
								$(this).focus();
								return;
							}
							else if($(this).val()<0 || $(this).val()>100){
								alert("1~100사이의 점수를 입력해주세요.");
								$(this).val("");
								$(this).focus();
								return;
							}
						})
						
						$("#plusImg").click(function() {
							$("#myModal").modal(); 
						})

						$("#addBtn").click(function() {
							var addInputbox = "<span id='addRow'><input class='form-control border-input' type='text' name='invitedUser' placeholder='초대할 팀원아이디를 입력하세요.' style='width:80%;float:left'>&nbsp;<button type='button' class='btn btn-primary btn-xs' id='delMemberbtn' style='width:18%;height:40px;'>삭제</button><p></span>";
							$("#invitedMemberDiv").append(addInputbox);
							num = num + 1;
						})
					
						$(document).on("click","#delMemberbtn",function(){
							$(this).parent().remove();
							/* $(this).prev().remove();
							$(this).remove(); */
								
						
						})
						

						$("#projectForm").submit(function() {
							alert("새로운 조별과제가 등록되었습니다.");
						});
						
						//새로운 조별과제 submit
						$("#insertProjectBtn").click(function() {
							if (check() == true)
								$("#projectForm").submit();

						});
						
						//projectNO, projectState를 submit
						$(document).on("click","#enter",function(){
							 $(this).parent().submit();
						});
						
						
						$(".survey").click(function(){
											var pn = $(this).parent().prev().val();
											$
													.ajax({
														url : "${pageContext.request.contextPath}/survey/",
														type : "post",
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			header,
																			token);
														},
														dataType : "json",
														data : "projectNo="+pn,
														success : function( result) {
															
															if ($(result)
																	.size() == 0) {
																alert("이미 설문조사에 참여하였습니다.");
																return;
															}
															var str = "";
															$.each(result, function( index, item) {
																str += '<tr width="100%">';
																str += '<td name="nameTd" width="35%"><center>'
																		+ item.userName
																		+ '</center></td>';
																str += '<input type="hidden" name="userName" value="'+item.userName+'" />';
																str += '<input type="hidden" name="projectNo" value="'+pn+ '" />';
																str += '<td name="scoreTd" width="50%" style="padding-right:10px;"><input type="text" class="form-control" name="userScore" placeholder="점수를 입력해주세요." value=""/></td>';
																str += '</tr><tr><td>　</td></tr>';
															})
															$("#print").html(
																	str);
															$("#myModal2")
																	.modal(
																			'show');

														},
														error : function(err) {
															alert("teamInfo.jsp ERROR : "
																	+ err);
														}
													});
										})

						$("#okayBtn").click(function() {
							$("#ffform").submit();
							alert("설문조사를 완료하였습니다.");
						})

					});

	function check() {
		if (fr.projectName.value == "") {
			alert("조별과제명을 입력해 주세요.");
			fr.projectName.focus();
			return false;
		} else if (fr.projectSubject.value == "") {
			alert("과목명을 입력해 주세요.");
			fr.projectSubject.focus();
			return false;
		} else if (fr.projectTeacher.value == "") {
			alert("교수님 성함을 입력해 주세요.");
			fr.projectTeacher.focus();
			return false;
		} else if (fr.projectStartdate.value == "") {
			alert("조별과제 시작날짜를 입력해 주세요.");
			fr.projectStartdate.focus();
			return false;
		} else if (fr.projectEnddate.value == "") {
			alert("조별과제 종료날짜를 입력해 주세요.");
			fr.projectEnddate.focus();
			return false;
		} else if (fr.projectStartdate.value > fr.projectEnddate.value) {
			alert("시작날짜와 종료날짜를 확인해주세요");
			fr.projectEnddate.focus();
			return false;
		} else
			return true;
	}
</script>
<style type="text/css">
.card {
	height: 190px;
}
#setWidth {
	width: 55%;
	margin-left: 88px;
}
.form-control{
	width: 100%;
}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/sidebar_ch.jsp" />

		<div class="main-panel">
			<jsp:include page="header_ch.jsp" flush="false" />

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<c:choose>
							<c:when test="${empty currentProList}&&${empty surveyingProList}">
								<!-- 진행중인,완료대기중인 조별과제가 없으면 -->
								<h4>진행중인 조별과제가 없습니다.</h4>
							</c:when>
							<c:otherwise>
								<!-- 조별과제가 있으면 -->
								<c:forEach items="${surveyingProList}" var="projectDTO" varStatus="status">
									<!-- 완료대기중 조별과제 -->
									<div class="col-lg-3 col-sm-6">
										<div class="card">
											<div class="content">
												<div class="row">
													<div class="col-md-11">
														<div class="numbers">
															<h5>${projectDTO.projectName}</h5>
															<p>
																<i class="ti-timer"></i>&nbsp;&nbsp;완료 대기중
															</p>
														</div>
													</div>
												</div>
												<hr />
												<div class="row">
													<div class="col-md-8">
													<c:forEach items="${surveySuccessList}" var="ssl" >
														<c:if test="${(ssl.key==projectDTO.projectNo)&&(ssl.value==true)}">
															<span class="label label-success "><a href="#" style="color: #FFFFFF;" class="surveySuc">설문조사 참여완료</a></span>
														</c:if>
														<c:if test="${(ssl.key==projectDTO.projectNo)&&(ssl.value==false)}">
															<input type="hidden" value="${projectDTO.projectNo}"><span class="label label-warning "><a href="#" style="color: #FFFFFF;" class="survey">설문조사 참여하기</a></span>														
														</c:if>
													</c:forEach>	
													</div>
													<div class="col-md-2">
														<form id="enterForm" action="${pageContext.request.contextPath}/project/teamMain" method="post">
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
															<input type="hidden" name="projectNo" value="${projectDTO.projectNo}">
															<input type="hidden" name="projectState" value="${projectDTO.projectState}">
															<a class="btn btn-primary btn-simple" id="enter">Enter</a>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>

								<c:forEach items="${currentProList}" var="projectDTO2"><!-- 진행중인 조별과제 -->
									<div class="col-lg-3 col-sm-6">
										<div class="card">
											<div class="content">
												<div class="row">
													<div class="col-xs-11">
														<div class="numbers">
															<h5><div title="${projectDTO2.projectName}" style="white-space: nowrap; text-overflow: ellipsis; width:150px; overflow: hidden;">
															
															${projectDTO2.projectName}
															</div></h5>

															<p>
																<i class="ti-timer"></i>&nbsp;&nbsp;D-${projectDTO2.dday}
															</p>
															
														</div>
													</div>
												</div>
												<hr />
												<div class="row">
													<div class="col-md-2 col-md-offset-8">

														<form id="enterForm" action="${pageContext.request.contextPath}/project/teamMain" method="post">
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
															<input type="hidden" name="projectNo" value="${projectDTO2.projectNo}">
															<input type="hidden" name="projectState" value="${projectDTO2.projectState}">
															<a class="btn btn-primary btn-simple" id="enter">Enter</a>
														</form>													
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<!-- 플러스이미지 -->
						<div class="col-lg-3 col-sm-6">
							<div class="card">
								<div class="row">
									<div class="content" id="plusImg">
										<div style="height: 85px" align="center">
										<img style="height: 100%; margin-top : 20px; cursor:pointer;"
											src="${pageContext.request.contextPath}/resources/img/plus1.png" >
										</div>
										<h5 align="center" style="font-family: 나눔고딕코딩; cursor:pointer">새 조별과제 생성</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="footer_ch.jsp" flush="false" />
		</div>
	</div>


	<!-- Modal -->
	<div id="myModal2" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width: 400px;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">조원 점수평가</h4>
				</div>
				<form id="ffform"
					action="${pageContext.request.contextPath}/survey/insertSurveyDetail"
					method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<div class="modal-body">
					<div align="center">
						<span class="ti-help-alt"/> <font style="font-size:small;color: #6b69f2">조별과제를 진행하면서 혹시 '베짱이'가 있었나요?<br>
						조원들의 참여도에 대한 점수를 매겨주세요!</font><br>
						<font style="font-size: xx-small;">(투표는 익명으로 반영되며 미참여시 본인이 불이익을 당할 수 있습니다.)</font><br>
					</div>
					<br>
						<table>
							<hr>
							　　　　NAME　　　　　　　　SCORE
							<hr>
							<div id="print"></div>
						</table>
						<p><br><br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal"
							id="okayBtn">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">새로운 조별과제 등록</h4>
				</div>
				<div class="modal-body">
					<div class="container" style="margin-top: 10px;">
						<div class="row">
							<div class="">
								<form id="projectForm" name="fr" class="form-horizontal col-sm-7 col-sm-offset-0"
									action="${pageContext.request.contextPath}/project/insertProject"
									method="post">
									<div id="setWidth">
									<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}">
									 *새로운 조별과제를 만드는 분이 자동으로 조장으로 지정됩니다.
									<p></p>
									팀플명 : <input class="form-control border-input" type="text"
										name="projectName" />
									<p></p>
									과목명 : <input class="form-control border-input" type="text"
										name="projectSubject" />
									<p></p>
									교수님 : <input class="form-control border-input" type="text"
										name="projectTeacher" />
									<p></p>
									시작날짜:
										<input class="form-control border-input" name="projectStartdate"
											id="registration-date" type="date">
									<p></p>
									종료날짜 :
										<input class="form-control border-input" name="projectEnddate"
											id="registration-date" type="date">
									<p></p>

									<div id="invitedMemberDiv">
										팀원ID : <input class="form-control border-input" type="text"
											name="invitedUser" placeholder="초대할 팀원아이디를 입력하세요."/>
										<p></p>
									</div>

									<!-- <span id="addMember">+</span> -->
									<a href="#" class="btn btn-sm btn-default" id="addBtn"> <span
										class="glyphicon glyphicon-plus">팀원추가</span>
									</a>
									</div><!-- setWidth태그 -->
								</form>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="insertProjectBtn">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

</body>

<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"
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