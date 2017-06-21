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
<link rel="apple-touch-icon" sizes="76x76"	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Paper Dashboard by Creative Tim</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap core CSS     -->
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="${pageContext.request.contextPath }/resources/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css" rel="stylesheet" />


<!--  Fonts and icons  -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath }/resources/css/themify-icons.css" rel="stylesheet">

<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/resources/css/room.css" />


<script type="text/javascript">
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");

	$(document)
			.ready(
					function() {
						//tabModule.init();

						$("#plusImg").click(function() {
							$('div.modal').modal();
						})

						/* 		$(document).on("click","#addMember",function(){
						 //input추가
						 }); */

						$("#addBtn")
								.click(
										function() {
											var addInputbox = "<input class='' type='text'  name='invitedUser' placeholder='초대할 팀원을 입력하세요.'><button type='button' class='btn btn-danger' id='delMemberbtn'>삭제</button></input><p></p>";
											$("#invitedMemberDiv").append(
													addInputbox);
											num = num + 1;
										})

						$("#projectForm").submit(function() {
							alert("새로운 조별과제가 등록되었습니다.");
						});
						$("#insertProjectBtn").click(function() {
							//alert("팀플생성버튼눌림");
							if (check() == true)
								$("#projectForm").submit();

						});

						$(".survey")
								.click(
										function() {
											alert($(this).parent().children()
													.next().val());
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
														data : "projectNo="
																+ $(this)
																		.parent()
																		.children()
																		.next()
																		.val(),
														success : function(
																result) {

															var str = "";
															$
																	.each(
																			result,
																			function(
																					index,
																					item) {
																				str += '<tr width="100%">';
																				str += '<td name="nameTd" width="50%"><center>'
																						+ item.userName
																						+ '</center></td>';
																				str += '<td name="scoreTd" width="15%"><input type="text" placeholder="점수를 입력해주세요." value=""/></td>';
																				str += '<td name="updateTd" width="35%"><a href="#"><center>완료</center></a></td>';
																				str += '</tr>';
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
		} else
			return true;
	}
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/sidebar_ch.jsp" />

		<div class="main-panel">
			<jsp:include page="header_ch.jsp" flush="false" />

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">완료된 조별과제</h4>
								</div>
								<div class="content">
									 
									<c:choose>
									<c:when test="${empty completedProList}"><!-- 완료된 조별과제가 없으면 -->
										<div class="col-md-3">
											<div class="bs bs-pricing">
												<div class="cotent">
													완료된 조별과제가 없습니다.</h4>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise><!-- 완료된 조별과제가 있으면 -->
										<c:forEach items="${completedProList}" var="projectDTO">
											<div class="col-md-3">
												<div class="bs bs-pricing">
													<div class="cotent">
														<h3 class="category">${projectDTO.projectName}</h3>
														<h1 class="bs-caption">
															<small>D-</small>11
														</h1>
														<a href="${pageContext.request.contextPath}/project/teamMain/${projectDTO.projectNo}" class="btn btn-danger">Enter</a>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>

								</c:choose>
								</div>
							</div>
						</div>

						<jsp:include page="footer_ch.jsp" flush="false" />
					</div>
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