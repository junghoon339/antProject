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

<style>
.center {
	margin-top: 50px;
}

.modal-header {
	padding-bottom: 5px;
}

.modal-footer {
	padding: 0;
}

.modal-footer .btn-group button {
	height: 40px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border: none;
	border-right: 1px solid #ddd;
}

.modal-footer .btn-group:last-child>button {
	border-right: 0;
}
</style>
<script>
$(document).ready(function() {
	
	var startDate = dateToYYYYMMDD(new Date("${projectDTO.projectStartdate}"));
	var endDate = dateToYYYYMMDD(new Date("${projectDTO.projectEnddate}"));

	$("#start-date").attr("value", startDate);
	$("#end-date").attr("value", endDate);

	
	//조원일경우
	if ("${projectUserRole}" == "조장") {
		$("#updateBtn").attr("style", "display:display");
	}

})

	$(function() {
		$("#Btn").click(
						function() {

							if ($("select[name='projectState']").val() == '1') {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/survey/",
											type : "post",
											dataType : "json",
											data : "projectNo=1&"
													+ $("#securityInfo").attr(
															"name") + "="
													+ $("#securityInfo").val(),
											success : function(result) {

												var str = "";
												$
														.each(
																result,
																function(index,
																		item) {
																	str += '<tr width="100%">';
																	str += '<td name="nameTd" width="50%"><center>'
																			+ item.userName
																			+ '</center></td>';
																	str += '<td name="scoreTd" width="15%"><input type="text" placeholder="점수를 입력해주세요." value=""/></td>';
																	str += '<td name="updateTd" width="35%"><a href="#"><center>완료</center></a></td>';
																	str += '</tr>';
																})
												$("#print").html(str);
												$("#myModal").modal('show');

											},
											error : function(err) {
												alert("teamInfo.jsp ERROR : "
														+ err);
											}
										});
							}
						})
	}) 


	//데이트 포멧 
	function dateToYYYYMMDD(date) {
		function pad(num) {
			num = num + '';
			return num.length < 2 ? '0' + num : num;
		}
		return date.getFullYear() + '-' + pad(date.getMonth() + 1) + '-'
				+ pad(date.getDate());
	}
</script>


</head>
<body>
	<div class="wrapper">
		<jsp:include page="sidebar_ch.jsp" />
		<div class="main-panel">
			<jsp:include page="header_ch.jsp" flush="false" />
			<div class="content">
				<div class="container-fluid">
					<div class="row">

                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">조별과제 정보</h4>
                            </div>
                            <div class="content">
                                <form name="projectForm" class="" action="${pageContext.request.contextPath}/project/updateTeamInfo" method="post">
								<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>조별과제명</label>
                                                <input type="text" class="form-control border-input" name="projectName" value="${projectDTO.projectName}" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>과목명</label>
                                                <input type="text" class="form-control border-input"  name="projectSubject" value="${projectDTO.projectSubject}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>교수님</label>
                                                <input type="text" class="form-control border-input" name="projectTeacher" value="${projectDTO.projectTeacher}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">                                                                                 	
                                                <label>시작날짜</label>
                                               <input class="form-control border-input" name="projectStartdate" id="start-date" type="date">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">                                                                                 	
                                                <label>종료날짜</label>
                                               <input class="form-control border-input" name="projectEnddate" id="end-date"	type="date">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-info btn-fill btn-wd" id="updateBtn" style="display: none">수정</button>
										<button type="button" class="btn btn-info btn-fill btn-wd" id="Btn">마감하기</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>



					</div>
				</div>
			</div>

			<jsp:include page="footer_ch.jsp" flush="false" />
		</div>
	</div>

	<%-- <c:import url="/project/chat"/> --%>
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