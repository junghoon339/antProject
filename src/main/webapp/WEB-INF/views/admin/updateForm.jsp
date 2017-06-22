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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 필요한 css는 이 밑에 넣어주면 됨 -->
<!-- 스크립트는 body 맨 아래쪽에 -->
</head>
<script type="text/javascript">
	/* sumbit */
	function submitHidden() {
		alert("adfs");
		$("#submitForm").attr("action","${pageContext.request.contextPath}/admin/update");
		$("#submitForm").submit();
	}
	
	
</script>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/sidebar_ch.jsp" />
		<div class="main-panel">
			<jsp:include page="/WEB-INF/views/project/header_ch.jsp"
				flush="false" />
			<!-- </nav> -->
			<div class="content">
				<div class="container-fluid">
					<!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
					<!-- 
						작성할때 template.html 에서
						<div class="row">부터 참고하면서 작성하면 됨
					-->



			
					
					<div class="portlet portlet-bordered" >
					
					<form action="" method="post" id="submitForm">
						<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					<div class="portlet-title">
						<div class="caption caption-red">
							제목 - 
							<%-- <span class="caption-subject text-uppercase"> ${dto.storageTitle}</span> --%>
							
							<input type="text" value="${noticeDTO.noticeTitle}" name="noticeTitle">
							<%-- <span class="caption-helper">작성일 - ${dto.writeDay}</span> --%>
							<input type="hidden" value="${noticeDTO.writeDay}" name="writeDay">
							<!-- <input type="hidden" value="1" name="userNo"> -->
							<%-- <span class="caption-helper">작성자 - ${storageDTO.storageNo}</span> --%>
							<input type="text" value="${noticeDTO.noticeNo}" name="noticeNo">
							
							
						</div>
						<div class="actions">
						
						
						</div>
					</div>
					<div class="portlet-body">
						<h4><textarea cols="90" rows="12" name="noticeContent">${noticeDTO.noticeContent}</textarea></h4>
						
					</div>
					</form>
					<br>
					<a href="#" class="btn btn-block btn-lg btn-default" onclick="submitHidden()"><span class="glyphicon glyphicon-pencil"></span>수정하기</a>
					
				</div>
					
					




				</div>
			</div>
			<jsp:include page="/WEB-INF/views/project/footer_ch.jsp"
				flush="false" />
		</div>
	</div>

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

</body>

</html>