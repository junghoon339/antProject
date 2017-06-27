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

<title>개미와 베짱이, 대학조별과제 관리시스템</title>
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
	
	/* $(document).ready(function(){
		$("#anmelden").click(function(){
			location.href=""
		})
	}) */
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
							<div class="row">
								<div class="col-sm-6">
									<h3>
									<div class="icon-container">
                        				<span class="ti-zoom-in"></span><span class="icon-name"> 상세보기</span>
                        			</div>
                        			</h3>
								</div>
								<div style="text-align: right;" class="col-sm-6">
									<h5>
									<div class="icon-container">
	                        				<span class="ti-menu-alt"></span><a href="${pageContext.request.contextPath}/storage/storageTable/${dto.projectNo}"><span class="icon-name"> 리스트</span></a>
	                        		</div>
	                        		</h5>
								</div>
								</div>

								<div class="row" align="right" >
									<%-- <a
										href="${pageContext.request.contextPath}/storage/delete/${dto.storageNo}/${dto.userNo}/${dto.projectNo}"
										class="btn btn-red btn-circle active"
										class="btn btn-red btn-circle">삭제</a> --%>
										
										<h3>
										
                        					<%-- <a href="${pageContext.request.contextPath}/storage/delete/${dto.storageNo}/${dto.userNo}/${dto.projectNo}"><span class="ti-trash"></span></a> --%>
                        				
                        					<!--  <a href="#" onclick="submitHidden()"><span class="ti-ink-pen"></span></a> -->
                        					 
                        					 
                        					 
     <c:set var="userNo" value="${dto.userNo}"/>				 
     <c:if test="${sessionScope.userDTO.userNo eq userNo}">			 
       <c:if test="${sessionScope.projectState==0}"> 
      <ul class="nav navbar-nav" style="float:right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="ti-settings"></span></a>
          <ul class="dropdown-menu">
            <li style="text-align: center"><h5><a href="#"><span class="ti-marker-alt" href="#danger" data-toggle="modal"></span><span class="icon-name" href="#danger" data-toggle="modal"></span><span class="icon-name" href="#danger" data-toggle="modal">수정하기</span></a></h5></li>
            <li style="text-align: center"><h5><a href="${pageContext.request.contextPath}/storage/delete/${dto.storageNo}/${dto.userNo}/${dto.projectNo}"><span class="ti-trash"></span><span class="icon-name">삭제하기</span></a></h5></li>
          </ul>
        </li>
      </ul>          					 
       </c:if>                 					 
       </c:if>                 					 
                        					 
                        					 <!-- <span class="ti-marker-alt" href="#danger" data-toggle="modal"></span><span class="icon-name" href="#danger" data-toggle="modal"><a href="#"></a></span> -->
                        				
                        				
                        				
                        				
                        				
                        				
                        				
                        				
                        				
                        				
                        				
                        				</h3> 
                        				
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
										<th colspan="2">
										 <div class="icon-container">
                        					<span class="ti-direction-alt"></span><span class="icon-name">&nbsp;&nbsp; ${dto.storageTitle}</span>
                        				</div> 
										 </th>
										<th colspan="2">
										<div class="icon-container">
                        					<span class="ti-cloud-up"></span><span class="icon-name">&nbsp;&nbsp; ${dto.userDTO.userName}</span>
                        				</div>
										</th>
										<th colspan="2">
										<div class="icon-container">
                        					<span class="ti-time"></span><span class="icon-name">&nbsp;&nbsp; ${dto.writeDay}</span>
                        				</div>
										</th>
										<c:if test="${dto.fileName!=null}">
											<th colspan="2">
											<div class="icon-container">
                        						<span class="ti-save"></span><span class="icon-name"><a
												href="${pageContext.request.contextPath}/storage/download?fileName=${dto.fileName}">
													&nbsp;&nbsp;${dto.fileName} </a></span>
                        					</div> 
											</th>
										</c:if>
									</thead>
									<tbody>
										<tr>
											<td colspan="8" rowspan="4"><h3>${dto.storageContent}</h3></td>
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
														action="${pageContext.request.contextPath}/storage/update"
														method="post" enctype="multipart/form-data">

														<input type="hidden" id="securityInfo"name="${_csrf.parameterName}" value="${_csrf.token}" /> 
														<input type="hidden" name="userNo" value="${sessionScope.userDTO.userNo}">
														<input type="hidden" name ="projectNo" value="${projectNo}">
														<input type="hidden" name ="storageNo" value="${dto.storageNo}">

														<fieldset>

															<!-- Form Name -->

															<!-- Text input-->
															<div class="form-group">
																<label class="col-md-4 control-label" for="name"
																	style="text-align: right; width: 63px">제목</label>
																<div class="col-md-4">
																	<input id="name" name="storageTitle" type="text"
																		placeholder="제목을 입력하세요" class="form-control input-md"
																		style="width: 465px" value="${dto.storageTitle}">

																</div>
															</div>


															<!-- Textarea -->
															
															 <div class="form-group">
																<label class="col-md-4 control-label" for="anschrift" style="width:63px">내용</label>
																
																	<textarea class="form-control" id="anschrift"
																		name="storageContent" rows="5" style="width:150%"
																		placeholder="내용을 입력하세요">${dto.storageContent}</textarea>
																
															</div> 

															<!-- Button (Double) -->
															<div class="input-group">
																<span class="input-group-btn">
																
																
																	<button id="fake-file-button-browse" type="button"
																		class="btn btn-default">
																		<i><div class="icon-container">
             										           				<span class="ti-clip"></span>
                        												</div></i>
																	</button>
																	
																	
																</span> <input type="file" id="files-input-upload"
																	style="display: none" name="file"> <input
																	type="text" id="fake-file-input-name"
																	disabled="disabled" placeholder="File not selected"
																	class="form-control" name="filePath"> <span
																	class="input-group-btn">
																	
																	<button type="button" class="btn btn-default"
																		disabled="disabled" id="fake-file-button-upload">
																		<div class="icon-container">
                        													<span class="ti-dropbox"></span>
                        												</div>
																	</button>
																	
																</span>
															</div>
															<!-- Button (Double) -->
															<div class="form-group">
																<label class="col-md-4 control-label" for="anmelden"></label>
																<!-- <div class="col-md-8">
																	<input type="submit" id="anmelden" name="anmelden"
																		class="btn btn-Info" value="수정" >
									                        			
																</div> -->
															</div>
														</fieldset>
													

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
												<div class="form-group">
														<div class="col-md-8">
															<button type="button" class="btn btn-Info btn-filter"
																data-dismiss="modal">닫기</button>
														
														<div class="col-md-8">
																	<input type="submit" id="anmelden" name="anmelden"
																		class="btn btn-Info" value="수정" >
									                        			
																</div>
																</div>
																</form>
												</div>
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