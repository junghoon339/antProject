<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개미와 베짱이, 대학조별과제 관리시스템</title>
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
	
	/* 검색 */
	$(document).ready(function(e){
    $('.search-panel .dropdown-menu').find('a').click(function(e) {
		e.preventDefault();
		var param = $(this).attr("href").replace("#","");
		var concept = $(this).text();
		$('.search-panel span#search_concept').text(concept);
		$('.input-group #search_param').val(param);
	});
});
	/* 검색 */
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
<script type="text/javascript">
	$(function(){
		$("#submitBt").click(function(){
				location.href = "${pageContext.request.contextPath}/storage/storageTable/1?searchText="+$("#searchText").val()+"&categoryNo="+$("#category").val();
		})
		
		if($("#name").val()==null){
			alert("제목을 입력해주세요");
		}
	})
			
</script>
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
				  <div class="col-sm-6"><h1>공지사항</h1></div>
				 <div class="col-sm-6" align="right"><a class="btn btn-danger" href="#danger" data-toggle="modal" ><h4>글쓰기</h4></a></div>
				
				
				
				<!-- 검색 -->
					<div class="container" style="width:910px;">
					    <div class="row">    
					        <div class="col-xs-8 col-xs-offset-2" >
							    <div class="input-group">
					                <div class="input-group-btn search-panel">
					                    <!-- <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					                    	<span id="search_concept">검색 옵션</span> <span class="caret"></span>
					                    </button>
					                    <ul class="dropdown-menu" role="menu">
					                      <li><a href="#contains" id="searchByName">이름</a></li>
					                      <li><a href="#its_equal" id="searchByTitle">제목</a></li>
					                    </ul> -->
					                    <select class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="width:80px" id="category">
									        <option value="1">제목</option>
						    			</select>
					                </div>
					                <input type="hidden" name="search_param" value="all" id="search_param">         
					                <input type="text" class="form-control" name="x" placeholder="검색어를 입력하세요." id="searchText">
					                <span class="input-group-btn">
					                    <button class="btn btn-default" type="button" id="submitBt"><span class="glyphicon glyphicon-search"></span></button>
					                </span>
					            </div>
					        </div>
						</div>
					</div>
							<!-- 검색 -->
							
							
							
							

				<!-- Modal -->
				<div class="modal fade" id="danger" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header modal-header-danger">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h1>
									<i class="glyphicon glyphicon-thumbs-up"></i> 공지등록
								</h1>
							</div>
							
							
							
							
							
							
							<!-- 인설트 폼 -->
							<div class="modal-body">
								<form class="form-horizontal"
									action="${pageContext.request.contextPath}/admin/noticeInsert"
									method="post" enctype="multipart/form-data">
									
									<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<input type="hidden" name ="userNo" value="1">
									
									<fieldset>

										<!-- Form Name -->
										<legend>공지를 등록하세요!</legend>

										<!-- Text input-->
										<div class="form-group">
											<label class="col-md-4 control-label" for="name"
												style="text-align: right; width:63px" >제목</label>
											<div class="col-md-4">
												<input id="name" name="noticeTitle" type="text"
													placeholder="제목을 입력하세요" class="form-control input-md"
													style="width:465px">
													
											</div>
										</div>


										<!-- Textarea -->
										<div class="form-group">
											<label class="col-md-4 control-label" for="anschrift" style="width:63px">내용</label>
											<div class="col-md-4">
												<textarea class="form-control" id="anschrift"
													name="noticeContent" style="width: 465px; height: 150px"
													placeholder="내용을 입력하세요"></textarea>
											</div>
										</div>
										
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
							<th>제목</th>
							<th>등록 날짜</th>
							<th style="width: 60px;">조회수</th>
							
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}">
								<tr>
									<td>${item.noticeNo}</td>
									<td><a
										href="#">${item.noticeTitle}</a></td>
									<td>${item.writeDay}</td>
									<td>${item.readNum}</td>

								</tr>
							</c:forEach>

						</tbody>

					</table>
					
					
					
					
					<!-- paging~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~` -->
					<div class="clearfix" style="text-align: center" align="center">
					<ul class="pagination pull-right" style="margin-right:30%">

						<c:choose>
							<c:when test="${startPage==1}">
								<li class="disabled"><a href="#"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/admin/adminNotice?pageNumber=${endPage-pageSu}"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
							</c:otherwise>
						</c:choose>	
						
						<c:forEach begin="${startPage}" end="${endPage}" var="pageNum" step="1">
							<li><a href="${pageContext.request.contextPath}/admin/adminNotice?pageNumber=${pageNum}">${pageNum}</a></li>
						</c:forEach>
						
						<c:choose>
								<c:when test="${flag==true}">
									<li class="disabled"><a href="#"><span
										class="glyphicon glyphicon-chevron-right"></span></a></li>
								</c:when>
								<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/admin/adminNotice?pageNumber=${startPage+pageSu}"><span
										class="glyphicon glyphicon-chevron-right"></span></a></li>
								</c:otherwise>
						</c:choose>
						
					</ul>
				</div>
				
					<!-- paging~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~` -->
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