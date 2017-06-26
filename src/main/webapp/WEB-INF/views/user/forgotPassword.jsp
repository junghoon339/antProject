<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="refresh"
	content="${pageContext.session.maxInactiveInterval}">
<security:csrfMetaTags />
<title>개미와 베짱이, 대학조별과제 관리시스템</title>

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
	<div class="main"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/Peg Gnomes 010.JPG')">

		<div class="container" style="opacity: 0.95; filter: alpha(opacity=95);">
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
										<a href="#" class="active" id="login-form-link">비밀번호 찾기</a>
									</div>
								</div>
								<hr>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form id="login-form"
											action="${pageContext.request.contextPath}/user/sendEmail"
											method="post" role="form" style="display: block;">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}">
											<div class="form-group">
												<input type="text" name="emailAddr" id="emailAddr"
													class="form-control" placeholder="이메일 주소" value="">
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
															class="form-control btn btn-login" value="메일 보내기">
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-lg-12">
														<div class="text-center">
															<a href="${pageContext.request.contextPath}/"
																class="forgot-password" style="text-decoration: none">로그인 하기</a>
														</div>
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
