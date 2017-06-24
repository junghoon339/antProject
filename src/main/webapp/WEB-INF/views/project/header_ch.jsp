<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="com.ant.user.dto.UserDTO"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<head>
<security:csrfMetaTags/>
</head>

		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/project/home"></a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="${pageContext.request.contextPath }/message/main?userNo=${sessionScope.userDTO.userNo}" >
                                <i class="ti-email"></i>
								<p>Message　<span class="badge" ></span></p>
                            </a>
                        </li>
                       	<li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                             	<i class="ti-user"></i>
								<p>${userDTO.userName}님</p>
								<b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/user/update">회원정보 수정</a></li>
								<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
                            </ul>
                     	 </li>
                    </ul>

                </div>
            </div>
        </nav>
        
<script>
		var header = $("meta[name='_csrf_header']").attr("content");
		var token = $("meta[name='_csrf']").attr("content");

		$(function(){ //페이지가 로딩되면
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/project/selectUnchkMessage",
				dataType: "text",
	            beforeSend : function(xhr){
	                   xhr.setRequestHeader(header, token);
	            },
				success: function(result){//서버가 가져온 result
					console.log(result);
					$(".badge").text(result);
				},
				error: function(err){
					console.log("안읽은 쪽지 갯수 가져오기 오류발생 : "+err);
				}
			})
		});
</script>