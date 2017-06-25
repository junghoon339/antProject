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

	
	//조장일경우 팀플정보 수정,마감하기 버튼 보이기
  	if ("${projectUserRole}" == "조장") {
		$("#updateBtn").attr("style", "display:display");
		$("#Btn").attr("style","display:display");
	}
	
	//projectState=1일 경우 마감하기 버튼 비활성화
	if("${projectDTO.projectState}"=="1"){
		$("#Btn").attr("disabled","disabled");
	}
	
	//alert("${projectDTO.projectState}"=="1");

})

	$(function() {
		$("#Btn").click(function() {
			$("#myModal").modal("show");							
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

<!-- **************************************************************** -->
						<div id="myModal" class="modal fade in">
					        <div class="modal-dialog modal-sm">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h4 class="modal-title"><span class="ti-help-alt"/> <font color="red">주의!</font></h4>
					                </div>
					                <div class="modal-body" align="center">
					                    <font style="font-size:small;">
					                    	정말 조별과제를 마감하시겠습니까?<br>
					                    </font><font style="font-size:x-small;color: #6b69f2">
					                    	마감하기 진행시, 설문조사로 넘어가며 되돌릴 수 없습니다.<br> 신중하게 결정해주세요!
					                    </font>
					                    <p>
					                </div>
					                <div class="modal-footer">
					                <form action="${pageContext.request.contextPath}/survey/mainPage" method="post">
					                	<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
					                	<input type="hidden" name="hiddenVal" value="1">
					                    <button type="submit" class="btn btn-warning"> 확인</button> 
					                    <button type="button" class="btn btn-default" data-dismiss="modal"> 취소</button>
					                </form>
					                </div>
					 
					            </div><!-- /.modal-content -->
					        </div><!-- /.modal-dalog -->
					    </div><!-- /.modal -->
						
<!-- **************************************************************** -->

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
                                        <button type="submit" class="btn btn-info btn-fill btn-wd" id="updateBtn" style="display:none">수정하기</button>
										<button type="button" class="btn btn-info btn-fill btn-wd" id="Btn" style="display:none">마감하기</button>
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