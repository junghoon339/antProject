<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval}">
<security:csrfMetaTags />
<title>Time Lapse</title>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/coming-sssoon.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/login.css"
	rel="stylesheet" />

<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>
</head>

<body>
<!-- 	<nav class="navbar navbar-transparent navbar-fixed-top"
		role="navigation">
		<div class="container">
			Brand and toggle get grouped for better mobile display
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			Collect the nav links, forms, and other content for toggling
						<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
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
									Fran�짠ais</a></li>
							<li><a href="#"><img src="images/flags/RO.png" />
									Rom�짖n��</a></li>
							<li><a href="#"><img src="images/flags/IT.png" />
									Italiano</a></li>

							<li class="divider"></li>
							<li><a href="#"><img src="images/flags/ES.png" />
									Espa�짹ol <span class="label label-default">soon</span></a></li>
							<li><a href="#"><img src="images/flags/BR.png" />
									Portugu�짧s <span class="label label-default">soon</span></a></li>
							<li><a href="#"><img src="images/flags/JP.png" /> 챈�짜챈�짭챔짧� <span
									class="label label-default">soon</span></a></li>
							<li><a href="#"><img src="images/flags/TR.png" />
									T�쩌rk�짠e <span class="label label-default">soon</span></a></li>

						</ul></li>

				</ul>
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
			/.navbar-collapse
		</div>
		/.container
	</nav> -->

	<div class="main"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/video_bg.jpg')">
		<%-- <video id="video_background" preload="auto" autoplay="true"
			loop="loop" muted="muted" volume="0">
			<source
				src="${pageContext.request.contextPath}/resources/video/time.webm"
				type="video/webm">
			<source
				src="${pageContext.request.contextPath}/resources/video/time.mp4"
				type="video/mp4">
			Video not supported
		</video> --%>
		<!--    Change the image source '/images/video_bg.jpg')" with your favourite image.     -->

		<!-- 		<div class="cover black" data-color="black"></div>
 -->
		<!--   You can change the black color for the filter with those colors: blue, green, red, orange       -->

		<div class="container">
			<h1 class="logo">The Ants and Grasshopper</h1>
			<!--  H1 can have 2 designs: "logo" and "logo cursive"           -->
			<br>
			<div class="content">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="panel panel-login">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-6">
										<a href="#" class="active" id="login-form-link">로그인</a>
									</div>
									<div class="col-xs-6">
										<a href="#" id="register-form-link">회원가입</a>
									</div>
								</div>
								<hr>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form id="login-form"
											action="${pageContext.request.contextPath}/login"
											method="post" role="form" style="display: block;">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}">
											<div class="form-group">
												<input type="text" name="userId" id="userId"
													class="form-control" placeholder="Email Address" value="">
											</div>
											<div class="form-group">
												<input type="password" name="userPassword" id="userPassword"
													class="form-control" placeholder="Password">
											</div>
											<div class="form-group text-center">
												<!-- <input type="checkbox"  class=""
														name="remember" id="remember"> -->
												<label style="color: red">${errorMessage}</label>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="submit" name="login-submit" id="login-submit"
															class="form-control btn btn-login" value="로그인">
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-lg-12">
														<div class="text-center">
															<a href="${pageContext.request.contextPath}/user/forgotPassword"
																class="forgot-password">비밀번호 찾기</a>
														</div>
													</div>
												</div>
											</div>
										</form>
										<form id="register-form"
											action="${pageContext.request.contextPath}/user/join"
											method="post" role="form" style="display: none;">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}">
											<div class="form-group">
												<input type="email" name="userId" id="email"
													class="form-control" placeholder="이메일 주소" value="">
											</div>
											<div class="form-group">
												<input type="password" name="userPassword" id="password"
													class="form-control" placeholder="비밀번호">
											</div>
											<div class="form-group">
												<input type="password" name="confirmPassword"
													id="confirm-password" class="form-control"
													placeholder="비밀번호 확인">
											</div>
											<div class="form-group">
												<input type="text" name="userName" id="username"
													class="form-control" placeholder="이름" value="">
											</div>
											<div class="form-group">
												<input type="text" name="userSchool" id="school"
													class="form-control" placeholder="대학교" value="">
													<div id="suggestion-box"></div>
											</div>
											<div class="form-group">
												<input type="text" name="userMajor" id="major"
													class="form-control" placeholder="전공" value="">
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-6 col-sm-offset-3">
														<input type="submit" name="register-submit"
															id="register-submit"
															class="form-control btn btn-register" value="회원가입">
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
				<h6>
					<i class="fa fa-heart heart"></i> Made by 개미와 베짱이팀.
				</h6>
			</div>

		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"
		type="text/javascript"></script>
	<script>
		var header = $("meta[name='_csrf_header']").attr("content");
		var token = $("meta[name='_csrf']").attr("content");

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

			
			$("#email").keyup(function() {
				var emailForm = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
				if (emailForm.test($(this).val())){
					$.ajax({
						url : '${pageContext.request.contextPath}/user/idCheck',
						type : 'POST',
						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						data : 'userId=' + $(this).val(),
						dataType : 'text',
						success : function(result) {
							if (result == 0) {
								// 체크버튼을 띄워준다
								$("#email").val( $("#email").val()+"VVV" )
								console.log("사용가능한 이메일")	
							} else {
								console.log("이미 존재하는 이메일입니다")
							}
						}
					});
				} else {
					console.log("이메일 형식만 가능")
				}
				
			}); // email

			$("#confirm-password").keyup(function() {
				if ($("#password").val() != $(this).val()) {
					console.log("비밀번호 달라~")
				} else
					console.log("비밀번호 같아~")
			});

			$("#password").keyup(function(){
				if (!chkPwd($.trim($('#password').val()))) {
					console.log('비밀번호를 확인하세요.₩n(영문,숫자를 혼합하여 6~20자 이내)');
					// $('#password').val('');
					// $('#password').focus();
				}
				else {
					console.log("사용가능~~")
				}
			})
			
			$("#username").keyup(function(){
				var kor = /^[가-힣]+$/;
				var eng = /^[a-zA-Z]+$/;
				var text = $(this).val();
				if(!kor.test(text) && !eng.test(text)){
					console.log("한글과 영문만 입력 가능")
					return false;
				}
				console.log("이름 사용 가능")
				return true;
			})
			
/* 			$("#school").autocomplete({
				source : function (request, response){
					$.ajax({
						type: 'post',
						url : '${pageContext.request.contextPath}/user/schoolCheck',
						data : 'school='+$("#school").val(),
						dataType : 'json',
						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						success : function(data) {
							if ($("#school").val() == "") {
								$("#suggestion-box").hide();
								return;
							}

							$("#suggestion-box").show();
							$("#suggestion-box").html(data);
							$("#school").css("background", "#FFF");
						}
					})
				}
			}) */
			
			$("#major").keyup(function(){
				
			})
			
			function chkPwd(str) {
				var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
				if (!reg_pwd.test(str)) {
					return false;
				}
				return true;
			}			
		});

	</script>
</body>
</html>
