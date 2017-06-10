<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="${pageContext.request.contextPath}/resources/storage/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/storage/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="${pageContext.request.contextPath}/resources/storage/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="${pageContext.request.contextPath}/resources/storage/css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
	

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

<body>
		<!-- start: Header -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="index.html"><span>개미와 배짱이</span></a>
								
				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right">
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-bell"></i>
								<span class="badge red">
								7 </span>
							</a>
							<ul class="dropdown-menu notifications">
								<li class="dropdown-menu-title">
 									<span>You have 11 notifications</span>
									<a href="#refresh"><i class="icon-repeat"></i></a>
								</li>	
                            	<li>
                                    <a href="#">
										<span class="icon blue"><i class="icon-user"></i></span>
										<span class="message">New user registration</span>
										<span class="time">1 min</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="icon green"><i class="icon-comment-alt"></i></span>
										<span class="message">New comment</span>
										<span class="time">7 min</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="icon green"><i class="icon-comment-alt"></i></span>
										<span class="message">New comment</span>
										<span class="time">8 min</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="icon green"><i class="icon-comment-alt"></i></span>
										<span class="message">New comment</span>
										<span class="time">16 min</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="icon blue"><i class="icon-user"></i></span>
										<span class="message">New user registration</span>
										<span class="time">36 min</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="icon yellow"><i class="icon-shopping-cart"></i></span>
										<span class="message">2 items sold</span>
										<span class="time">1 hour</span> 
                                    </a>
                                </li>
								<li class="warning">
                                    <a href="#">
										<span class="icon red"><i class="icon-user"></i></span>
										<span class="message">User deleted account</span>
										<span class="time">2 hour</span> 
                                    </a>
                                </li>
								<li class="warning">
                                    <a href="#">
										<span class="icon red"><i class="icon-shopping-cart"></i></span>
										<span class="message">New comment</span>
										<span class="time">6 hour</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="icon green"><i class="icon-comment-alt"></i></span>
										<span class="message">New comment</span>
										<span class="time">yesterday</span> 
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="icon blue"><i class="icon-user"></i></span>
										<span class="message">New user registration</span>
										<span class="time">yesterday</span> 
                                    </a>
                                </li>
                                <li class="dropdown-menu-sub-footer">
                            		<a>View all notifications</a>
								</li>	
							</ul>
						</li>
						<!-- start: Notifications Dropdown -->
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-calendar"></i>
								<span class="badge red">
								5 </span>
							</a>
							<ul class="dropdown-menu tasks">
								<li class="dropdown-menu-title">
 									<span>You have 17 tasks in progress</span>
									<a href="#refresh"><i class="icon-repeat"></i></a>
								</li>
								<li>
                                    <a href="#">
										<span class="header">
											<span class="title">iOS Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim red">80</div> 
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="header">
											<span class="title">Android Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim green">47</div> 
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="header">
											<span class="title">ARM Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim yellow">32</div> 
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="header">
											<span class="title">ARM Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim greenLight">63</div> 
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="header">
											<span class="title">ARM Development</span>
											<span class="percent"></span>
										</span>
                                        <div class="taskProgress progressSlim orange">80</div> 
                                    </a>
                                </li>
								<li>
                            		<a class="dropdown-menu-sub-footer">View all tasks</a>
								</li>	
							</ul>
						</li>
						<!-- end: Notifications Dropdown -->
						<!-- start: Message Dropdown -->
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-envelope"></i>
								<span class="badge red">
								4 </span>
							</a>
							<ul class="dropdown-menu messages">
								<li class="dropdown-menu-title">
 									<span>You have 9 messages</span>
									<a href="#refresh"><i class="icon-repeat"></i></a>
								</li>	
                            	<li>
                                    <a href="#">
										<span class="avatar"><img src="${pageContext.request.contextPath}/resources/storage/img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	6 min
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>  
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="avatar"><img src="${pageContext.request.contextPath}/resources/storage/img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	56 min
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>  
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="avatar"><img src="${pageContext.request.contextPath}/resources/storage/img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	3 hours
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>  
                                    </a>
                                </li>
								<li>
                                    <a href="#">
										<span class="avatar"><img src="${pageContext.request.contextPath}/resources/storage/img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	yesterday
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>  
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
										<span class="avatar"><img src="${pageContext.request.contextPath}/resources/storage/img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	Jul 25, 2012
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>  
                                    </a>
                                </li>
								<li>
                            		<a class="dropdown-menu-sub-footer">View all messages</a>
								</li>	
							</ul>
						</li>
						
						<!-- start: User Dropdown -->
						<li class="dropdown">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="halflings-icon white user"></i> Dennis Ji
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li class="dropdown-menu-title">
 									<span>Account Settings</span>
								</li>
								<li><a href="#"><i class="halflings-icon user"></i> Profile</a></li>
								<li><a href="login.html"><i class="halflings-icon off"></i> Logout</a></li>
							</ul>
						</li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->
				
			</div>
		</div>
	</div>
	<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a href="index.html"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>	
						<li><a href="messages.html"><i class="icon-envelope"></i><span class="hidden-tablet"> Messages</span></a></li>
						<li><a href="tasks.html"><i class="icon-tasks"></i><span class="hidden-tablet"> Tasks</span></a></li>
						<li><a href="ui.html"><i class="icon-eye-open"></i><span class="hidden-tablet"> UI Features</span></a></li>
						<li><a href="widgets.html"><i class="icon-dashboard"></i><span class="hidden-tablet"> Widgets</span></a></li>
						<li>
							<a class="dropmenu" href="#"><i class="icon-folder-close-alt"></i><span class="hidden-tablet"> Dropdown</span><span class="label label-important"> 3 </span></a>
							<ul>
								<li><a class="submenu" href="submenu.html"><i class="icon-file-alt"></i><span class="hidden-tablet"> Sub Menu 1</span></a></li>
								<li><a class="submenu" href="submenu2.html"><i class="icon-file-alt"></i><span class="hidden-tablet"> Sub Menu 2</span></a></li>
								<li><a class="submenu" href="submenu3.html"><i class="icon-file-alt"></i><span class="hidden-tablet"> Sub Menu 3</span></a></li>
							</ul>	
						</li>
						<li><a href="form.html"><i class="icon-edit"></i><span class="hidden-tablet"> Forms</span></a></li>
						<li><a href="chart.html"><i class="icon-list-alt"></i><span class="hidden-tablet"> Charts</span></a></li>
						<li><a href="typography.html"><i class="icon-font"></i><span class="hidden-tablet"> Typography</span></a></li>
						<li><a href="gallery.html"><i class="icon-picture"></i><span class="hidden-tablet"> Gallery</span></a></li>
						<li><a href="/storage/table"><i class="icon-align-justify"></i><span class="hidden-tablet"> ìë£ì¤</span></a></li>
						<li><a href="calendar.html"><i class="icon-calendar"></i><span class="hidden-tablet"> Calendar</span></a></li>
						<li><a href="file-manager.html"><i class="icon-folder-open"></i><span class="hidden-tablet"> File Manager</span></a></li>
						<li><a href="icon.html"><i class="icon-star"></i><span class="hidden-tablet"> Icons</span></a></li>
						<li><a href="login.html"><i class="icon-lock"></i><span class="hidden-tablet"> Login Page</span></a></li>
					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			<!-- start: Content -->
			<div id="content" class="span10">
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.html">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">Tables</a></li>
			</ul>
