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
<script type="text/javascript">
	/* 모달 */
	$(document).ready(function() {
		$("#mytable #checkall").click(function() {
			if ($("#mytable #checkall").is(':checked')) {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", true);
				});

			} else {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
	});
	/* 모달 */

</script>
<script type="text/javascript">
	function submitHidden() {
		$("#submitForm").attr("action","${pageContext.request.contextPath}/admin/updateForm");
		$("#submitForm").submit();
	}
</script>
</head>
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









					<div class="col-md-12">
						<div class="card">
							<div class="header">	
								<div class="col-sm-6">
									<h3>
									<div class="icon-container">
                        				<span class="ti-zoom-in"></span><span class="icon-name"> 상세보기</span>
                        			</div>
                        			</h3>
								</div>
								<div style="text-align: right;" class="col-sm-6">
								
									<%-- <a
										href="${pageContext.request.contextPath}/admin/adminNotice">
										리스트로 돌아가기 </a> --%>
										
									<h5>
										<div class="icon-container">
		                        				<span class="ti-menu-alt"></span><a href="${pageContext.request.contextPath}/admin/adminNotice"><span class="icon-name"> 리스트</span></a>
		                        		</div>
	                        		</h5>
								</div>

								<div align="right" >
										<h3>
                        					<a href="${pageContext.request.contextPath}/admin/delete/${noticeDTO.noticeNo}"><span class="ti-trash"></span></a>
									    
                        					 <a href="#" onclick="submitHidden()"><span class="ti-ink-pen"></span></a>
                        				</h3> 
								</div>

										<form id="submitForm" method="post" action="">
											<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<input type="hidden" id="noticeNo" name="noticeNo" value="${noticeDTO.noticeNo}">  
											<input type="hidden" name="noticeTitle" value="${noticeDTO.noticeTitle}">
											<input type="hidden" name="noticeContent" value="${noticeDTO.noticeContent}">
										</form>
							
							</div>
							<div class="content table-responsive table-full-width">
								<table class="table table-hover">
									<thead>
										<th colspan="2">
										<div class="icon-container">
                        					<span class="ti-direction-alt"></span><span class="icon-name"> ${noticeDTO.noticeTitle}</span>
                        				</div> 
										
										</th>
										<th colspan="2">
										<div class="icon-container">
                        					<span class="ti-cloud-up"></span><span class="icon-name">&nbsp;&nbsp;관리자</span>
                        				</div>
                        				</th>
										<th colspan="2">
										<div class="icon-container">
                        					<span class="ti-time"></span><span class="icon-name">&nbsp;&nbsp; ${noticeDTO.writeDay}</span>
                        				</div>
										</th>
									</thead>
									<tbody>
										<tr>
											<td colspan="8" rowspan="4"><h1>${noticeDTO.noticeContent}</h1></td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
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