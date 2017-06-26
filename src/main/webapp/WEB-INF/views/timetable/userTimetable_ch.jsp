<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>개미와 베짱이, 대학조별과제 관리시스템</title>
<!--   Core JS Files   -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">

<link rel="stylesheet"
	href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />

<!-- Bootstrap core CSS     -->
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Animation library for notifications   -->
<link
	href="${pageContext.request.contextPath }/resources/css/animate.min.css"
	rel="stylesheet" />
<!--  Paper Dashboard core CSS    -->
<link
	href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css"
	rel="stylesheet" />
<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link
	href="${pageContext.request.contextPath }/resources/css/themify-icons.css"
	rel="stylesheet">

<!-- 필요한 css는 이 밑에 넣어주면 됨 -->
<link
	href="${pageContext.request.contextPath}/resources/asset/stylesheets/timetable.css"
	media="all" rel="stylesheet" type="text/css" />

<!-- 스크립트는 body 맨 아래쪽에 -->
<style type="text/css">
.timecell {
	opacity: 1;
}
</style>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');

	ga('create', 'UA-67415846-1', 'auto');
	ga('send', 'pageview');

	var commonUrl = "${pageContext.request.contextPath}";
	var userNo = "${sessionScope.userDTO.userNo }";
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/project/sidebar_ch.jsp" />
		<div class="main-panel">
			<jsp:include page="/WEB-INF/views/project/header_ch.jsp"
				flush="false" />
			<!-- </nav> -->
			<div class="content">
				<div class="container-fluid">
					<div id="timetable_container">
						<div id="timecells_container">
							<div id="customcell_container">
								<div id="customcell" style="display: none;"></div>
							</div>
						</div>
						<div class="card">
							<table id="timetable">
								<tr>
									<th>&nbsp;</th>
									<th class="mon hidden-xs">월요일</th>
									<th class="tue hidden-xs">화요일</th>
									<th class="wed hidden-xs">수요일</th>
									<th class="thu hidden-xs">목요일</th>
									<th class="fri hidden-xs">금요일</th>
									<th class="sat hidden-xs">토요일</th>
								</tr>
								<tbody>
									<tr>
										<th rowspan="2"><span class="period">0교시</span><br /> <span
											class="time">08:00~09:00</span></th>
										<td class="mon" time="0">&nbsp;</td>
										<td class="tue" time="0">&nbsp;</td>
										<td class="wed" time="0">&nbsp;</td>
										<td class="thu" time="0">&nbsp;</td>
										<td class="fri" time="0">&nbsp;</td>
										<td class="sat" time="0">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="0.5">&nbsp;</td>
										<td class="tue" time="0.5">&nbsp;</td>
										<td class="wed" time="0.5">&nbsp;</td>
										<td class="thu" time="0.5">&nbsp;</td>
										<td class="fri" time="0.5">&nbsp;</td>
										<td class="sat" time="0.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">1교시</span><br /> <span
											class="time">09:00~10:00</span></th>
										<td class="mon" time="1">&nbsp;</td>
										<td class="tue" time="1">&nbsp;</td>
										<td class="wed" time="1">&nbsp;</td>
										<td class="thu" time="1">&nbsp;</td>
										<td class="fri" time="1">&nbsp;</td>
										<td class="sat" time="1">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="1.5">&nbsp;</td>
										<td class="tue" time="1.5">&nbsp;</td>
										<td class="wed" time="1.5">&nbsp;</td>
										<td class="thu" time="1.5">&nbsp;</td>
										<td class="fri" time="1.5">&nbsp;</td>
										<td class="sat" time="1.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">2교시</span><br /> <span
											class="time">10:00~11:00</span></th>
										<td class="mon" time="2">&nbsp;</td>
										<td class="tue" time="2">&nbsp;</td>
										<td class="wed" time="2">&nbsp;</td>
										<td class="thu" time="2">&nbsp;</td>
										<td class="fri" time="2">&nbsp;</td>
										<td class="sat" time="2">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="2.5">&nbsp;</td>
										<td class="tue" time="2.5">&nbsp;</td>
										<td class="wed" time="2.5">&nbsp;</td>
										<td class="thu" time="2.5">&nbsp;</td>
										<td class="fri" time="2.5">&nbsp;</td>
										<td class="sat" time="2.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">3교시</span><br /> <span
											class="time">11:00~12:00</span></th>
										<td class="mon" time="3">&nbsp;</td>
										<td class="tue" time="3">&nbsp;</td>
										<td class="wed" time="3">&nbsp;</td>
										<td class="thu" time="3">&nbsp;</td>
										<td class="fri" time="3">&nbsp;</td>
										<td class="sat" time="3">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="3.5">&nbsp;</td>
										<td class="tue" time="3.5">&nbsp;</td>
										<td class="wed" time="3.5">&nbsp;</td>
										<td class="thu" time="3.5">&nbsp;</td>
										<td class="fri" time="3.5">&nbsp;</td>
										<td class="sat" time="3.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">4교시</span><br /> <span
											class="time">12:00~13:00</span></th>
										<td class="mon" time="4">&nbsp;</td>
										<td class="tue" time="4">&nbsp;</td>
										<td class="wed" time="4">&nbsp;</td>
										<td class="thu" time="4">&nbsp;</td>
										<td class="fri" time="4">&nbsp;</td>
										<td class="sat" time="4">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="4.5">&nbsp;</td>
										<td class="tue" time="4.5">&nbsp;</td>
										<td class="wed" time="4.5">&nbsp;</td>
										<td class="thu" time="4.5">&nbsp;</td>
										<td class="fri" time="4.5">&nbsp;</td>
										<td class="sat" time="4.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">5교시</span><br /> <span
											class="time">13:00~14:00</span></th>
										<td class="mon" time="5">&nbsp;</td>
										<td class="tue" time="5">&nbsp;</td>
										<td class="wed" time="5">&nbsp;</td>
										<td class="thu" time="5">&nbsp;</td>
										<td class="fri" time="5">&nbsp;</td>
										<td class="sat" time="5">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="5.5">&nbsp;</td>
										<td class="tue" time="5.5">&nbsp;</td>
										<td class="wed" time="5.5">&nbsp;</td>
										<td class="thu" time="5.5">&nbsp;</td>
										<td class="fri" time="5.5">&nbsp;</td>
										<td class="sat" time="5.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">6교시</span><br /> <span
											class="time">14:00~15:00</span></th>
										<td class="mon" time="6">&nbsp;</td>
										<td class="tue" time="6">&nbsp;</td>
										<td class="wed" time="6">&nbsp;</td>
										<td class="thu" time="6">&nbsp;</td>
										<td class="fri" time="6">&nbsp;</td>
										<td class="sat" time="6">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="6.5">&nbsp;</td>
										<td class="tue" time="6.5">&nbsp;</td>
										<td class="wed" time="6.5">&nbsp;</td>
										<td class="thu" time="6.5">&nbsp;</td>
										<td class="fri" time="6.5">&nbsp;</td>
										<td class="sat" time="6.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">7교시</span><br /> <span
											class="time">15:00~16:00</span></th>
										<td class="mon" time="7">&nbsp;</td>
										<td class="tue" time="7">&nbsp;</td>
										<td class="wed" time="7">&nbsp;</td>
										<td class="thu" time="7">&nbsp;</td>
										<td class="fri" time="7">&nbsp;</td>
										<td class="sat" time="7">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="7.5">&nbsp;</td>
										<td class="tue" time="7.5">&nbsp;</td>
										<td class="wed" time="7.5">&nbsp;</td>
										<td class="thu" time="7.5">&nbsp;</td>
										<td class="fri" time="7.5">&nbsp;</td>
										<td class="sat" time="7.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">8교시</span><br /> <span
											class="time">16:00~17:00</span></th>
										<td class="mon" time="8">&nbsp;</td>
										<td class="tue" time="8">&nbsp;</td>
										<td class="wed" time="8">&nbsp;</td>
										<td class="thu" time="8">&nbsp;</td>
										<td class="fri" time="8">&nbsp;</td>
										<td class="sat" time="8">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="8.5">&nbsp;</td>
										<td class="tue" time="8.5">&nbsp;</td>
										<td class="wed" time="8.5">&nbsp;</td>
										<td class="thu" time="8.5">&nbsp;</td>
										<td class="fri" time="8.5">&nbsp;</td>
										<td class="sat" time="8.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">9교시</span><br /> <span
											class="time">17:00~18:00</span></th>
										<td class="mon" time="9">&nbsp;</td>
										<td class="tue" time="9">&nbsp;</td>
										<td class="wed" time="9">&nbsp;</td>
										<td class="thu" time="9">&nbsp;</td>
										<td class="fri" time="9">&nbsp;</td>
										<td class="sat" time="9">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="9.5">&nbsp;</td>
										<td class="tue" time="9.5">&nbsp;</td>
										<td class="wed" time="9.5">&nbsp;</td>
										<td class="thu" time="9.5">&nbsp;</td>
										<td class="fri" time="9.5">&nbsp;</td>
										<td class="sat" time="9.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">10교시</span><br /> <span
											class="time">18:00~19:00</span></th>
										<td class="mon" time="10">&nbsp;</td>
										<td class="tue" time="10">&nbsp;</td>
										<td class="wed" time="10">&nbsp;</td>
										<td class="thu" time="10">&nbsp;</td>
										<td class="fri" time="10">&nbsp;</td>
										<td class="sat" time="10">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="10.5">&nbsp;</td>
										<td class="tue" time="10.5">&nbsp;</td>
										<td class="wed" time="10.5">&nbsp;</td>
										<td class="thu" time="10.5">&nbsp;</td>
										<td class="fri" time="10.5">&nbsp;</td>
										<td class="sat" time="10.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">11교시</span><br /> <span
											class="time">19:00~20:00</span></th>
										<td class="mon" time="11">&nbsp;</td>
										<td class="tue" time="11">&nbsp;</td>
										<td class="wed" time="11">&nbsp;</td>
										<td class="thu" time="11">&nbsp;</td>
										<td class="fri" time="11">&nbsp;</td>
										<td class="sat" time="11">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="11.5">&nbsp;</td>
										<td class="tue" time="11.5">&nbsp;</td>
										<td class="wed" time="11.5">&nbsp;</td>
										<td class="thu" time="11.5">&nbsp;</td>
										<td class="fri" time="11.5">&nbsp;</td>
										<td class="sat" time="11.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">12교시</span><br /> <span
											class="time">20:00~21:00</span></th>
										<td class="mon" time="12">&nbsp;</td>
										<td class="tue" time="12">&nbsp;</td>
										<td class="wed" time="12">&nbsp;</td>
										<td class="thu" time="12">&nbsp;</td>
										<td class="fri" time="12">&nbsp;</td>
										<td class="sat" time="12">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="12.5">&nbsp;</td>
										<td class="tue" time="12.5">&nbsp;</td>
										<td class="wed" time="12.5">&nbsp;</td>
										<td class="thu" time="12.5">&nbsp;</td>
										<td class="fri" time="12.5">&nbsp;</td>
										<td class="sat" time="12.5">&nbsp;</td>
									</tr>
									<tr>
										<th rowspan="2"><span class="period">13교시</span><br /> <span
											class="time">21:00~22:00</span></th>
										<td class="mon" time="13">&nbsp;</td>
										<td class="tue" time="13">&nbsp;</td>
										<td class="wed" time="13">&nbsp;</td>
										<td class="thu" time="13">&nbsp;</td>
										<td class="fri" time="13">&nbsp;</td>
										<td class="sat" time="13">&nbsp;</td>
									</tr>
									<tr class="halftimetr">
										<td class="mon" time="13.5">&nbsp;</td>
										<td class="tue" time="13.5">&nbsp;</td>
										<td class="wed" time="13.5">&nbsp;</td>
										<td class="thu" time="13.5">&nbsp;</td>
										<td class="fri" time="13.5">&nbsp;</td>
										<td class="sat" time="13.5">&nbsp;</td>
									</tr>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div id="custom_lecture_modal">
					<form id="custom_lecture_form">
						<input type=hidden id="securityInfo" name="${_csrf.parameterName}"
							value="${_csrf.token}"> <input type="text"
							name="timetableSubject" id="custom_course_title"
							class="input-large" placeholder="교과목명을 입력하세요." /><br /> <input
							type="text" name="timetableLocation" id="custom_location"
							class="input-large" placeholder="강의동을 입력하세요." /><br /> <input
							type="hidden" name="timetableClassInfo" id="custom_class_time" />
						<input type="hidden" name="timetableColor" id="timetableColor" />
						<input type="hidden" name="userNo"
							value="${sessionScope.userDTO.userNo }" />
						<button type="submit" id="custom_lecture_add_button"
							class="btn btn-inverse">추가</button>
						<a id="custom_lecture_close_button" class="btn btn-inverse">취소</a>
					</form>
				</div>

				<jsp:include page="/WEB-INF/views/project/footer_ch.jsp"
					flush="false" />
			</div>
		</div>


		<script
			src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"
			type="text/javascript"></script>
		<!--  Checkbox, Radio & Switch Plugins -->
		<script
			src="${pageContext.request.contextPath }/resources/js/bootstrap-checkbox-radio.js"></script>
		<!--  Charts Plugin -->
		<script
			src="${pageContext.request.contextPath }/resources/js/chartist.min.js"></script>
		<!--  Notifications Plugin    -->
		<script
			src="${pageContext.request.contextPath }/resources/js/bootstrap-notify.js"></script>
		<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
		<script
			src="${pageContext.request.contextPath }/resources/js/paper-dashboard.js"></script>
		<!-- 필요한 자바스크립트 파일은 여기에 넣어주면 됨 -->

		<script
			src="${pageContext.request.contextPath}/resources/asset/javascripts/utils.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/asset/javascripts/exportpng.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/asset/javascripts/timetable_common.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/asset/javascripts/timetable_snutt.js"
			type="text/javascript"></script>
		<script
			src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
</body>
</html>