<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

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
		<sec:authorize access="hasRole('ROLE_USER')">
			<ul class="nav">
			<c:choose>
				<c:when test="${projectNo==null}">
					<li><a href="${pageContext.request.contextPath}/project/home">
							<i class="ti-pie-chart"></i>
							<p>진행중 조별과제</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/project/completedProject">
							<i class="ti-user"></i>
							<p>완료된 조별과제</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/timetable/main"> <i class="ti-view-list-alt"></i>
							<p>My TimeTable</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/userCalendar/userCalendar"> <i class="ti-text"></i>
							<p>My Calendar</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/adminNotice"> <i class="ti-pencil-alt2"></i>
							<p>공지사항</p>
					</a></li>
				</c:when>


				<c:otherwise>
					<li><a
						href="${pageContext.request.contextPath}/project/teamInfo"> <i
							class="ti-pie-chart"></i>
							<p>조별과제 정보</p>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/project/projectUserInfo">
							<i class="ti-user"></i>
							<p>조원 정보</p>
					</a></li>
					<li><a href="table.html"> <i class="ti-view-list-alt"></i>
							<p>조별과제 시간표</p>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/projectCalendar/projectCalendar">
							<i class="ti-text"></i>
							<p>조별과제 달력</p> 
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/storage/storageTable/${projectNo}">
							<i class="ti-pencil-alt2"></i>
							<p>자료실</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/vote/"> <i
							class="ti-pencil-alt2"></i>
							<p>투표</p>
					</a></li>
					
					<li><a href="${pageContext.request.contextPath}/todo/list"> <i
							class="ti-pencil-alt2"></i>
							<p>To Do Board</p>
					</a></li>
					
					<li><a href="${pageContext.request.contextPath}/timetable/teamMain"> <i
							class="ti-pencil-alt2"></i>
							<p>팀 시간표</p>
					</a></li>
				</c:otherwise>
			</c:choose>
			</ul>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<ul class="nav">
		         <li><a href="${pageContext.request.contextPath }/admin/user"> <i
		               class="ti-user"></i>
		               <p>회원관리</p>
		         </a></li>
		         <li><a href="${pageContext.request.contextPath }/admin/adminProject"> <i class="ti-pie-chart"></i>
		               <p>프로젝트관리</p>
		         </a></li>
		         <li><a href="${pageContext.request.contextPath }/admin/adminNotice"> <i
		               class="ti-view-list-alt"></i>
		               <p>공지사항관리</p>
		         </a></li>
        	 </ul>
		</sec:authorize>
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
		
	</div>
</div>