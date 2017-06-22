<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<meta name="viewport" content="width=device-width" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title>Insert title here</title>
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<!-- Bootstrap core CSS     -->
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
	<!-- Animation library for notifications   -->
	<link href="${pageContext.request.contextPath}/resources/css/animate.min.css" rel="stylesheet" />
	<!--  Paper Dashboard core CSS    -->
	<link href="${pageContext.request.contextPath}/resources/css/paper-dashboard.css" rel="stylesheet" />
	<!--  Fonts and icons     -->
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
	<link href="${pageContext.request.contextPath}/resources/css/themify-icons.css" rel="stylesheet">
	
	<!-- 필요한 css는 이 밑에 넣어주면 됨 -->
	<!-- 스크립트는 body 맨 아래쪽에 -->
</head>
<body>
	<div class="wrapper">
		<jsp:include page="sidebar_ch.jsp" />
		<div class="main-panel">
			<jsp:include page="/WEB-INF/views/project/header_ch.jsp" flush="false" /> <!-- </nav> -->
			<div class="content">
				<div class="container-fluid">
					<!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
					<div class="row">
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">회원정보 수정</h4>
                            </div>
                            <div class="content">
                                <form id="updateForm" action="${pageContext.request.contextPath}/user/updateInfo" method="post">
                               		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>이메일 주소</label>
                                                <input type="email" class="form-control border-input" value="${userDTO.userId}" disabled="disabled">
                                                <input type="hidden" id="userId" name="userId" value="${userDTO.userId}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>비밀번호</label>
                                                <input type="password" name="userPassword" id="password" class="form-control border-input" placeholder="비밀번호" value="">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>비밀번호 확인</label>
                                                <input type="password" name="confirmPassword" id="confirm-password" class="form-control border-input" placeholder="비밀번호 확인" value="">
                                            </div>
                                        </div>
                                    </div>

									
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>이름</label>
                                                <input name="userName" id="username" type="text" class="form-control border-input" placeholder="이름" value="${userDTO.userName}">
                                            </div>
                                        </div>
                                    </div>
									
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>대학교</label>
                                                <input type="text" name="userSchool" id="school" class="form-control border-input" placeholder="학교" value="${userDTO.userSchool}">
                                            </div>
                                        </div>
                                    </div>


                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>전공</label>
                                                <input type="text" name="userMajor" id="major" class="form-control border-input" placeholder="전공" value="${userDTO.userMajor}">
                                            </div>
                                        </div>
                                    </div>



                                    <div class="text-center">
                                        <button type="submit" name="register-submit" id="register-submit" class="btn btn-info btn-fill btn-wd">수정하기</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
					


				</div>
			</div>
			<jsp:include page="/WEB-INF/views/project/footer_ch.jsp" flush="false" />
		</div>
	</div>
	
	<!--   Core JS Files   -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap-checkbox-radio.js"></script>
	<!--  Charts Plugin -->
	<script src="${pageContext.request.contextPath }/resources/js/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap-notify.js"></script>
	<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="${pageContext.request.contextPath }/resources/js/paper-dashboard.js"></script>
	<!-- 필요한 자바스크립트 파일은 여기에 넣어주면 됨 -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"
		type="text/javascript"></script>
		
	<script>
		var header = $("meta[name='_csrf_header']").attr("content");
		var token = $("meta[name='_csrf']").attr("content");

		
	    $.validator.addMethod(
	            "regex",
	            function(value, element, regexp) {
	                var re = new RegExp(regexp);
	                return this.optional(element) || re.test(value);
	            },
	            "이름은 한글 2글자 이상 입력하세요."
	    );
	    
            $.validator.addMethod("PASSWORD",function(value,element){
                return this.optional(element) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/i.test(value);
            },"비밀번호는 8-16자 영문, 숫자 조합으로 작성하세요.");
            
		$("#updateForm").validate({
            //validation이 끝난 이후의 submit 직전 추가 작업할 부분
            submitHandler: function(form) {
                form.submit();
            },
            //규칙
            rules: {
                email: {
                    required : true,
                    minlength : 5,
                   	/* remote :
                    {
                      url: '${pageContext.request.contextPath}/user/idCheck',
                      type: "post",
                      data:
                      {
                          userId : function()
                          {
                              return $('#register-form :input[name="userId"]').val();
                          }
                      }
                    }, */
                    email : true
                },
                password: {
                    required : true,
                    PASSWORD : true
                },
                confirmPassword: {
                    required : true,
                    PASSWORD : true,
                    equalTo : password
                },
                userName: {
                    required : true,
                    minlength : 2,
                    regex : /^[가-힣]+$/
                },
                userSchool: {
                	required : true,
                    minlength : 2
                },
                userMajor: {
                    required : true,
                    minlength : 2
                },
            },
            //규칙체크 실패시 출력될 메시지
            messages : {
                email: {
                    required : "필수 입력 항목입니다.",
                    // remote : $.validator.format("{0}는 이미 존재하는 메일주소 입니다."),
                    email : "올바른 형식의 이메일 주소를 입력하세요."
                },
                password: {
                    required : "필수 입력 항목입니다.",
                    minlength : "비밀번호는 {0}자리 이상 입력 하세요."
                },
                confirmPassword: {
                    required : "필수 입력 항목입니다.",
                    minlength : "비밀번호는 {0}자리 이상 입력 하세요.",
                    equalTo : "비밀번호가 일치하지 않습니다."
                },
                userName: {
                    required : "필수 입력 항목입니다.",
                    minlength : "이름은 한글 {0}글자 이상 입력하세요."
                },
                userSchool: {
                    required : "필수 입력 항목입니다.",
                    minlength : "존재하지 않는 대학입니다."
                },
                userMajor: {
                    required : "필수 입력 항목입니다.",
                    minlength : "존재하지 않는 학과입니다."
                }
            }
        });
		
	</script>

</body>
</html>