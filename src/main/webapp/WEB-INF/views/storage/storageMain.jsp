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
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/resources/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 필요한 css는 이 밑에 넣어주면 됨 -->
<!-- 스크립트는 body 맨 아래쪽에 -->
</head>
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

	/* 검색 */
	$(document).ready(function(e) {
		$('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#", "");
			var concept = $(this).text();
			$('.search-panel span#search_concept').text(concept);
			$('.input-group #search_param').val(param);
		});
	});
	/* 검색 */
</script>
<script type="text/javascript">
	$(function() {
		$("#submitBt")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/storage/storageTable/${projectNo}?searchText="
									+ $("#searchText").val()
									+ "&categoryNo="
									+ $("#category").val();
						})

		if ($("#name").val() == null) {
			alert("제목을 입력해주세요");
		}
	})
</script>
<style type="text/css">
.modal-header-danger {
	color: #fff;
	padding: 9px 15px; border-bottom : 1px solid #eee; background-color :
	#d9534f; -webkit-border-top-left-radius : 5px;
	-webkit-border-top-right-radius : 5px; -moz-border-radius-topleft : 5px;
	-moz-border-radius-topright : 5px; border-top-left-radius : 5px;
	border-top-right-radius: 5px;
	padding: 9px 15px;
	border-bottom: 1px solid #eee;
	background-color: #d9534f;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	-moz-border-radius-topleft: 5px;
	-moz-border-radius-topright: 5px;
	border-top-left-radius: 5px;
	border-bottom: 1px solid #eee;
	background-color: #d9534f;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	-moz-border-radius-topleft: 5px;
	-moz-border-radius-topright: 5px;
	border-top-left-radius: 5px;
}

/* search form */
body{
    margin-top:20px;
}
/* search form */
</style>
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



			
					
					<div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                        
                        
                            <div class="header">
                            <div class="col-sm-6">
                                <h2 class="title">자료실 ${sessionScope.projectDTO.projectNo}</h2>
                                <p class="category">자료를 공유하세요!</p>
                            </div>
                               <!--  <div class="col-sm-6" align="right">
										<a class="btn btn-danger" href="#danger" data-toggle="modal">글쓰기</a>
								</div> -->
								<div class="col-sm-6" align="right">
								 <div class="icon-container">
                        				<span class="ti-pencil" href="#danger" data-toggle="modal"></span><span class="icon-name" href="#danger" data-toggle="modal"><a href="#">글쓰기</a></span>
                        		</div>
                            </div>
                           </div>
                            
                            
                            
                            
                            <div class="header">
                            
                            
                            
                            
                            
                            
                            
                            
                            <!-- 검색 -->
									<div class="container" style="width: 910px;">
										<div class="row">
											<div class="col-xs-8 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														
														<select class="btn btn-Info dropdown-toggle"
															data-toggle="dropdown" style="width: 90px" id="category">
															<option value="-1">선택</option>
															<option value="0">이름</option>
															<option value="1">제목</option>
														</select>
													</div>
													<input type="hidden" name="search_param" value="all"
														id="search_param"> <input type="text"
														class="form-control" name="x" placeholder="검색어를 입력하세요."
														id="searchText"> <span class="input-group-btn">
														
														<button class="btn btn-Info" type="button"
															id="submitBt">
															
															<div class="icon-container">
                        										<span class="ti-search"></span>
                        									</div>
                        									
														</button>
													</span>
												</div>
											</div>
										</div>
									</div>
									<!-- 검색 -->
									
									
									
									
									
									
									
									
									
									
									</div>
									
									
									
									
									
									
                            
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                        <th>글 번호</th>
                                    	<th>이름</th>
                                    	<th>제목</th>
                                    	<th>등록날짜</th>
                                    	<th>첨부파일</th>
                                    	<th>조회수</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${list}">
													<tr>
														<td>${item.storageNo}</td>
														<td>${item.userDTO.userName}</td>
														<td><a
															href="${pageContext.request.contextPath}/storage/tableDetail/${item.storageNo}">${item.storageTitle}</a></td>
														<td>${item.writeDay}</td>
														<c:choose>
															<c:when test="${item.fileName==null}">
																<td class="center"><span
																	class="label label-warning">파일이 없습니다.</span></td>
															</c:when>
															<c:otherwise>
																<td class="center"><span class="label label-info">${item.fileName}</span>
																</td>
															</c:otherwise>
														</c:choose>

														<td>${item.readNum}</td>

													</tr>
												</c:forEach>
                                    </tbody>
                                </table>
                                
                                
							<!-- paging~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~` -->
										<div class="clearfix" style="text-align: center"
											align="center">
											<ul class="pagination pull-right" style="margin-right: 37%">
								
												<c:choose>
													<c:when test="${startPage==1}">
														<li class="disabled"><a href="#"><div class="icon-container">
							                        				<span class="ti-angle-double-left"></span>
							                        			</div></a></li>
															
													</c:when>
													<c:otherwise>
														
																<li><a href="${pageContext.request.contextPath}/storage/storageTable/${projectNo}?pageNumber=${endPage-pageSu}"><div class="icon-container">
							                        				<span class="ti-angle-double-left"></span>
							                        			</div></a></li>
													</c:otherwise>
												</c:choose>

												<c:forEach begin="${startPage}" end="${endPage}"
													var="pageNum" step="1" >
													<li><a
														href="${pageContext.request.contextPath}/storage/storageTable/${projectNo}?pageNumber=${pageNum}&searchText=${searchText}&categoryNo=${categoryNo}">${pageNum}</a></li>
												</c:forEach>

												<c:choose>
													<c:when test="${flag==true}">
														<li class="disabled"><a href="#"><div class="icon-container">
                        									<span class="ti-angle-double-right"></span>
                        								</div></a></li>
																
													</c:when>
													<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/storage/storageTable/${projectNo}?pageNumber=${startPage+pageSu}"><div class="icon-container">
		                        								<span class="ti-angle-double-right"></span>
		                        							</div></a></li>
													</c:otherwise>
												</c:choose>

											</ul>
										</div>
									
										<!-- paging~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~` -->
                            </div>
                        </div>
                    </div>
					
					



					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/project/footer_ch.jsp"
				flush="false" />
		
	</div>
	</div>
	</div>