<!-- 여기 테이블 들어가야됨!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11 -->

<div class="content">
	<div class="container">			
		

		<div class="row" >
			<div class="col-md-6 margin-bottom-30" >
				<!-- BEGIN Portlet PORTLET-->
				<div class="portlet portlet-bordered" style="width:900px ; height:340px; transform:translate(10%, 6%)" >
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
							<a href="#">
								asdfasfd${dto.fileName}
							</a>
						</c:if>
							<a href="javascript:;" class="btn btn-red btn-circle">
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
<br>
<br>
				<!-- 여기까지!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~` -->
	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">Ã</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	<div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<ul class="list-inline item-details">
				<li><a href="http://themifycloud.com">Admin templates</a></li>
				<li><a href="http://themescloud.org">Bootstrap themes</a></li>
			</ul>
		</div>
	</div>
	<div class="clearfix"></div>
	
	<footer>

		<p>
			<span style="text-align:left;float:left">&copy; 2013 <a href="http://themifycloud.com/downloads/janux-free-responsive-admin-dashboard-template/" alt="Bootstrap_Metro_Dashboard">JANUX Responsive Dashboard</a></span>
			
		</p>

	</footer>
	
	<!-- start: JavaScript-->

		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery-1.9.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/storage/js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.ui.touch-punch.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/modernizr.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/bootstrap.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.cookie.js"></script>
	
		<script src='${pageContext.request.contextPath}/resources/storage/js/fullcalendar.min.js'></script>
	
		<script src='${pageContext.request.contextPath}/resources/storage/js/jquery.dataTables.min.js'></script>

		<script src="${pageContext.request.contextPath}/resources/storage/js/excanvas.js"></script>
	<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.flot.stack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.flot.resize.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.chosen.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.uniform.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.cleditor.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.noty.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.elfinder.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.raty.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.iphone.toggle.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.gritter.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.imagesloaded.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.masonry.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.knob.modified.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/jquery.sparkline.min.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/counter.js"></script>
	
		<script src="${pageContext.request.contextPath}/resources/storage/js/retina.js"></script>

		<script src="${pageContext.request.contextPath}/resources/storage/js/custom.js"></script>
	<!-- end: JavaScript-->
	
</body>
</html>
