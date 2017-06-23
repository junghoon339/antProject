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
<style type="text/css">
.card {
	height: 190px;
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
							<c:when	test="${empty completedProList}"><!-- 완료된 조별과제가 없으면 -->
								<h4>완료된 조별과제가 없습니다.</h4>
							</c:when>
							<c:otherwise><!-- 완료된 조별과제가 있으면 -->
								<c:forEach items="${completedProList}" var="projectDTO"><!-- 완료된 조별과제 -->
									<div class="col-lg-3 col-sm-6">
				                        <div class="card">
				                            <div class="content">
				                                <div class="row">
				                                    <div class="col-md-11">
				                                        <div class="numbers">
				                                            <h5>${projectDTO.projectName}</h5>
				                                        </div>
				                                    </div>
				                                </div>
				                                <hr/>
				                               <div class="row">
													<div class="col-md-2 col-md-offset-8">
					                              		<a href="${pageContext.request.contextPath}/project/teamMain/${projectDTO.projectNo}" class="btn btn-primary btn-simple">Enter</a>
					                                 </div>
				                                </div>
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