</div>
					<!-- Modal -->
									<div class="modal fade" id="danger" tabindex="-1" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="true" >
										<div class="modal-dialog" style="z-index: 1050;">
											<div class="modal-content">
												<div class="modal-header modal-header-Info">
													<button type="button" class="close"t data-dismiss="modal"
														aria-hidden="true">×</button>
													<h1>
														<div class="icon-container">
                        									<span class="ti-export"></span><span class="icon-name"> 자료등록</span>
                        								</div>
													</h1>
												</div>






												<!-- 인설트 폼 -->
												<div class="modal-body" style="z-index: 1050;">
													<form class="form-horizontal"
														action="${pageContext.request.contextPath}/storage/insert"
														method="post" enctype="multipart/form-data">

														<input type="hidden" id="securityInfo"name="${_csrf.parameterName}" value="${_csrf.token}" /> 
														<input type="hidden" name="userNo" value="${sessionScope.userDTO.userNo}">
														<input type="hidden" name ="projectNo" value="${projectNo}">

														<fieldset>

															<!-- Form Name -->

															<!-- Text input-->
															<div class="form-group">
																<label class="col-md-4 control-label" for="name"
																	style="text-align: right; width: 63px">제목</label>
																<div class="col-md-4">
																	<input id="name" name="storageTitle" type="text"
																		placeholder="제목을 입력하세요" class="form-control input-md"
																		style="width: 465px">

																</div>
															</div>


															<!-- Textarea -->
															
															 <div class="form-group">
																<label class="col-md-4 control-label" for="anschrift" style="width:63px">내용</label>
																
																	<textarea class="form-control" id="anschrift"
																		name="storageContent" rows="5" style="width:150%"
																		placeholder="내용을 입력하세요"></textarea>
																
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
															<small class="pull-right">파일을 등록하세요</small>
															<!-- Button (Double) -->
															<div class="form-group">
																<label class="col-md-4 control-label" for="anmelden"></label>
																<div class="col-md-8">
																	<input type="submit" id="anmelden" name="anmelden"
																		class="btn btn-Info" value="등록">
									                        			
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