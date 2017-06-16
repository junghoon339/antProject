<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="og:title" content="한국외대 시간표 HUFSTT" />
		<meta name="og:type" content="timetable" />
		<meta name="og:site_name" content="HUFSTT" />
		<meta name="og:description" content="한국외대 시간표 작성 웹서비스!" />
		<title>한국외대 시간표</title>
		<link href="${pageContext.request.contextPath}/resources/asset/stylesheets/timetable.css" media="all" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/resources/asset/stylesheets/timetable.mobile.css" media="handheld, only screen and (max-device-width: 768px)" type="text/css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/resources/asset/stylesheets/timetable.mobile.480.css" media="handheld, only screen and (max-device-width: 480px)" type="text/css" rel="stylesheet" />

		<link href="${pageContext.request.contextPath}/resources/asset/stylesheets/jquery-ui-1.8.17.custom.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/resources/asset/stylesheets/jquery.jrating.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/resources/asset/stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/resources/asset/stylesheets/bootstrap-responsive.min.css" media="all" rel="stylesheet" type="text/css" /> 
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/jquery.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/jquery-ui-1.8.17.custom.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/jquery.jrating.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/jquery.touch-punch.js" type="text/javascript"></script>

		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/utils.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/exportpng.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/timetable_common.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/timetable_hufstt.js" type="text/javascript"></script>
		<script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-33657002-1']);
		  _gaq.push(['_setDomainName', 'hufstt.kr']);
		  _gaq.push(['_trackPageview']);

		  (function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();

    </script>
    <style type="text/css">
    
    </style>
	</head>
	<body>
		<!-- facebook test -->
    <!-- <div id="fb-root"></div>
    <script>
      // Load the SDK Asynchronously
      (function(d){
         var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement('script'); js.id = id; js.async = true;
         js.src = "//connect.facebook.net/ko_KR/all.js";
         ref.parentNode.insertBefore(js, ref);
       }(document));

      // Init the SDK upon load
      window.fbAsyncInit = function(){
        FB.init({
          appId      : '180646932067359', // App ID
          channelUrl : '//'+window.location.hostname+'/channel', // Path to your Channel File
          status     : true, // check login status
          cookie     : true, // enable cookies to allow the server to access the session
          xfbml      : true  // parse XFBML
        });
      };
    </script> -->
		<!-- facebook test end -->

		<!-- <div id="course_detail_wrapper" style="display:none;">
			<div class="course-title">
				<h3 id="course_detail_title"></h3>
				<div id="course_detail_contract" class="course_detail_toggle"></div>
				<div id="course_detail_expand" style="display:none;" class="course_detail_toggle"></div>
			</div>
			<div id="course_detail">
				<table id="course_detail_table">
					<tr>
						<th>캠퍼스</th>
						<td class="campus"></td>
					</tr>
					<tr>
						<th>소속</th>
						<td class="sector"></td>
					</tr>
					<tr>
						<th>학수번호</th>
						<td class="course-number"></td>
					</tr>
					<tr>
						<th>과목구분</th>
						<td class="classification"></td>
					</tr>
					<tr>
						<th>개설학과</th>
						<td class="department"></td>
					</tr>
					<tr>
						<th>학년</th>
						<td class="academic-year"></td>
					</tr>
					<tr>
						<th>학점</th>
						<td class="credit"></td>
					</tr>
					<tr>
						<th>수업교시</th>
						<td class="class-time"></td>
					</tr>
					<tr>
						<th>교수명</th>
						<td class="instructor"></td>
					</tr>
					<tr>
						<th>강의실</th>
						<td class="location"></td>
					</tr>
					<tr>
						<th>정원</th>
						<td class="quota"></td>
					</tr>
					<tr>
						<th>현원</th>
						<td class="enrollment"></td>
					</tr>
					<tr>
						<th>비고</th>
						<td class="remark"></td>
					</tr>
					<tr>
						<th>강의평점</th>
						<td>
							<div id="course_detail_rating">
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="course_detail_buttons">
				<button class="btn btn-warning" id="course_detail_plan_button">강의계획서 보기</button>
			</div>
		</div> -->

	<!-- 	<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="#" id="brand_button">HUFSTT</a>
					<ul class="nav" id="main_navigation">
						<li>
						<div class="btn-group">
							<a class="btn dropdown-toggle btn-inverse" data-toggle="dropdown" href="#" id="semester_label_button"><span id="semester_label">학기</span> <span class="caret"></span></a>
							<ul class="dropdown-menu" id="semester_dropdown_ul">
								init_client 이후 초기화됨
							</ul>
						</div>
						</li>
						<li class="active"><a href="#search" id="nav_search_result" data-toggle="tab">검색결과</a></li>
						<li><a href="#my_courses" data-toggle="tab" rel="tooltip" id="nav_my_courses">내 강의 <span class="badge badge-info" id="my_courses_credit">0학점</span></a></li>
						<li id="social_comment_li"><a href="#social_comment" id="nav_social_comment" data-toggle="tab">소셜댓글</a></li>
						<li id="export_li"><a href="#export" id="nav_export" data-toggle="tab">저장하기</a></li>
					</ul>
					<ul class="nav pull-right">
						<li id="facebook_like_li">
						<div class="fb-like" data-href="http://hufstt.kr" data-send="false" data-layout="button_count" data-width="100" data-show-faces="false" data-colorscheme="dark"></div>
						</li>
					</ul>
				</div>
			</div>
		</div> -->
		<!-- <div class="container">
			<div id="rating">
			</div>
			<div id="content_wrapper">
				<div id="search_form_container">
					<form class="well form-search" id="search_form">
						<div class="btn-group" id="search_type">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span id="stype_dropdown_label">교과목명</span> <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#" id="stype_course_title">교과목명으로 검색</a></li>
								<li><a href="#" id="stype_department">개설학과로 검색</a></li>
								<li><a href="#" id="stype_class_time">수업교시로 검색</a></li>
								<li><a href="#" id="stype_instructor">교수명으로 검색</a></li>
								<li><a href="#" id="stype_course_number">학수번호로 검색</a></li>
							</ul>
						</div>
						<input type="text" class="input-medium" id="search_query_text" placeholder="예) 경원" />
						<button type="submit" class="btn">검색</button>

						검색필터 버튼
						<a class="btn" id="search_filter_toggle_button" state="off">검색필터 <span class="caret"></span></a>

						<div id="search_filter" style="display:none;">
							<div class="search-filter-container" id="filter_practical_foreign_language">
								<span class="header">실용외국어</span>
								<span class="label" value="실외(선)">실용외국어(선택)</span>
								<span class="label" value="실외(필)">실용외국어(필수)</span>
							</div>
							<div class="search-filter-container" id="filter_liberal_arts">
								<span class="header">교양과목</span>
								<span class="label" value="학습">학습포트폴리오</span>
								<span class="label" value="기초">기초교양</span>
								<span class="label" value="세문">세계와문화</span>
								<span class="label" value="언문예">언어.문학.예술</span>
								<span class="label" value="사철">역사와철학</span>
								<span class="label" value="정사">정보와사회</span>
								<span class="label" value="과기">과학과기술</span>
								<span class="label" value="건강">건강과레포츠</span>
								<span class="label" value="특교">특별교양</span>
								<span class="label" value="한국학">한국학</span>
								<span class="label" value="군사">군사학</span>
							</div>
							<div class="search-filter-container" id="filter_etc">
								<span class="header">기타</span>
								<span class="label" value="teaching">교직</span>
							</div>
							<div class="search-filter-container" id="filter_academic_year">
								<span class="header">학년</span>
								<span class="label" value="1">1학년</span>
								<span class="label" value="2">2학년</span>
								<span class="label" value="3">3학년</span>
								<span class="label" value="4">4학년 이상</span>
								<span class="label" value="5">대학원</span>
							</div>
							<div class="search-filter-container" id="filter_credit">
								<span class="header">학점</span>
								<span class="label" value="1">1학점</span>
								<span class="label" value="2">2학점</span>
								<span class="label" value="3">3학점</span>
								<span class="label" value="4">4학점</span>
								<span class="label" value="5">5학점 이상</span>
							</div>
							<div id="search_filter_footer">
							</div>
						</div>

					</form>
				</div> -->
				<!-- <div class="tab-content" id="lectures_content">
					<div class="tab-pane active" id="search">
						<div id="search_result">
							<table class="table table-condensed table-bordered search-result-table" id="search_result_table">
								<thead>
									<tr>
										<th class="sector">소속</th>
										<th class="course-number">학수번호</th>
										<th class="course-title">교과목명</th>
										<th class="department">개설학과</th>
										<th class="classification">구분</th>
										<th class="academic-year">학년</th>
										<th class="credit">학점</th>
										<th class="class-time">수업교시</th>
										<th class="location">강의실</th>
										<th class="instructor">교수</th>
										<th class="quota">정원</th>
										<th class="enrollment">현원</th>
										<th class="features">특징</th>
										<th class="remark">비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="18" style="text-align:center;">검색어를 입력하세요.</td>
									</tr>
								</tbody>
							</table>
						</div> -->

					<!-- </div>
					<div class="tab-pane" id="my_courses">
						<table class="table table-condensed table-bordered search-result-table" id="my_courses_table">
							<thead>
								<tr>
										<th class="sector">소속</th>
										<th class="course-number">학수번호</th>
										<th class="course-title">교과목명</th>
										<th class="department">개설학과</th>
										<th class="classification">구분</th>
										<th class="academic-year">학년</th>
										<th class="credit">학점</th>
										<th class="class-time">수업교시</th>
										<th class="location">강의실</th>
										<th class="instructor">교수</th>
										<th class="quota">정원</th>
										<th class="enrollment">현원</th>
										<th class="features">특징</th>
										<th class="remark">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="18" style="text-align:center;">선택된 강의가 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div> -->
				<div id="timetable_container">
					<div id="timecells_container">
						<div id="customcell_container">
							<div id="customcell" style="display:none;"></div>
						</div>
					</div>
					<table id="timetable">
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th class="mon">월요일</th>
								<th class="tue">화요일</th>
								<th class="wed">수요일</th>
								<th class="thu">목요일</th>
								<th class="fri">금요일</th>
								<th class="sat">토요일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th rowspan="2">
									<span class="period">0교시</span><br />
									<span class="time">08:00~09:00</span>
								</th>
								<td class="mon" time="0">&nbsp;</td><td class="tue" time="0">&nbsp;</td><td class="wed" time="0">&nbsp;</td><td class="thu" time="0">&nbsp;</td><td class="fri" time="0">&nbsp;</td><td class="sat" time="0">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="0.5">&nbsp;</td><td class="tue" time="0.5">&nbsp;</td><td class="wed" time="0.5">&nbsp;</td><td class="thu" time="0.5">&nbsp;</td><td class="fri" time="0.5">&nbsp;</td><td class="sat" time="0.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">1교시</span><br />
									<span class="time">09:00~10:00</span>
								</th>
								<td class="mon" time="1">&nbsp;</td><td class="tue" time="1">&nbsp;</td><td class="wed" time="1">&nbsp;</td><td class="thu" time="1">&nbsp;</td><td class="fri" time="1">&nbsp;</td><td class="sat" time="1">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="1.5">&nbsp;</td><td class="tue" time="1.5">&nbsp;</td><td class="wed" time="1.5">&nbsp;</td><td class="thu" time="1.5">&nbsp;</td><td class="fri" time="1.5">&nbsp;</td><td class="sat" time="1.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">2교시</span><br />
									<span class="time">10:00~11:00</span>
								</th>
								<td class="mon" time="2">&nbsp;</td><td class="tue" time="2">&nbsp;</td><td class="wed" time="2">&nbsp;</td><td class="thu" time="2">&nbsp;</td><td class="fri" time="2">&nbsp;</td><td class="sat" time="2">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="2.5">&nbsp;</td><td class="tue" time="2.5">&nbsp;</td><td class="wed" time="2.5">&nbsp;</td><td class="thu" time="2.5">&nbsp;</td><td class="fri" time="2.5">&nbsp;</td><td class="sat" time="2.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">3교시</span><br />
									<span class="time">11:00~12:00</span>
								</th>
								<td class="mon" time="3">&nbsp;</td><td class="tue" time="3">&nbsp;</td><td class="wed" time="3">&nbsp;</td><td class="thu" time="3">&nbsp;</td><td class="fri" time="3">&nbsp;</td><td class="sat" time="3">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="3.5">&nbsp;</td><td class="tue" time="3.5">&nbsp;</td><td class="wed" time="3.5">&nbsp;</td><td class="thu" time="3.5">&nbsp;</td><td class="fri" time="3.5">&nbsp;</td><td class="sat" time="3.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">4교시</span><br />
									<span class="time">12:00~13:00</span>
								</th>
								<td class="mon" time="4">&nbsp;</td><td class="tue" time="4">&nbsp;</td><td class="wed" time="4">&nbsp;</td><td class="thu" time="4">&nbsp;</td><td class="fri" time="4">&nbsp;</td><td class="sat" time="4">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="4.5">&nbsp;</td><td class="tue" time="4.5">&nbsp;</td><td class="wed" time="4.5">&nbsp;</td><td class="thu" time="4.5">&nbsp;</td><td class="fri" time="4.5">&nbsp;</td><td class="sat" time="4.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">5교시</span><br />
									<span class="time">13:00~14:00</span>
								</th>
								<td class="mon" time="5">&nbsp;</td><td class="tue" time="5">&nbsp;</td><td class="wed" time="5">&nbsp;</td><td class="thu" time="5">&nbsp;</td><td class="fri" time="5">&nbsp;</td><td class="sat" time="5">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="5.5">&nbsp;</td><td class="tue" time="5.5">&nbsp;</td><td class="wed" time="5.5">&nbsp;</td><td class="thu" time="5.5">&nbsp;</td><td class="fri" time="5.5">&nbsp;</td><td class="sat" time="5.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">6교시</span><br />
									<span class="time">14:00~15:00</span>
								</th>
								<td class="mon" time="6">&nbsp;</td><td class="tue" time="6">&nbsp;</td><td class="wed" time="6">&nbsp;</td><td class="thu" time="6">&nbsp;</td><td class="fri" time="6">&nbsp;</td><td class="sat" time="6">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="6.5">&nbsp;</td><td class="tue" time="6.5">&nbsp;</td><td class="wed" time="6.5">&nbsp;</td><td class="thu" time="6.5">&nbsp;</td><td class="fri" time="6.5">&nbsp;</td><td class="sat" time="6.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">7교시</span><br />
									<span class="time">15:00~16:00</span>
								</th>
								<td class="mon" time="7">&nbsp;</td><td class="tue" time="7">&nbsp;</td><td class="wed" time="7">&nbsp;</td><td class="thu" time="7">&nbsp;</td><td class="fri" time="7">&nbsp;</td><td class="sat" time="7">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="7.5">&nbsp;</td><td class="tue" time="7.5">&nbsp;</td><td class="wed" time="7.5">&nbsp;</td><td class="thu" time="7.5">&nbsp;</td><td class="fri" time="7.5">&nbsp;</td><td class="sat" time="7.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">8교시</span><br />
									<span class="time">16:00~17:00</span>
								</th>
								<td class="mon" time="8">&nbsp;</td><td class="tue" time="8">&nbsp;</td><td class="wed" time="8">&nbsp;</td><td class="thu" time="8">&nbsp;</td><td class="fri" time="8">&nbsp;</td><td class="sat" time="8">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="8.5">&nbsp;</td><td class="tue" time="8.5">&nbsp;</td><td class="wed" time="8.5">&nbsp;</td><td class="thu" time="8.5">&nbsp;</td><td class="fri" time="8.5">&nbsp;</td><td class="sat" time="8.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">9교시</span><br />
									<span class="time">17:00~18:00</span>
								</th>
								<td class="mon" time="9">&nbsp;</td><td class="tue" time="9">&nbsp;</td><td class="wed" time="9">&nbsp;</td><td class="thu" time="9">&nbsp;</td><td class="fri" time="9">&nbsp;</td><td class="sat" time="9">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="9.5">&nbsp;</td><td class="tue" time="9.5">&nbsp;</td><td class="wed" time="9.5">&nbsp;</td><td class="thu" time="9.5">&nbsp;</td><td class="fri" time="9.5">&nbsp;</td><td class="sat" time="9.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">10교시</span><br />
									<span class="time">18:00~19:00</span>
								</th>
								<td class="mon" time="10">&nbsp;</td><td class="tue" time="10">&nbsp;</td><td class="wed" time="10">&nbsp;</td><td class="thu" time="10">&nbsp;</td><td class="fri" time="10">&nbsp;</td><td class="sat" time="10">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="10.5">&nbsp;</td><td class="tue" time="10.5">&nbsp;</td><td class="wed" time="10.5">&nbsp;</td><td class="thu" time="10.5">&nbsp;</td><td class="fri" time="10.5">&nbsp;</td><td class="sat" time="10.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">11교시</span><br />
									<span class="time">19:00~20:00</span>
								</th>
								<td class="mon" time="11">&nbsp;</td><td class="tue" time="11">&nbsp;</td><td class="wed" time="11">&nbsp;</td><td class="thu" time="11">&nbsp;</td><td class="fri" time="11">&nbsp;</td><td class="sat" time="11">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="11.5">&nbsp;</td><td class="tue" time="11.5">&nbsp;</td><td class="wed" time="11.5">&nbsp;</td><td class="thu" time="11.5">&nbsp;</td><td class="fri" time="11.5">&nbsp;</td><td class="sat" time="11.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">12교시</span><br />
									<span class="time">20:00~21:00</span>
								</th>
								<td class="mon" time="12">&nbsp;</td><td class="tue" time="12">&nbsp;</td><td class="wed" time="12">&nbsp;</td><td class="thu" time="12">&nbsp;</td><td class="fri" time="12">&nbsp;</td><td class="sat" time="12">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="12.5">&nbsp;</td><td class="tue" time="12.5">&nbsp;</td><td class="wed" time="12.5">&nbsp;</td><td class="thu" time="12.5">&nbsp;</td><td class="fri" time="12.5">&nbsp;</td><td class="sat" time="12.5">&nbsp;</td>
							</tr>
							<tr>
								<th rowspan="2">
									<span class="period">13교시</span><br />
									<span class="time">21:00~22:00</span>
								</th>
								<td class="mon" time="13">&nbsp;</td><td class="tue" time="13">&nbsp;</td><td class="wed" time="13">&nbsp;</td><td class="thu" time="13">&nbsp;</td><td class="fri" time="13">&nbsp;</td><td class="sat" time="13">&nbsp;</td>
							</tr>
							<tr>
								<td class="mon" time="13.5">&nbsp;</td><td class="tue" time="13.5">&nbsp;</td><td class="wed" time="13.5">&nbsp;</td><td class="thu" time="13.5">&nbsp;</td><td class="fri" time="13.5">&nbsp;</td><td class="sat" time="13.5">&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
			<div id="export_wrapper">
				<div id="database_export">
					<p>작성한 시간표는 아래의 주소에서 쉽게 열어볼 수 있습니다! <br />
					<a id="saved_timetable_url" target="_blank"></a>
					</p>
				</div>
				<div id="image_export_wrapper">
					<canvas id="tt_canvas" style="display:none;">
					</canvas>
					<div id="export_image_wrapper">
					</div>
					<div id="export_button">
						<a href="#export_image" id="export_save_button" class="btn btn-danger" download="timetable.png">이미지 저장하기</a>
						<a href="#publish_facebook" id="publish_facebook_toggle_button" class="btn btn-danger" state="off">페이스북에 공유하기 <span class="caret"></span></a>
						<form id="facebook_message_wrapper" class="form-inline">
							<input type="text" placeholder="담벼락에 게시될 메시지를 입력하세요." id="facebook_message" />
							<button type="submit" id="publish_facebook_ok_button" class="btn">확인</button>
						</form>
						<p>
						* 이미지 저장하기 버튼이 작동하지 않으면 위에 있는 그림을 [우클릭 -&gt; 다른 이름으로 사진 저장]으로 직접 저장하세요.
						</p>
					</div>
				</div>
			</div>

			<div id="social_comment_wrapper">
				<div class="fb-comments" data-href="http://hufstt.kr" data-num-posts="5" data-width="500" id="social_comment"></div>
			</div>

			 <div id="footer">
				<p>
				Developed by <a href="http://www.facebook.com/jongmin.rok" target="_blank">Jongmin</a> in <a href="http://www.wafflestudio.com" target="_blank">Wafflestudio</a>
				</p>
				<p>
				<a href="mailto:secury@wafflestudio.com">secury@wafflestudio.com</a>
				</p>
				<p>
				최근 수강편람 업데이트 : <span id="data_updated_at"></span>
				</p>
			</div>

		</div>  <!-- /container -->
		  <%-- <div id="init_loading_modal">
			<div id="init_loading_image">
				<img src="${pageContext.request.contextPath}/resources/asset/images/loading.gif" alt="init-loading" />
			</div>
			<p>
			로딩중입니다. 잠시만 기다려 주세요.
			</p>
		</div>  --%>

		<%-- <div id="facebook_loading_modal">
			<div id="facebook_loading_image">
				<img src="${pageContext.request.contextPath}/resources/asset/images/loading.gif" alt="facebook-loading" />
			</div>
			<p>
			이미지를 등록중입니다. 잠시만 기다려 주세요.
			</p>
		</div> --%>
		<div id="custom_lecture_modal">
			<form id="custom_lecture_form">
				<input type="text" id="custom_course_title" class="input-large" placeholder="교과목명을 입력하세요." /><br />
				<input type="text" id="custom_location" class="input-large" placeholder="강의동을 입력하세요." /><br />
				<button type="submit" id="custom_lecture_add_button" class="btn btn-inverse">추가</button>
				<a id="custom_lecture_close_button" class="btn btn-inverse">취소</a>
			</form>
		</div>


		<!-- Le javascript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/bootstrap-dropdown.js"></script>
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/bootstrap-tab.js"></script>
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/bootstrap-tooltip.js"></script>
		<script src="${pageContext.request.contextPath}/resources/asset/javascripts/bootstrap-button.js"></script>
	</body>
</html> 
    