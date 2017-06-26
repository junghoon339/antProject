<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>개미와 베짱이, 대학조별과제 관리시스템</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="css/ie.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="css/ie9.css" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<!-- end: Favicon -->
	
		<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/sidebar.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	/***
Bootstrap Line Tabs by @keenthemes
A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
Licensed under MIT
***/

.content {
	padding: 30px;
	background: #f1f3fa;
}

.margin-bottom-30 {
	margin-bottom: 30px;
}

/* Portlet */
.portlet {
	background: #fff;
	padding: 20px;
}

.portlet.portlet-gray {
	background: #f7f7f7;
}

.portlet.portlet-bordered {
	border: 1px solid #eee;
}

/* Portlet Title */
.portlet-title {
	padding: 0;
  	min-height: 40px;
  	border-bottom: 1px solid #eee;
  	margin-bottom: 18px;
}

.caption {
	float: left;
	display: inline-block;
	font-size: 18px;
	line-height: 18px;
}

.caption.caption-green .caption-subject,
.caption.caption-green i {
	color: #4db3a2;
	font-weight: 200;
}

.caption.caption-red .caption-subject,
.caption.caption-red i {
	color: #e26a6a;
	font-weight: 200;
}

.caption.caption-purple .caption-subject,
.caption.caption-purple i {
	color: #8775a7;
	font-weight: 400;
}

.caption i {
	color: #777;
	font-size: 15px;
	font-weight: 300;
	margin-top: 3px;
}

.caption-subject {
	color: #666;
	font-size: 16px;
	font-weight: 600;
}

.caption-helper {
	padding: 0;
	margin: 0;
	line-height: 13px;
	color: #9eacb4;
	font-size: 13px;
	font-weight: 400;
}

/* Actions */
.actions {
	float: right;
  	display: inline-block;
}

.actions a {
	margin-left: 3px;
}

.actions .btn {
	color: #666;
	padding: 3px 9px;
	font-size: 13px;
  	line-height: 1.5;
  	background-color: #fff;
  	border-color: #ccc;
  	border-radius: 50px;
}

.actions .btn i {
	font-size: 12px;
}

.actions .btn:hover {
	background: #f2f2f2;
}

/* Pagination */
.pagination {
	margin: -3px 0 0;
	border-radius: 50px;
}

.pagination > li > a,
.pagination > li > span {
	padding: 4px 10px;
	font-size: 12px;
	color: #8775a7;
	background: #f7f7f7;
}

.pagination > li:hover > a,
.pagination > li.active > a,
.pagination > li.active:hover > a {
	color: #fff;
	background: #8775a7;
	border-color: #8775a7;
}

/* Inputs */
.inputs {
	float: right;
	display: inline-block;
	padding: 4px 0;
	margin-top: -10px;
}

.input-inline {
	width: 240px;
	display: inline-block;
	vertical-align: middle;
}

/* Tab */
.portlet-title > .nav-tabs {
	background: none;
	margin: 0;
	float: right;
	display: inline-block;
	border: 0;
}

.portlet-title > .nav-tabs > li {
	background: none;
	margin: 0;
	border: 0;
}

.portlet-title > .nav-tabs > li > a {
	background: none;
	border: 0;
	padding: 2px 10px 13px;
	color: #444;
}

.portlet-title > .nav-tabs > li.active,
.portlet-title > .nav-tabs > li.active:hover {
  	border-bottom: 4px solid #f3565d;
  	position: relative;
  }

  .portlet-title > .nav-tabs > li:hover {
  	border-bottom: 4px solid #f29b9f;
  }

.portlet-title > .nav-tabs > li.active > a,
.portlet-title > .nav-tabs > li:hover > a {
	color: #333;
	background: #fff;
	border: 0;
}

/* Btn Circle */
.actions .btn.btn-circle {
	width: 28px;
	height: 28px;
	padding: 3px 7px;
	text-align: center;
}

.actions .btn.btn-circle i {
	font-size: 11px;
}

