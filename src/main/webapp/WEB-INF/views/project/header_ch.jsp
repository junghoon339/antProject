<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="com.ant.user.dto.UserDTO"%>

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
								<p>Message</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification">5</p>
									<p>Notifications</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                               <li><a href="${pageContext.request.contextPath}/user/chat">몰라</a></li>
						<li><a href="${pageContext.request.contextPath}/user/update">절레절레</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/test/test">꾸꾸까까</a></li>
						<li><a href="${pageContext.request.contextPath}/user/logout">로그인/로그아웃</a></li>
                              </ul>
                        </li>
						<li>
                            <a href="#">
								<i class="ti-reddit"></i>
								<p>${userDTO.userName}님</p>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>