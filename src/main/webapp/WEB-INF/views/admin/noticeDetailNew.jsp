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
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Animation library for notifications   -->
<link
	href="${pageContext.request.contextPath}/resources/css/animate.min.css"
	rel="stylesheet" />
<!--  Paper Dashboard core CSS    -->
<link
	href="${pageContext.request.contextPath}/resources/css/paper-dashboard.css"
	rel="stylesheet" />
<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.request.contextPath}/resources/css/themify-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 필요한 css는 이 밑에 넣어주면 됨 -->
<!-- 스크립트는 body 맨 아래쪽에 -->

<!--   Core JS Files   -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
		
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
		$("#submitForm").attr("action","${pageContext.request.contextPath}/user/updateForm");
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
		                        				<span class="ti-menu-alt"></span><a href="${pageContext.request.contextPath}/user/adminNotice"><span class="icon-name"> 리스트</span></a>
		                        		</div>
	                        		</h5>
								</div>
								<c:if test="${sessionScope.userDTO.userNo==27}">
								<div align="right" >
										<h3>
                        					<a href="${pageContext.request.contextPath}/user/delete/${noticeDTO.noticeNo}"><span class="ti-trash"></span></a>
                        					<a href="#"><span class="ti-pencil" href="#danger" data-toggle="modal"></span><span class="icon-name" href="#danger" data-toggle="modal"></a>
                        				</h3> 
								</div>
								</c:if>
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
	
	
	
	
	
	
	
	
	
	
	
	<!-- Modal -->
									<div class="modal fade" id="danger" tabindex="-1" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="true" >
										<div class="modal-dialog" style="z-index: 1050;">
											<div class="modal-content">
												<div class="modal-header modal-header-Info">
													<button type="button" class="close"t data-dismiss="modal"
														aria-hidden="true">×</button>
													<h3>
														<div class="icon-container">
                        									<span class="ti-marker-alt"></span><span class="icon-name"> 수정하기</span>
                        								</div>
													</h3>
												</div>






												<!-- 인설트 폼 -->
												<div class="modal-body" style="z-index: 1050;">
													<form class="form-horizontal"
														action="${pageContext.request.contextPath}/user/noticeUpdate"
														method="post" enctype="multipart/form-data">

														<input type="hidden" id="securityInfo"name="${_csrf.parameterName}" value="${_csrf.token}" /> 
														<%-- <input type="hidden" name="noticeTitle" value="${noticeDTO.noticeTitle}"> --%>
														<input type="hidden" name ="noticeNo" value="${noticeDTO.noticeNo}">
														<%-- <input type="hidden" name ="noticeContent" value="${noticeDTO.noticeContent}"> --%>
														<fieldset>

															<!-- Form Name -->

															<!-- Text input-->
															<div class="form-group">
																<label class="col-md-4 control-label" for="name"
																	style="text-align: right; width: 63px">제목</label>
																<div class="col-md-4">
																	<input id="name" name="noticeTitle" type="text"
																		placeholder="제목을 입력하세요" class="form-control input-md"
																		style="width: 465px" value="${noticeDTO.noticeTitle}">

																</div>
															</div>


															<!-- Textarea -->
															
															 <div class="form-group">
																<label class="col-md-4 control-label" for="anschrift" style="width:63px">내용</label>
																
																	<textarea class="form-control" id="anschrift"
																		name="noticeContent" rows="5" style="width:150%"
																		placeholder="내용을 입력하세요">${noticeDTO.noticeContent}</textarea>
																
															</div> 

															<!-- Button (Double) -->
															<div class="input-group">
																
																	
															</div>
															<!-- Button (Double) -->
															<div class="form-group">
																<label class="col-md-4 control-label" for="anmelden"></label>
																<div class="col-md-8">
																	<input type="submit" id="anmelden" name="anmelden"
																		class="btn btn-Info" value="수정" >
									                        			
																</div>
															</div>
														</fieldset>
													</form>

												</div>
												<!-- 인설트 폼 -->



												<script type="text/javascript">
													// Fake file upload
													document
															.getElementById(
																	'fake-file-button-browse')
															.addEventListener(
																	'click',
																	function() {
																		document
																				.getElementById(
																						'files-input-upload')
																				.click();
																	});

													document
															.getElementById(
																	'files-input-upload')
															.addEventListener(
																	'change',
																	function() {
																		document
																				.getElementById('fake-file-input-name').value = this.value;

																		document
																				.getElementById(
																						'fake-file-button-upload')
																				.removeAttribute(
																						'disabled');
																	});
												</script>
												<div class="modal-footer">
													<button type="button" class="btn btn-Info btn-filter"
														data-dismiss="modal">닫기</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
									<!-- Modal -->
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>

</html>