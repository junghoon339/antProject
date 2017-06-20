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

</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/team_sidebar_ch.jsp" />


		<div class="main-panel">
			<jsp:include page="/WEB-INF/views/project/header_ch.jsp" flush="false" />



			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6 margin-bottom-30" >
				<!-- BEGIN Portlet PORTLET-->
				<div class="portlet portlet-bordered" style="width:900px ; height:340px; transform:translate(18%, 6%)" >
					<div class="portlet-title">
						<div class="caption caption-red">
							제목 - 
							<span class="caption-subject text-uppercase"> ${dto.storageTitle}</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="caption-helper">작성일 - ${dto.writeDay}</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="caption-helper">작성자 - ${dto.userDTO.userName}</span>
						</div>
						<div class="actions">
						<c:if test="${dto.fileName!=null}">
							<a href="javascript:;">
								<i class="glyphicon glyphicon-paperclip"></i>
							</a>
							<a href="${pageContext.request.contextPath}/storage/download?fileName=${dto.fileName}">
								${dto.fileName}
							</a>
							
						</c:if>
							<form id="submitForm" method="post" action="">
								<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							
								<input type="hidden" name="userNO" value="${dto.userDTO.userNo}">
								<input type="hidden" name="userName" value="${dto.userDTO.userName}">
								<input type="hidden" name="storageTitle" value="${dto.storageTitle}">
								<input type="hidden" name="storageNo" value="${dto.storageNo}">
								<input type="hidden" name="storageContent" value="${dto.storageContent}">
							</form>
						
							<a href="#" class="btn btn-red btn-circle" onclick="submitHidden()">
								<i class="glyphicon glyphicon-pencil"></i>
							</a>
							
							<a href="${pageContext.request.contextPath}/storage/delete/${dto.storageNo}/${dto.userNo}/${dto.projectNo}" class="btn btn-red btn-circle active" class="btn btn-red btn-circle">
								<i class="glyphicon glyphicon-trash"></i>
							</a>
				
						</div>
					</div>
					<div class="portlet-body">
						<h4>${dto.storageContent}</h4>
					</div>
					
					
				</div>
				<!-- END Portlet PORTLET-->
				<hr>
			</div>
						<!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
					</div>
				</div>
			</div>

			<jsp:include page="/WEB-INF/views/project/footer_ch.jsp" flush="false" />
		</div>
	</div>
	
	<c:import url="/project/chat"/>
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