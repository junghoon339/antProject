<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<meta name="viewport" content="width=device-width" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title>Insert title here</title>
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<!-- Bootstrap core CSS     -->
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />
	<!-- Animation library for notifications   -->
	<link href="${pageContext.request.contextPath }/resources/css/animate.min.css" rel="stylesheet" />
	<!--  Paper Dashboard core CSS    -->
	<link href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css" rel="stylesheet" />
	<!--  Fonts and icons     -->
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
	<link href="${pageContext.request.contextPath }/resources/css/themify-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 필요한 css는 이 밑에 넣어주면 됨 -->
	<!-- 스크립트는 body 맨 아래쪽에 -->
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/team_sidebar_ch.jsp" />
		<div class="main-panel">
			<jsp:include page="header_ch.jsp" flush="false" /> <!-- </nav> -->
			<div class="content">
				<div class="container-fluid">
					<!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
					<!-- 
						작성할때 template.html 에서
						<div class="row">부터 참고하면서 작성하면 됨
					-->
					<section>
						<div class="container">
							<div class="row">
					
							<div class="col-lg-9 col-lg-offset-1">
							<%@include file="header.jsp"%>
								<div class="well well-lg">
									<div class="form-group" style="padding: 12px;">
										<form action="${pageContext.request.contextPath}/vote/Create" id="createForm" method="post">
											<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
											<input type="hidden" name="projectUserNo" value="1" />
											<input type="hidden" name="userNo" value="${sessionScope.userDTO.userNo}" />
											<input type="hidden" name="projectNo" value="${sessionScope.projectNo}" />
											투표 제목<p>
											<input type="text" class="form-control" name="voteTitle" value="" placeholder="제목을 입력하세요." /><p>
											항목 입력
											<div id="addArticle"><p>
												<input type="text" class="form-control" name="chk" placeholder="항목을 입력하세요." /><p>
												<input type="text" class="form-control" name="chk" placeholder="항목을 입력하세요." /><p>
												<input type="text" class="form-control" name="chk" placeholder="항목을 입력하세요." /><p>
											</div>
											<a href="#" class="btn btn-sm btn-default" id="addBtn">
												<span class="glyphicon glyphicon-plus"></span> 
											</a> 
											<font size="2" color="#b5bab8">항목 추가</font><br><br>
											마감시간 설정<p>
											<input type="checkbox" id="dateCheck"> <input type="text" id="datepicker" name="voteEndDate" disabled="disabled"><p>
											기타옵션<p>
											<input type="checkbox" name="" /> 복수선택<p>
											<input type="checkbox" name="" /> 익명투표<p>
											<input type="checkbox" name="" /> 선택항목 추가 허용<p>
					
											<a href="#" class="btn btn-lg btn-warning" id="insert">등록</a> 
											<a href="#" class="btn btn-lg btn-default" id="cancel">취소</a>
										</form>
									</div>
								</div>
							</div>
						</div></div></section>


				</div>
			</div>
			<jsp:include page="footer_ch.jsp" flush="false" />
		</div>
	</div>
	
	<!--   Core JS Files   -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap-checkbox-radio.js"></script>
	<!--  Charts Plugin -->
	<script src="${pageContext.request.contextPath }/resources/js/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap-notify.js"></script>
	<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="${pageContext.request.contextPath }/resources/js/paper-dashboard.js"></script>
	<!-- 필요한 자바스크립트 파일은 여기에 넣어주면 됨 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
</html>