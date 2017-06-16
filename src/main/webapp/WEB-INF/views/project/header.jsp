<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="com.ant.user.dto.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-findcond navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">The Ants and Grasshopper</a>
		</div>
		<div class="collapse navbar-collapse" id="navbar">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-stoggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <i
						class="fa fa-fw fa-bell-o"></i> 쪽지함 <span class="badge">10</span></a>
						<li class="dropdown"><a href="#" class="dropdown-stoggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <i
						class="fa fa-fw fa-bell-o"></i> ${userDTO.userName}님 ㅎㅇ <span class="badge">10</span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#"><i class="fa fa-fw fa-tag"></i> <span
								class="badge">Music</span>ab<span class="badge">Video</span>
								aaaaaaa</a></li>
						<li><a href="#"><i class="fa fa-fw fa-thumbs-o-up"></i> <span
								class="badge">Music</span>bbbbbb</a></li>
						<li><a href="#"><i class="fa fa-fw fa-thumbs-o-up"></i> <span
								class="badge">Video</span>cccccccc</a></li>
						<li><a href="#"><i class="fa fa-fw fa-thumbs-o-up"></i> <span
								class="badge">Game</span>ddddddddd</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Mypage
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${pageContext.request.contextPath}/user/chat">몰라</a></li>
						<li><a href="#">절레절레</a></li>
						<li class="divider"></li>
						<li><a href="#">꾸꾸까까</a></li>
						<li><a href="${pageContext.request.contextPath}/user/logout">로그인/로그아웃</a></li>
					</ul></li>
			</ul>
			<!-- 				<form class="navbar-form navbar-right search-form" role="search">
					<input type="text" class="form-control" placeholder="Search" />
				</form> -->
		</div>
	</div>
</nav>