/* Btn Grey Salsa */
.actions .btn.grey-salsa {
	border: none;
	margin-left: 3px;
	box-shadow: none;
	border-radius: 50px !important;
}

.actions .btn.grey-salsa.active {
	color: #fafcfb;
	background: #8e9bae;
}
  .actions .grey-salsa.btn:hover,
  .actions .grey-salsa.btn:focus,
  .actions .grey-salsa.btn:active,
  .actions .grey-salsa.btn.active {
	color: #fafcfb;
	background: #97a3b4;
}

/* Btn Red */
.actions .btn.btn-red.active,
.actions .btn.btn-red:hover {
	color: #fff;
	box-shadow: none;
	background: #e26a6a;
	border-color: #e26a6a;
}

/* Btn Red */
.actions .btn.btn-purple.active,
.actions .btn.btn-purple:hover {
	color: #fff;
	box-shadow: none;
	background: #8775a7;
	border-color: #8775a7;
}
	</style>
</head>
<script type="text/javascript">
	function submitHidden() {
		$("#submitForm").attr("action","${pageContext.request.contextPath}/storage/updateForm");
		$("#submitForm").submit();
	}
</script>
<body>
<header> <jsp:include page="/WEB-INF/views/project/header.jsp"
		flush="false" /> </header>
	<jsp:include page="/WEB-INF/views/project/sidebar.jsp" />
	<div id="burger"></div>
<!-- 여기 테이블 들어가야됨!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11 -->

<div class="content">
	<div class="container">			 
		

		<div class="row" >
			<div class="col-md-6 margin-bottom-30" >
				<!-- BEGIN Portlet PORTLET-->
				<div class="portlet portlet-bordered" style="width:900px ; height:340px; transform:translate(18%, 6%)" >
					<div class="portlet-title">
						<div class="caption caption-red">
							제목 - 
							<span class="caption-subject text-uppercase"> ${dto.storageTitle}</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="caption-helper">작성일 - ${dto.writeDay}</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="caption-helper">작성자 - ${dto.userDTO.userName}</span>
						</div>
						<div class="actions">
						<c:if test="${dto.fileName!=null}">
							<a href="javascript:;">
								<i class="glyphicon glyphicon-paperclip"></i>
							</a>
							<a href="${pageContext.request.contextPath}/storage/download?fileName=${dto.fileName}">
								${dto.fileName}
							</a>
							
						</c:if>
							<form id="submitForm" method="post" action="">
								<input type="hidden" id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							
								<input type="hidden" name="userNO" value="${dto.userDTO.userNo}">
								<input type="hidden" name="userName" value="${dto.userDTO.userName}">
								<input type="hidden" name="storageTitle" value="${dto.storageTitle}">
								<input type="hidden" name="storageNo" value="${dto.storageNo}">
								<input type="hidden" name="storageContent" value="${dto.storageContent}">
							</form>
						
							<a href="#" class="btn btn-red btn-circle" onclick="submitHidden()">
								<i class="glyphicon glyphicon-pencil"></i>
							</a>
							
							<a href="${pageContext.request.contextPath}/storage/delete/${dto.storageNo}/${dto.userNo}/${dto.projectNo}" class="btn btn-red btn-circle active" class="btn btn-red btn-circle">
								<i class="glyphicon glyphicon-trash"></i>
							</a>
				
						</div>
					</div>
					<div class="portlet-body">
						<h4>${dto.storageContent}</h4>
					</div>
					
					
				</div>
				<!-- END Portlet PORTLET-->
				<hr>
			</div>
				
			<hr>
		</div>
			
	</div>
</div>

<br>
<br>
<center>
<strong>자료실 <a href="${pageContext.request.contextPath}/storage/storageTable/1">리스트로 돌아가기</a></strong>
</center>
<footer> <jsp:include page="/WEB-INF/views/project/footer.jsp"
		flush="false" /> </footer>

</body>
</html>