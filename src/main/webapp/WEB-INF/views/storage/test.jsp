<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/sidebar.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>


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

/* insert form */

/* insert form */
</style>
</head>
<body>
	<header> <jsp:include page="/WEB-INF/views/project/header.jsp"
		flush="false" /> </header>
	<jsp:include page="/WEB-INF/views/project/sidebar.jsp" />
	<div id="burger"></div>

	<section>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">

				<h1>자료실</h1>
				<a class="btn btn-danger" href="#danger" data-toggle="modal"><h4>글쓰기</h4></a>

				<!-- Modal -->
				<div class="modal fade" id="danger" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header modal-header-danger">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h1>
									<i class="glyphicon glyphicon-thumbs-up"></i> 자료등록
								</h1>
							</div>
							<div class="modal-body">
								<!-- 인설트 폼 -->
								
								<form class="form-horizontal"
									action="${pageContext.request.contextPath}/storage/insert"
									method="post" enctype="multipart/form-data">
									
									<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<input type="hidden" name ="userNo" value="1">
									
									<fieldset>

										<!-- Form Name -->
										<legend>자료를 등록하세요!</legend>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-md-4 control-label" for="name"
												style="text-align: right;">제목</label>
											<div class="col-md-4">
												<input id="name" name="storageTitle" type="text"
													placeholder="제목을 입력하세요" class="form-control input-md"
													required="">
													
											</div>
										</div>


										<!-- Textarea -->
										<div class="form-group">
											<label class="col-md-4 control-label" for="anschrift">내용</label>
											<div class="col-md-4">
												<textarea class="form-control" id="anschrift"
													name="storageContent" style="width: 300px; height: 150px"
													placeholder="내용을 입력하세요"></textarea>
											</div>
										</div>



										<div class="input-group">
											<span class="input-group-btn">
												<button id="fake-file-button-browse" type="button"
													class="btn btn-default">
													<span class="glyphicon glyphicon-file"></span>
												</button>
											</span> <input type="file" id="files-input-upload"
												style="display: none" name="file"> <input type="text"
												id="fake-file-input-name" disabled="disabled"
												placeholder="File not selected" class="form-control" name="filePath">
											<span class="input-group-btn">
												<button type="button" class="btn btn-default"
													disabled="disabled" id="fake-file-button-upload">
													<span class="glyphicon glyphicon-upload"></span>
												</button>
											</span>
										</div>
										<small class="pull-right">파일을 등록하세요</small>
										<!-- Button (Double) -->
										<div class="form-group">
											<label class="col-md-4 control-label" for="anmelden"></label>
											<div class="col-md-8">
												<input type="submit" id="anmelden" name="anmelden"
													class="btn btn-success" value="등록">
											</div>
										</div>
									</fieldset>
								</form>
								
							</div>
							<!-- 인설트 폼 -->
							<script type="text/javascript">
								// Fake file upload
								document.getElementById('fake-file-button-browse').addEventListener('click', function() {
									document.getElementById('files-input-upload').click();
								});
								
								document.getElementById('files-input-upload').addEventListener('change', function() {
									document.getElementById('fake-file-input-name').value = this.value;
									
									document.getElementById('fake-file-button-upload').removeAttribute('disabled');
								});
							</script>
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!-- Modal -->
				<div class="table-responsive">


					<table id="mytable" class="table table-bordred table-striped">

						<thead>

							<th>글 번호</th>
							<th>이름</th>
							<th>제목</th>
							<th>등록 날짜</th>
							<th>첨부파일</th>


							<th style="width: 60px;">조회수</th>
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
											<td class="center"><span class="label label-warning">파일이
													없습니다.</span></td>
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

					<div class="clearfix"></div>
					<ul class="pagination pull-right">
						<li class="disabled"><a href="#"><span
								class="glyphicon glyphicon-chevron-left"></span></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-chevron-right"></span></a></li>
					</ul>

				</div>

			</div>
		</div>
	</div>


	</section>

	<footer> <jsp:include page="/WEB-INF/views/project/footer.jsp"
		flush="false" /> </footer>

</body>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</html>