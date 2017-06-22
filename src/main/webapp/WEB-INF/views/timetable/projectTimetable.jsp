<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
      <meta name="og:title" content="서울대학교 시간표 SNUTT" />
      <meta name="og:type" content="timetable" />
      <meta name="og:site_name" content="SNUTT" />
      <meta name="og:description" content="서울대학교 시간표 작성 웹서비스" />
      
      <title>서울대학교 시간표 : SNUTT</title>
      
      <!-- jQuery -->      
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
      <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
      <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>

      <!--  Bootstrap -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

      <link href="${pageContext.request.contextPath}/resources/asset/stylesheets/timetable.css" media="all" rel="stylesheet" type="text/css" />

      <script src="${pageContext.request.contextPath}/resources/asset/javascripts/utils.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/asset/javascripts/exportpng.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/asset/javascripts/team_timetable_common.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/asset/javascripts/timetable_snutt.js" type="text/javascript"></script>
      <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
         (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
           m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
             })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-67415846-1', 'auto');
      ga('send', 'pageview');
	  
      var commonUrl="${pageContext.request.contextPath}";
    </script>
    <style type="text/css">
    .badgebox
{
    opacity: 0;
}

.badgebox + .badge
{
    /* Move the check mark away when unchecked */
    text-indent: -999999px;
    /* Makes the badge's width stay the same checked and unchecked */
	width: 27px;
}

.badgebox:focus + .badge
{
    /* Set something to make the badge looks focused */
    /* This really depends on the application, in my case it was: */
    
    /* Adding a light border */
    box-shadow: inset 0px 0px 5px;
    /* Taking the difference out of the padding */
}

