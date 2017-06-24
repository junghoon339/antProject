<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="sidebar" data-background-color="white"
	data-active-color="success">

	<!--
      Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
      Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
   -->

	<div class="sidebar-wrapper">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/project/home"
				class="simple-text"> Ants & Grasshopper </a>
		</div>
		<ul class="nav">
			<c:choose>
				<c:when test="${projectNo==null}">
					<li><a href="${pageContext.request.contextPath}/project/home">
							<i class="ti-layers-alt"></i>
							<p>진행중 조별과제</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/project/completedProject">
							<i class="ti-check-box"></i>
							<p>완료된 조별과제</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/timetable/main"> <i class="ti-view-list-alt"></i>
							<p>시간표</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/userCalendar/userCalendar"> <i class="ti-calendar"></i>
							<p>달력</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/adminNotice"> <i class="ti-bell"></i>
							<p>공지사항</p>
					</a></li>
				</c:when>


				<c:otherwise>
					<li><a
						href="${pageContext.request.contextPath}/projectCalendar/projectCalendar">
							<i class="ti-calendar"></i>
							<p>프로젝트 달력</p> 
					</a></li>
					
					<li><a href="${pageContext.request.contextPath}/timetable/teamMain"> <i
							class="ti-view-list-alt"></i>
							<p>프로젝트 시간표</p>
					</a></li>
					
					<li><a
						href="${pageContext.request.contextPath}/storage/storageTable/${projectNo}">
							<i class="ti-save"></i>
							<p>자료실</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/vote/"> <i
							class="ti-widget-alt"></i>
							<p>투표함</p>
					</a></li>
					
					<li><a href="${pageContext.request.contextPath}/todo/list"> <i
							class="ti-pencil-alt"></i>
							<p>To Do Board</p>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/project/teamInfo"> <i
							class="ti-more"></i>
							<p>프로젝트 정보</p>
					</a></li>
					
					<li><a
						href="${pageContext.request.contextPath}/project/projectUserInfo">
							<i class="ti-user"></i>
							<p>팀원 정보</p>
					</a></li>
					
					<li><a href="${pageContext.request.contextPath}/project/report"> <i
							class="ti-pencil-alt2"></i>
							<p>프로젝트 요약</p>
					</a></li>
					
				</c:otherwise>
			</c:choose>
			<!--  <li>
                    <a href="maps.html">
                        <i class="ti-map"></i>
                        <p>Maps</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="ti-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li>
            <li class="active-pro">
                    <a href="upgrade.html">
                        <i class="ti-export"></i>
                        <p>Upgrade to PRO</p>
                    </a>
                </li> -->
		</ul>
	</div>
</div>