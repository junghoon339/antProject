<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<title>Time Lapse</title>

<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/coming-sssoon.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" />

<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>
</head>

<body>
	<nav class="navbar navbar-transparent navbar-fixed-top"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<!-- <ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <img src="images/flags/US.png" />
							English(US) <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#"><img src="images/flags/DE.png" />
									Deutsch</a></li>
							<li><a href="#"><img src="images/flags/GB.png" />
									English(UK)</a></li>
							<li><a href="#"><img src="images/flags/FR.png" />
									FranÃ§ais</a></li>
							<li><a href="#"><img src="images/flags/RO.png" />
									RomÃ¢nÄ</a></li>
							<li><a href="#"><img src="images/flags/IT.png" />
									Italiano</a></li>

							<li class="divider"></li>
							<li><a href="#"><img src="images/flags/ES.png" />
									EspaÃ±ol <span class="label label-default">soon</span></a></li>
							<li><a href="#"><img src="images/flags/BR.png" />
									PortuguÃªs <span class="label label-default">soon</span></a></li>
							<li><a href="#"><img src="images/flags/JP.png" /> æ¥æ¬èª <span
									class="label label-default">soon</span></a></li>
							<li><a href="#"><img src="images/flags/TR.png" />
									TÃ¼rkÃ§e <span class="label label-default">soon</span></a></li>

						</ul></li>

				</ul> -->
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"> <i class="fa fa-facebook-square"></i>
							Like
					</a></li>
					<li><a href="#"> <i class="fa fa-google-plus-square"></i>
							Plus
					</a></li>
					<li><a href="#"> <i class="fa fa-pinterest"></i> Pin
					</a></li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<div class="main" style="background-image: url('${pageContext.request.contextPath}/resources/images/video_bg.jpg')">
		<video id="video_background" preload="auto" autoplay="true"
			loop="loop" muted="muted" volume="0">
			<source src="${pageContext.request.contextPath}/resources/video/time.webm" type="video/webm">
			<source src="${pageContext.request.contextPath}/resources/video/time.mp4" type="video/mp4">
			Video not supported
		</video>
		<!--    Change the image source '/images/video_bg.jpg')" with your favourite image.     -->

<!-- 		<div class="cover black" data-color="black"></div>
 -->
		<!--   You can change the black color for the filter with those colors: blue, green, red, orange       -->

		<div class="container">
			<h1 class="logo cursive">The Ants and Grasshopper</h1>
			<!--  H1 can have 2 designs: "logo" and "logo cursive"           -->
			<br><br>
			<div class="content">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<div class="panel panel-login">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-6">
											<a href="#" class="active" id="login-form-link">Login</a>
										</div>
										<div class="col-xs-6">
											<a href="#" id="register-form-link">Register</a>
										</div>
									</div>
									<hr>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-12">
											<form id="login-form"
												action="${pageContext.request.contextPath}/login" method="post"
												role="form" style="display: block;">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
												<div class="form-group">
													<input type="text" name="userId" id="userId"
														tabindex="1" class="form-control" placeholder="Email Address"
														value="">
												</div>
												<div class="form-group">
													<input type="password" name="userPassword" id="userPassword"
														tabindex="2" class="form-control" placeholder="Password">
												</div>
												<div class="form-group text-center">
													<input type="checkbox" tabindex="3" class=""
														name="remember" id="remember"> <label
														for="remember"> Remember Me</label>
												</div>
												<div class="form-group">
													<div class="row">
														<div class="col-sm-6 col-sm-offset-3">
															<input type="submit" name="login-submit"
																id="login-submit" tabindex="4"
																class="form-control btn btn-login" value="Log In">
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="row">
														<div class="col-lg-12">
															<div class="text-center">
																<a href="https://phpoll.com/recover" tabindex="5"
																	class="forgot-password">Forgot Password?</a>
															</div>
														</div>
													</div>
												</div>
											</form>
											<form id="register-form"
												action="${pageContext.request.contextPath}/user/join" method="post"
												role="form" style="display: none;">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
												<div class="form-group">
													<input type="email" name="userId" id="email" tabindex="1"
														class="form-control" placeholder="Email Address" value="">
												</div>
												<div class="form-group">
													<input type="password" name="userPassword" id="password"
														tabindex="2" class="form-control" placeholder="Password">
												</div>
												<div class="form-group">
													<input type="password" name="confirmPassword"
														id="confirm-password" tabindex="2" class="form-control"
														placeholder="Confirm Password">
												</div>
												<div class="form-group">
													<input type="text" name="userName" id="username"
														tabindex="1" class="form-control" placeholder="Username"
														value="">
												</div>
												<div class="form-group">
													<input type="text" name="userSchool" id="school"
														tabindex="1" class="form-control" placeholder="University"
														value="">
												</div>
												<div class="form-group">
													<input type="text" name="userMajor" id="major"
														tabindex="1" class="form-control" placeholder="Major"
														value="">
												</div>
												<div class="form-group">
													<div class="row">
														<div class="col-sm-6 col-sm-offset-3">
															<input type="submit" name="register-submit"
																id="register-submit" tabindex="4"
																class="form-control btn btn-register"
																value="Register Now">
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				<!-- <div class="subscribe">
					<h5 class="info-text">Join the waiting list for the beta. We
						keep you posted.</h5>
					<div class="row">
						<div class="col-md-4 col-md-offset-4 col-sm6-6 col-sm-offset-3 ">
							<form class="form-inline" role="form">
								<div class="form-group">
									<label class="sr-only" for="exampleInputEmail2">Email
										address</label> <input type="email" class="form-control transparent"
										placeholder="Your email here...">
								</div>
								<button type="submit" class="btn btn-warning btn-fill">Notify
									Me</button>
							</form>

						</div>
					</div>
				</div> -->
			</div>
		</div>
		<div class="footer">
			<div class="container">
				Made with <i class="fa fa-heart heart"></i> by <a
					href="http://www.creative-tim.com">Creative Tim</a>. Free download
				<a href="http://www.creative-tim.com/product/coming-sssoon-page">here.</a>
			</div>
			
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script>
		$(function() {
			$('#login-form-link').click(function(e) {
				$("#login-form").delay(100).fadeIn(100);
				$("#register-form").fadeOut(100);
				$('#register-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});
			$('#register-form-link').click(function(e) {
				$("#register-form").delay(100).fadeIn(100);
				$("#login-form").fadeOut(100);
				$('#login-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});

		});
	</script>
</body>
</html>