.badgebox:checked + .badge
{
    /* Move the check mark back when checked */
	text-indent: 0;
}
    </style>
   </head>
   <body>
      
      <div class="container">
      	<div id="checkboxUserNo">
      	
      	</div>
      	<!-- <label for="default" class="btn btn-default" style="background-color:red">Default <input type="checkbox" id="default" class="badgebox"><span class="badge">&check;</span></label>
        <label for="primary" class="btn" style="background-color:red;color:white;">Primary <input type="checkbox" id="primary" class="badgebox"><span class="badge" style="background-color:white;color:red;">&check;</span></label>
        <label for="info" class="btn btn-info">Info <input type="checkbox" id="info" class="badgebox"><span class="badge">&check;</span></label>
        <label for="success" class="btn btn-success">Success <input type="checkbox" id="success" class="badgebox"><span class="badge">&check;</span></label>
         <label for="success" class="btn btn-success">Success <input type="checkbox" id="success" class="badgebox"><span class="badge">&check;</span></label>
        <label for="warning" class="btn btn-warning">Warning <input type="checkbox" id="warning" class="badgebox"><span class="badge">&check;</span></label>
        <label for="danger" class="btn btn-danger">Danger <input type="checkbox" id="danger" class="badgebox"><span class="badge">&check;</span></label> -->
         <div id="content_wrapper">
            <div id="timetable_container">
               <div id="timecells_container">
                  <div id="customcell_container">
                     <div id="customcell" style="display:none;"></div>  
                  </div>
               </div>
               <table id="timetable" >
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
                     <tr >
                        <th rowspan="2">
                           <span class="period">0교시</span><br />
                           <span class="time">08:00~09:00</span>
                        </th>
                        <td class="mon" time="0">&nbsp;</td><td class="tue" time="0">&nbsp;</td><td class="wed" time="0">&nbsp;</td><td class="thu" time="0">&nbsp;</td><td class="fri" time="0">&nbsp;</td><td class="sat" time="0">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="0.5">&nbsp;</td><td class="tue" time="0.5">&nbsp;</td><td class="wed" time="0.5">&nbsp;</td><td class="thu" time="0.5">&nbsp;</td><td class="fri" time="0.5">&nbsp;</td><td class="sat" time="0.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">1교시</span><br />
                           <span class="time">09:00~10:00</span>
                        </th>
                        <td class="mon" time="1">&nbsp;</td><td class="tue" time="1">&nbsp;</td><td class="wed" time="1">&nbsp;</td><td class="thu" time="1">&nbsp;</td><td class="fri" time="1">&nbsp;</td><td class="sat" time="1">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="1.5">&nbsp;</td><td class="tue" time="1.5">&nbsp;</td><td class="wed" time="1.5">&nbsp;</td><td class="thu" time="1.5">&nbsp;</td><td class="fri" time="1.5">&nbsp;</td><td class="sat" time="1.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">2교시</span><br />
                           <span class="time">10:00~11:00</span>
                        </th>
                        <td class="mon" time="2">&nbsp;</td><td class="tue" time="2">&nbsp;</td><td class="wed" time="2">&nbsp;</td><td class="thu" time="2">&nbsp;</td><td class="fri" time="2">&nbsp;</td><td class="sat" time="2">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="2.5">&nbsp;</td><td class="tue" time="2.5">&nbsp;</td><td class="wed" time="2.5">&nbsp;</td><td class="thu" time="2.5">&nbsp;</td><td class="fri" time="2.5">&nbsp;</td><td class="sat" time="2.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">3교시</span><br />
                           <span class="time">11:00~12:00</span>
                        </th>
                        <td class="mon" time="3">&nbsp;</td><td class="tue" time="3">&nbsp;</td><td class="wed" time="3">&nbsp;</td><td class="thu" time="3">&nbsp;</td><td class="fri" time="3">&nbsp;</td><td class="sat" time="3">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="3.5">&nbsp;</td><td class="tue" time="3.5">&nbsp;</td><td class="wed" time="3.5">&nbsp;</td><td class="thu" time="3.5">&nbsp;</td><td class="fri" time="3.5">&nbsp;</td><td class="sat" time="3.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">4교시</span><br />
                           <span class="time">12:00~13:00</span>
                        </th>
                        <td class="mon" time="4">&nbsp;</td><td class="tue" time="4">&nbsp;</td><td class="wed" time="4">&nbsp;</td><td class="thu" time="4">&nbsp;</td><td class="fri" time="4">&nbsp;</td><td class="sat" time="4">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="4.5">&nbsp;</td><td class="tue" time="4.5">&nbsp;</td><td class="wed" time="4.5">&nbsp;</td><td class="thu" time="4.5">&nbsp;</td><td class="fri" time="4.5">&nbsp;</td><td class="sat" time="4.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">5교시</span><br />
                           <span class="time">13:00~14:00</span>
                        </th>
                        <td class="mon" time="5">&nbsp;</td><td class="tue" time="5">&nbsp;</td><td class="wed" time="5">&nbsp;</td><td class="thu" time="5">&nbsp;</td><td class="fri" time="5">&nbsp;</td><td class="sat" time="5">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="5.5">&nbsp;</td><td class="tue" time="5.5">&nbsp;</td><td class="wed" time="5.5">&nbsp;</td><td class="thu" time="5.5">&nbsp;</td><td class="fri" time="5.5">&nbsp;</td><td class="sat" time="5.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">6교시</span><br />
                           <span class="time">14:00~15:00</span>
                        </th>
                        <td class="mon" time="6">&nbsp;</td><td class="tue" time="6">&nbsp;</td><td class="wed" time="6">&nbsp;</td><td class="thu" time="6">&nbsp;</td><td class="fri" time="6">&nbsp;</td><td class="sat" time="6">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="6.5">&nbsp;</td><td class="tue" time="6.5">&nbsp;</td><td class="wed" time="6.5">&nbsp;</td><td class="thu" time="6.5">&nbsp;</td><td class="fri" time="6.5">&nbsp;</td><td class="sat" time="6.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">7교시</span><br />
                           <span class="time">15:00~16:00</span>
                        </th>
                        <td class="mon" time="7">&nbsp;</td><td class="tue" time="7">&nbsp;</td><td class="wed" time="7">&nbsp;</td><td class="thu" time="7">&nbsp;</td><td class="fri" time="7">&nbsp;</td><td class="sat" time="7">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="7.5">&nbsp;</td><td class="tue" time="7.5">&nbsp;</td><td class="wed" time="7.5">&nbsp;</td><td class="thu" time="7.5">&nbsp;</td><td class="fri" time="7.5">&nbsp;</td><td class="sat" time="7.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">8교시</span><br />
                           <span class="time">16:00~17:00</span>
                        </th>
                        <td class="mon" time="8">&nbsp;</td><td class="tue" time="8">&nbsp;</td><td class="wed" time="8">&nbsp;</td><td class="thu" time="8">&nbsp;</td><td class="fri" time="8">&nbsp;</td><td class="sat" time="8">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="8.5">&nbsp;</td><td class="tue" time="8.5">&nbsp;</td><td class="wed" time="8.5">&nbsp;</td><td class="thu" time="8.5">&nbsp;</td><td class="fri" time="8.5">&nbsp;</td><td class="sat" time="8.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">9교시</span><br />
                           <span class="time">17:00~18:00</span>
                        </th>
                        <td class="mon" time="9">&nbsp;</td><td class="tue" time="9">&nbsp;</td><td class="wed" time="9">&nbsp;</td><td class="thu" time="9">&nbsp;</td><td class="fri" time="9">&nbsp;</td><td class="sat" time="9">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="9.5">&nbsp;</td><td class="tue" time="9.5">&nbsp;</td><td class="wed" time="9.5">&nbsp;</td><td class="thu" time="9.5">&nbsp;</td><td class="fri" time="9.5">&nbsp;</td><td class="sat" time="9.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">10교시</span><br />
                           <span class="time">18:00~19:00</span>
                        </th>
                        <td class="mon" time="10">&nbsp;</td><td class="tue" time="10">&nbsp;</td><td class="wed" time="10">&nbsp;</td><td class="thu" time="10">&nbsp;</td><td class="fri" time="10">&nbsp;</td><td class="sat" time="10">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="10.5">&nbsp;</td><td class="tue" time="10.5">&nbsp;</td><td class="wed" time="10.5">&nbsp;</td><td class="thu" time="10.5">&nbsp;</td><td class="fri" time="10.5">&nbsp;</td><td class="sat" time="10.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">11교시</span><br />
                           <span class="time">19:00~20:00</span>
                        </th>
                        <td class="mon" time="11">&nbsp;</td><td class="tue" time="11">&nbsp;</td><td class="wed" time="11">&nbsp;</td><td class="thu" time="11">&nbsp;</td><td class="fri" time="11">&nbsp;</td><td class="sat" time="11">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="11.5">&nbsp;</td><td class="tue" time="11.5">&nbsp;</td><td class="wed" time="11.5">&nbsp;</td><td class="thu" time="11.5">&nbsp;</td><td class="fri" time="11.5">&nbsp;</td><td class="sat" time="11.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">12교시</span><br />
                           <span class="time">20:00~21:00</span>
                        </th>
                        <td class="mon" time="12">&nbsp;</td><td class="tue" time="12">&nbsp;</td><td class="wed" time="12">&nbsp;</td><td class="thu" time="12">&nbsp;</td><td class="fri" time="12">&nbsp;</td><td class="sat" time="12">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="12.5">&nbsp;</td><td class="tue" time="12.5">&nbsp;</td><td class="wed" time="12.5">&nbsp;</td><td class="thu" time="12.5">&nbsp;</td><td class="fri" time="12.5">&nbsp;</td><td class="sat" time="12.5">&nbsp;</td>
                     </tr>
                     <tr>
                        <th rowspan="2">
                           <span class="period">13교시</span><br />
                           <span class="time">21:00~22:00</span>
                        </th>
                        <td class="mon" time="13">&nbsp;</td><td class="tue" time="13">&nbsp;</td><td class="wed" time="13">&nbsp;</td><td class="thu" time="13">&nbsp;</td><td class="fri" time="13">&nbsp;</td><td class="sat" time="13">&nbsp;</td>
                     </tr>
                     <tr class="halftimetr">
                        <td class="mon" time="13.5">&nbsp;</td><td class="tue" time="13.5">&nbsp;</td><td class="wed" time="13.5">&nbsp;</td><td class="thu" time="13.5">&nbsp;</td><td class="fri" time="13.5">&nbsp;</td><td class="sat" time="13.5">&nbsp;</td>
                     </tr>
                  </tbody>
               </table>
            </div>

         </div>
      </div>
      
      
      <div id="custom_lecture_modal">
         <form id="custom_lecture_form">
         	<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
         	<input type="text" name="timetableSubject" id="custom_course_title" class="input-large" placeholder="교과목명을 입력하세요." /><br />
            <input type="text" name="timetableLocation" id="custom_location" class="input-large" placeholder="강의동을 입력하세요." /><br />
            <input type="hidden" name="timetableClassInfo" id="custom_class_time"/>
            <input type="hidden" name="timetableColor" id="timetableColor"/>
            <input type="hidden" name="userNo" value="13"/> 
            <button type="submit" id="custom_lecture_add_button" class="btn btn-inverse">추가</button>
            <a id="custom_lecture_close_button" class="btn btn-inverse">취소</a>
         </form>
      </div>
      
     <%--  <form id="paramValues">
      	<input type=hidden id="securityInfo" name="${_csrf.parameterName}" value="${_csrf.token}">
        	<input type="hidden" name="timetableSubject" id="custom_course_title_param"/><br />
            <input type="hidden" name="timetableLocation" id="custom_location_param"/><br />
            <input type="hidden" name="timetableClassInfo" id="custom_class_time"/>
            <input type="hidden" name="timetableColor" id="timetableColor"/>
               
      </form> --%>
   </body> 
</html> 
    