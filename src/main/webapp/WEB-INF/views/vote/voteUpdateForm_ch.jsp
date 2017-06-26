<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Paper Dashboard by Creative Tim</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap core CSS     -->
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="${pageContext.request.contextPath }/resources/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css" rel="stylesheet" />

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

<script>
$(function() {
	
	if(${projectState==2}){
		location.href="${pageContext.request.contextPath}/vote/";
	}

	$("#insert").click(function(){
		$("#createForm").submit();
	})
	
	//**************************************************************************8
	var checked = true;
	
	$("#datepicker").datepicker();

	$("#addBtn").click(function() {
		
		var code = "<input type='text' class='form-control' name='chk' placeholder='항목을 입력하세요.''/><p>";
		$("#addArticle").append(code);
	})

	$("#dateCheck").click(function() {

		if (checked) {
			checked = false;
			$("#datepicker").prop("disabled", false);
		} else {
			checked = true;
			$("#datepicker").prop("disabled", true);
		}
	})

});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/sidebar_ch.jsp" />
		<div class="main-panel">
			<jsp:include page="/WEB-INF/views/project/header_ch.jsp" flush="false" />

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						
						<!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
						<section>
						<div class="container">
							<div class="row">
					
					
						<div class="col-md-11">
						<div class="card" style="padding-left : 20px;padding-right: 20px;">
						<%@include file="header.jsp"%>
								<div class="form-group" style="padding: 12px;">
									<form action="${pageContext.request.contextPath}/vote/update" id="createForm" method="post">
										<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
										<input type="hidden" name="userNo" value="${sessionScope.userDTO.userNo}" />
										<input type="hidden" name="projectNo" value="${sessionScope.projectNo}" />
										<input type="hidden" name="voteNo" value="${vote.voteNo}" />
										<font size="4">투표 제목</font><p>
										<input type="text" class="form-control" name="voteTitle" placeholder="제목을 입력하세요." value="${vote.voteTitle}" disabled="disabled"/><p>
										<font size="4">항목 입력</font>
										<div id="addArticle"><p>
											<c:forEach items="${voteDetailList}" var="detail" varStatus="colStatus">
											<input type="text" class="form-control" name="chk" placeholder="항목을 입력하세요."  value="${detail.voteDetailColumn}" disabled="disabled"/><p>
											</c:forEach>
										</div>
										<a href="#" class="btn btn-sm btn-default" id="addBtn">
											<span class="glyphicon glyphicon-plus"></span> 
										</a> 
										<font size="2" color="#b5bab8">항목 추가</font><br><br>
										<font size="4">마감시간 설정</font><p>
										<input type="checkbox" id="dateCheck" disabled="disabled"> <input type="text" id="datepicker" name="voteEndDate" value="${vote.voteEndDate}" disabled="disabled"><br><p>
										<br><font size="4">기타옵션</font><p>
										<input type="checkbox" name="" disabled="disabled"/> 복수선택<p>
										<input type="checkbox" name="" disabled="disabled"/> 익명투표<p>
										<input type="checkbox" name="" disabled="disabled"/> 선택항목 추가 허용<p>
										<br><br>
										<a href="#" class="btn btn-lg btn-warning" id="insert">등록</a> 
										<a href="#" class="btn btn-lg btn-default" id="cancel">취소</a>
									</form>
								</div>
						</div>
						</div>
						</div></div></section>
						
					</div>
				</div>
			</div>

			<jsp:include page="/WEB-INF/views/project/footer_ch.jsp" flush="false" />
		</div>
	</div>
	
	<%-- <c:import url="/project/chat"/> --%>
</body>

<!--   Core JS Files   -->
<%-- <script
	src="${pageContext.request.contextPath }/resources/js/jquery-1.10.2.js"
	type="text/javascript"></script> --%>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"
	type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<%-- <script
	src="${pageContext.request.contextPath }/resources/js/bootstrap-checkbox-radio.js"></script> --%>

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