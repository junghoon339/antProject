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
		$("#submitForm").attr("action","${pageContext.request.contextPath}/storage/updateForm");
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
						<div class="card card-plain">
							<div class="header">
								<div class="col-sm-6">
									<h4 class="title">상세보기</h4>
									<p class="category">detail</p>
								</div>
								<div style="text-align: right;" class="col-sm-6">
									<a
										href="${pageContext.request.contextPath}/storage/storageTable/1">
										리스트로 돌아가기 </a>
								</div>

								<div align="right" >
									<a
										href="${pageContext.request.contextPath}/storage/delete/${dto.storageNo}/${dto.userNo}/${dto.projectNo}"
										class="btn btn-red btn-circle active"
										class="btn btn-red btn-circle">삭제</a>
									    
										 <a href="#" class="btn btn-red btn-circle" onclick="submitHidden()">
										수정
										</a>
								</div>

										<form id="submitForm" method="post" action="">
											<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										
											<input type="hidden" name="userNO" value="${dto.userDTO.userNo}">
											<input type="hidden" name="userName" value="${dto.userDTO.userName}">
											<input type="hidden" name="storageTitle" value="${dto.storageTitle}">
											<input type="hidden" name="storageNo" value="${dto.storageNo}">
											<input type="hidden" name="storageContent" value="${dto.storageContent}">
										</form>

							</div>
							<div class="content table-responsive table-full-width">
								<table class="table table-hover">
									<thead>
										<th colspan="2">제목 - ${dto.storageTitle}</th>
										<th colspan="2">작성자 - ${dto.userDTO.userName}</th>
										<th colspan="2">작성일 - ${dto.writeDay}</th>
										<c:if test="${dto.fileName!=null}">
											<th colspan="2">첨부파일 - <a
												href="${pageContext.request.contextPath}/storage/download?fileName=${dto.fileName}">
													${dto.fileName} </a>
											</th>
										</c:if>
									</thead>
									<tbody>
										<tr>
											<td colspan="8" rowspan="4"><h1>${dto.storageContent}</h1></td>
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