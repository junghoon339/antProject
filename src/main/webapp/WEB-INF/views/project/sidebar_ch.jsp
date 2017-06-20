<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="sidebar" data-background-color="white"
	data-active-color="danger">

	<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

	<div class="sidebar-wrapper">
		<div class="logo">
			<a href="http://www.creative-tim.com" class="simple-text">
				Creative Tim </a>
		</div>
		<ul class="nav">
			<c:choose>
				<c:when test="${projectNo==null}">
					<li class="active"><a href="${pageContext.request.contextPath}/project/home"> <i
							class="ti-pie-chart"></i>
							<p>진행중 조별과제</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/project/home"> <i class="ti-user"></i>
							<p>완료된 조별과제</p>
					</a></li>
					<li><a href="table.html"> <i class="ti-view-list-alt"></i>
							<p>My TimeTable</p>
					</a></li>
					<li><a href="typography.html"> <i class="ti-text"></i>
							<p>My Calendar</p>
					</a></li>
					<li><a href="icons.html"> <i class="ti-pencil-alt2"></i>
							<p>공지사항</p>
					</a></li>
				</c:when>
				
				
				<c:otherwise>
					<li class="active"><a href="${pageContext.request.contextPath}/project/teamInfo"> <i
							class="ti-pie-chart"></i>
							<p>조별과제 정보</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/project/projectUserInfo"> <i class="ti-user"></i>
							<p>조원 정보</p>
					</a></li>
					<li><a href="table.html"> <i class="ti-view-list-alt"></i>
							<p>조별과제 시간표</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/calendar/projectCalendar"> <i class="ti-text"></i>
							<p>조별과제 달력</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/storage/storageTable/1"> <i class="ti-pencil-alt2"></i>
							<p>자료실</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/vote/"> <i class="ti-pencil-alt2"></i>
							<p>투표</p>
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