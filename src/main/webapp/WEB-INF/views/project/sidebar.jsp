<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(
		function() {
			var trigger = $('.hamburger'), isClosed = false/* , overlay = $('.overlay') */;

			
			
			trigger.click(function() {
				hamburger_cross(); //햄버거아이콘변경
			});

			function hamburger_cross() {

				if (isClosed == true) {
					//overlay.hide();
					trigger.removeClass('is-open');
					trigger.addClass('is-closed');
					isClosed = false;
					$("#burger").html("");
				} else {
					//overlay.show();
					trigger.removeClass('is-closed');
					trigger.addClass('is-open');
					isClosed = true;
					$("#burger").html("<p><br><br><br></p>");
				}
			}

			$('[data-toggle="offcanvas"]').click(function() {
				$('#wrapper').toggleClass('toggled');
			});
		});
</script>



	<div id="wrapper">
		<div class="overlay"></div>

		<!-- Sidebar -->
		<nav class="navbar navbar-inverse navbar-fixed-top"	id="sidebar-wrapper" role="navigation">
			<ul class="nav sidebar-nav">
				<li class="sidebar-brand"><a href="#"> Brand </a></li>
				<li><a href="${pageContext.request.contextPath}/timetable/projectTimetable">팀시간표</a></li>
				<li><a href="${pageContext.request.contextPath}/calendar/projectCalendar">팀캘린더</a></li>
				<li><a href="${pageContext.request.contextPath}/storage/storageTable/1">자료실</a></li>
				<li><a href="#">to do board</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">팀플정보 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<!--<li class="dropdown-header"><a href="#">팀플정보</li>
                  			<li class="dropdown-header"><a href="#">팀원정보</li> -->
						<li><a href="${pageContext.request.contextPath}/project/teamInfo">팀플정보</a></li>
						<li><a href="${pageContext.request.contextPath}/project/projectUserInfo">팀원정보</a></li>
					</ul></li>
				<li><a href="https://www.google.co.kr/">Google</a></li>
				<li><a href="${pageContext.request.contextPath}/vote/?userNo=1">투표</a></li>
			</ul>
		</nav>
		<!-- /#sidebar-wrapper -->

		<div id="page-content-wrapper">
			<button type="button" class="hamburger is-closed"
				data-toggle="offcanvas">
				<span class="hamb-top"></span> <span class="hamb-middle"></span> 
				<span class="hamb-bottom"></span>
			</button>
		</div>
	</div><!-- /#wrapper -->