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
					<li><a href="${pageContext.request.contextPath}/user/update">
							<i class="ti-pie-chart"></i>
							<p>회원정보 수정</p>
					</a></li>
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