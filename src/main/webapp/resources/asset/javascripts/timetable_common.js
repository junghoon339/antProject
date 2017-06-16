var apiClient = {
  get: function(path, params, callback) {
    var base_url = '/api/'
    $.ajax({
      url: base_url + path,
      data: params,
      dataType: 'json',
      method: 'get',
      success: callback
    })
  },
  post: function(path, params, callback){
    var base_url = '/api/'
    $.ajax({
      url: base_url + path,
      data: params,
      dataType: 'json',
      method: 'post',
      success: callback
    })
  }
};

function simplify_class_time(class_time)
{
  //월(1.5-1.5) -> 월
  return class_time.replace(/-[\d.,]*\)/g, ")").replace(/,[\d.,]*\)/g, ")").replace(/[()]/g, "");
}

function simplify_location(location)
{
  var arr = location.split('/');
  for (var i=0;i<arr.length-1;i++){
    for (var j=i+1;j<arr.length;j++){
      if (arr[i] == arr[j]){
        arr.splice(j,1);
        j=i;
      }
    }
  }
  return arr.join('<br />');
}

function already_owned_lecture(lecture)
{
  for (var i=0;i<my_lectures.length;i++)
    if (is_equal_lecture(my_lectures[i], lecture)) return true;
  return false;
}

function already_exist_class_time(lecture)
{
  for (var i=0;i<my_lectures.length;i++){
    if (is_duplicated_class_time(lecture, my_lectures[i])) return true;
  }
  return false;
}

//두 강의의 시간이 겹치는지 체크
function is_duplicated_class_time(l1, l2)
{
  function increasing_sequence(a,b,c){
    if (a < b && b < c) return true;
    return false;
  }
  var t1 = l1.class_time.split("/");
  var t2 = l2.class_time.split("/");
  for (var i=0;i<t1.length;i++){
    for (var j=0;j<t2.length;j++){
      //월(3-3), 월(4-2)
      var wday1 = t1[i].charAt(0);
      var wday2 = t2[j].charAt(0);
      var time1 = t1[i].replace(/[()]/g, "").slice(1).split('-');
      var time2 = t2[j].replace(/[()]/g, "").slice(1).split('-');
      var start_time1 = parseFloat(time1[0]);
      var start_time2 = parseFloat(time2[0]);
      var duration1 = parseFloat(time1[1]);
      var duration2 = parseFloat(time2[1]);
      if (wday1 == wday2 && 
         (increasing_sequence(start_time1, start_time2, start_time1+duration1) ||
          increasing_sequence(start_time1, start_time2+duration2, start_time1+duration1) ||
          increasing_sequence(start_time2, start_time1, start_time2+duration2) ||
          increasing_sequence(start_time2, start_time1+duration1, start_time2+duration2) ||
          (start_time1 == start_time2 && duration1 == duration2)
        ))
        return true;

    }
  }
  return false;
}

//GLOBAL VARIABLES
var lectures = [];
var my_lectures = [];
var query_text;
var filter;
var per_page = 30;
var page = 1;
var page_loading_complete = true;
var page_loading_requesting = false;
var selected_row;
var my_courses_selected_row;
var search_result_scroll_top = 0;
var current_tab = "search";
var gray_color = {border:"#ccc",plane:"#ddd"};
var colors = [
  {border:"#2B8728",plane:"#B6F9B2"}, //green
  {border:"#45B2B8",plane:"#BFF7F8"}, //really light blue
  {border:"#1579C2",plane:"#94E6FE"}, //light blue
  {border:"#A337A1",plane:"#F6B5F5"}, //purple
  {border:"#B8991B",plane:"#FFF49A"}, //beige/yello
  {border:"#BA313B",plane:"#FFB2BC"}, //pink/red
  {border:"#BA6C31",plane:"#FFCFB2"}  //skin-tone/brown
];
var search_type = "course_title";
var current_year;
var current_semester;

var custom_start_cell;
var custom_end_cell;
var custom_wday;
var custom_start_time;
var custom_class_time;
var custom_end_cell;
var custom_end_time;
var custom_lecture_number = 1;
var coursebook_info;

function semester_to_text(semester)
{
  if (semester == '1') return '1학기';
  if (semester == '2') return '2학기';
  if (semester == 'S') return '여름학기';
  if (semester == 'W') return '겨울학기';
  return 'null';
}

function get_coursebook_info(year, semester)
{
  for (var i=0;i<coursebook_info.length;i++){
    var coursebook = coursebook_info[i];
    if (coursebook.year == year && coursebook.semester == semester)
      return coursebook;
  }
  return null;
}

function change_semester(year, semester)
{
  current_year = year;
  current_semester = semester;
  $('#semester_label').text(current_year + "-" + current_semester);
  $('#data_updated_at').text(get_coursebook_info(current_year, current_semester).updated_time);
  $('#search_query_text').focus().val("");
}

function generate_custom_cell(lecture)
{
  var unitcell_width = $('#timetable tbody td').width()+2;
  var unitcell_height = $('#timetable tbody td').height()+0.75;
  var leftcell_width = $('#timetable tbody th').width()+2;
  var topcell_height = $('#timetable thead th').height()+2;
  var border_weight = 2;
  //시간이 유효하지 않으면 스킵
  if (wday_to_num(lecture.class_time.charAt(0)) == -1) {
		console.log("User tried to generate timetables with invalid class time");
		return;
	}
  var class_time = lecture.class_time;
  //setup variables
  var wday = wday_to_num(class_time.charAt(0));
  var start_time = parseFloat(class_time.replace(/[()]/g,"").split('-')[0].slice(1))*2;
  var duration = parseFloat(class_time.replace(/[()]/g,"").split('-')[1])*2;
  var end_time = start_time + duration;
  //기준 셀
  var criteria_cell = $($('#timetable td')[6*start_time+wday]);
  var criteria_cell2;
  var criteria_cell3 = $($('#timetable td')[6*(start_time+duration-1)+wday]);
  if (wday == 5 || wday == 4) criteria_cell2 = criteria_cell.prev();
  else criteria_cell2 = criteria_cell.next();

  var width = Math.abs(criteria_cell2.position().left - criteria_cell.position().left) -  border_weight;
  var height = criteria_cell3.position().top - criteria_cell.position().top+criteria_cell3.innerHeight() - 0*border_weight;
  var left = criteria_cell.position().left - criteria_cell.parent().position().left - border_weight/2;
  var top = criteria_cell.position().top - criteria_cell.parent().parent().position().top + topcell_height - border_weight/2;

  //create container
  var customcell = $('#customcell').css('left', left).css('top', top).width(width).height(height).show();
}

function set_scroll_to_selected_row()
{
  if (selected_row){
    var new_position = selected_row.position().top - selected_row.parent().position().top + 26 - 110;
    $('#lectures_content').scrollTop(new_position);
  }
}

function set_scroll_to_my_courses_selected_row()
{
  if (my_courses_selected_row){
    var new_position = my_courses_selected_row.position().top - my_courses_selected_row.parent().position().top + 26 - 110;
    $('#lectures_content').scrollTop(new_position);
  }
}

function wday_to_num(wday){
  if (wday == "월") return 0;
  if (wday == "화") return 1;
  if (wday == "수") return 2;
  if (wday == "목") return 3;
  if (wday == "금") return 4;
  if (wday == "토") return 5;
  return -1;
}

function generate_random_color(color)
{
  if (!color) return colors[Math.floor(colors.length * Math.random())];
  var result = colors[Math.floor(colors.length * Math.random())];
  while (result.plane == color.plane){
    result = colors[Math.floor(colors.length * Math.random())];
  }
  return result;
}
function generate_next_color(color)
{
  var i;
  for(i=0;i<colors.length;i++)
  {
    if(color.plane == colors[i].plane)
	return colors[(i+1)%colors.length];
  }
}
function my_course_tooltip_message(message)
{
  $('.my-course-tooltip .tooltip-inner').text(message);
  $('.my-course-tooltip').hide().stop(true,true).fadeIn(500, function(){
    $('.my-course-tooltip').stop(true,true).animate({color:"#fff"}, 1000, function(){
      $('.my-course-tooltip').stop(true,true).fadeOut(500);
    });
  });
}

function search_filter_tooltip_message(message)
{
  $('.search-filter-tooltip .tooltip-inner').text(message);
  $('.search-filter-tooltip').hide().stop(true,true).fadeIn(500, function(){
    $('.search-filter-tooltip').stop(true,true).animate({color:"#fff"}, 1000, function(){
      $('.search-filter-tooltip').stop(true,true).fadeOut(500);
    });
  });
}

function remove_lecture_from_my_lectures(lecture)
{
  //선택된 강의를 my_lectures에서 제거한다.
  if (lecture){
    lecture.color = null;
    for (var i=0;i<my_lectures.length;i++){
      if (is_equal_lecture(my_lectures[i], lecture)){
        my_lectures.splice(i,1);
        break;
      }
    }
    refresh_my_courses_table();
    alert("1");
    generate_timecell(my_lectures);
    my_course_tooltip_message("강의가 제거되었습니다.");
  }
}

function is_equal_lecture(a, b)
{
  if (a.course_number == b.course_number &&
      a.lecture_number == b.lecture_number)
    return true;
  return false;
}

function get_lecture_by_course_number(course_number, lecture_number)
{
  for (var i=0;i<lectures.length;i++){
    if(s(lectures[i].course_number) == s(course_number) && s(lectures[i].lecture_number) == s(lecture_number))
      return lectures[i];
  }
  return null;
}

function get_my_lecture_by_course_number(course_number, lecture_number)
{
  for (var i=0;i<my_lectures.length;i++){
    if(s(my_lectures[i].course_number) == s(course_number) && s(my_lectures[i].lecture_number) == s(lecture_number))
      return my_lectures[i];
  }
  return null;
}

function is_equal_timecell(c1, c2)
{
  return c1.attr('course-number') == c2.attr('course-number') && c1.attr('lecture-number') == c2.attr('lecture-number')
}

function for_equal_lecture_timecells(cell, thenDo)
{
  $('.timecell').each(function(x) {
    var eachSibling = $(this);
    if (is_equal_timecell(cell, eachSibling))
      thenDo (eachSibling);
  })
}

function generate_timecell(lectures)
{
	 alert("generate_timecell 들어옴");
	$('.timecell-container').remove();
  var unitcell_width = $('#timetable_container td.mon').outerWidth();
  var unitcell_height = $('#timetable_container td.mon').outerHeight();
  var leftcell_width = $('#timetable tbody th').outerWidth();
  var topcell_height = $('#timetable thead th').outerHeight();
  var border_weight = 1;
  for (var a=0;a<lectures.length;a++){
	var lecture = lectures[a];
	
    //시간이 유효하지 않으면 스킵
    if (wday_to_num(lecture.class_time.charAt(0)) == -1) continue;
	
    //cell 색깔 설정
    if (!lecture.color) generate_random_color(lecture.color);
    var class_times = lecture.class_time.split("/");
    var locations = lecture.location.split("/");
    for (var i=0;i<class_times.length;i++){
      //setup variables
      var wday = wday_to_num(class_times[i].charAt(0));
      var start_time = parseFloat(class_times[i].replace(/[()]/g,"").split('-')[0].slice(1))*2;
      var duration = parseFloat(class_times[i].replace(/[()]/g,"").split('-')[1])*2;
      //기준 셀
      var criteria_cell = $($('#timetable td')[6*start_time+wday]);
      var criteria_cell2;
      var criteria_cell3 = $($('#timetable td')[6*(start_time+duration-1)+wday]);
      if (wday == 5 || wday == 4) criteria_cell2 = criteria_cell.prev();
      else criteria_cell2 = criteria_cell.next();

      var width = Math.abs(criteria_cell2.position().left - criteria_cell.position().left) + border_weight;
      var height = criteria_cell3.position().top - criteria_cell.position().top+criteria_cell3.innerHeight() +2* border_weight;
      var left = criteria_cell.position().left - criteria_cell.parent().position().left;
      var top = criteria_cell.position().top - criteria_cell.parent().parent().position().top + topcell_height;

      //create container
      var container = $('<div></div>').addClass('timecell-container').appendTo($('#timecells_container'));
      var tdiv = $('<div></div>').addClass('timecell').width(width).height(height).css('left', left).css('top', top).css('background-color', lecture.color.plane).css('color', lecture.color.border).appendTo(container);
      var tdivc = $('<div class="timecellinfo-containter">').appendTo(tdiv);
      $('<span></span>').text(lecture.course_title).appendTo(tdivc);
      
      $('<br />').appendTo(tdivc);
      $('<span></span>').text(locations[i]).appendTo(tdivc);
      
      //gray cell이면 gray-cell 클래스 추가
      if (lecture.color == gray_color)
        tdiv.addClass('gray-cell');

      tdiv.attr('course-number', lecture.course_number).attr('lecture-number', lecture.lecture_number);
      
    }
  }
 
  
  
  
  //graycell click event 추가
  $('.gray-cell').click(function(){
    if (selected_row)
      row_dblclick_handler(selected_row);
    return false;
  });

  //timecell click event bind : 색깔 바꾸기
  $('.timecell').click(function(){
	  alert("색");
    var ele = $(this);
    var lecture = get_my_lecture_by_course_number(ele.attr('course-number'), ele.attr('lecture-number'));
    if (lecture && !ele.hasClass('gray-cell')){ //회색이 아닐때만 바꿈
      lecture.color = generate_next_color(lecture.color);
      for_equal_lecture_timecells(ele, function(sbl) {
        sbl.css('background-color', lecture.color.plane).css('color', lecture.color.border);
      })
    }
  });i
  //timecell dblclick event bind
  $('.timecell').addSwipeEvents().bind('doubletap', function(event, touch) {
	  alert("dbclick...");
    event.stopPropagation();
    timecell_delete_handler($(this));
    ga('send', 'event', 'lecture', 'delete', 'double_click');
  })

  //timecell hover event bind
  if(!isTouchDevice()){
    $('.timecell').hover(
      function() { //mouse-in
        for_equal_lecture_timecells($(this), function(sbl) {
          sbl.append('<div class="close del_hover" style="position:absolute; top:1px; right:2px;">×</span>');
          sbl.find(".del_hover").click(function(event) {
            event.stopPropagation();
            timecell_delete_handler(sbl);
            ga('send', 'event', 'lecture', 'delete', 'button_x');
          })
        })
      }, function() { //mouse-out
        $('.del_hover').remove();
      })
  }
  
/* $.ajax({
	  type:"POST",
	  url:"${pageContext.request.contextPath}/timetable/main",
	  data: 
  });*/
  
  
}

function timecell_delete_handler(ele)
{
  var lecture = get_my_lecture_by_course_number(ele.attr('course-number'), ele.attr('lecture-number'));
  //더블클릭하거나 호버링하면 삭제
  var con = confirm("["+lecture.course_title+"]를 시간표에서 제거하꺼??");
  if (con){
    remove_lecture_from_my_lectures(lecture);
  }
}

function my_courses_row_click_handler()
{
  if (my_courses_selected_row){
    my_courses_selected_row.removeClass('selected');
  }
  var ele = $(this);
  ele.addClass('selected');
  my_courses_selected_row = ele;
  //remove 버튼 추가
  $('.remove-course-button').remove();
  var course_title = my_courses_selected_row.find('.course-title');
  var remove_button = $('<span class="badge badge-important">제거</span>').addClass('remove-course-button').appendTo(course_title);
  //remove 버튼 핸들러 추가
  remove_button.click(function(){
    if (my_courses_selected_row) my_courses_selected_row.trigger('dblclick');
  });
  var mobile_info = my_courses_selected_row.find('.mobile-info');
  remove_button = $('<span class="badge badge-important">제거</span>').addClass('remove-course-button').appendTo(mobile_info);
  //remove 버튼 핸들러 추가
  remove_button.click(function(){
    if (my_courses_selected_row) my_courses_selected_row.trigger('dblclick');
  });
  //timetable refreshing
  var selected_lecture = get_my_lecture_by_course_number(ele.attr('course-number'), ele.attr('lecture-number'));
  if (!selected_lecture.color)
    selected_lecture.color = gray_color;
  alert("2");
  generate_timecell(my_lectures.concat([selected_lecture]));

  //refresh course detail
  refresh_course_detail(selected_lecture);
}

function row_click_handler()
{
  if (selected_row)
    selected_row.removeClass('selected');
  var ele = $(this);
  ele.addClass('selected');
  selected_row = ele;
	//add 버튼 추가
  $('.add-course-button').remove();
  var course_title = selected_row.find('.course-title');
  var add_button = $('<span class="badge badge-success">추가</span>').addClass('add-course-button').appendTo(course_title);
  //add버튼 핸들러 추가
  add_button.click(function(){
    if (selected_row) selected_row.trigger('dblclick');
  });
  var mobile_info = selected_row.find('.mobile-info');
  add_button = $('<span class="badge badge-success">추가</span>').addClass('add-course-button').appendTo(mobile_info);
  //add버튼 핸들러 추가
  add_button.click(function(){
    if (selected_row) selected_row.trigger('dblclick');
  });
  //timetable refreshing
  var selected_lecture = get_lecture_by_course_number(ele.attr('course-number'), ele.attr('lecture-number'));
  if (!selected_lecture.color)
    selected_lecture.color = gray_color;
  alert(3);
  generate_timecell(my_lectures.concat([selected_lecture]));

  //refresh course detail
  refresh_course_detail(selected_lecture);
}

function my_courses_row_dblclick_handler(ele)
{
  var selected_lecture = get_my_lecture_by_course_number(ele.attr('course-number'), ele.attr('lecture-number'));
  remove_lecture_from_my_lectures(selected_lecture);
  ga('send', 'event', 'lecture', 'delete', 'button_my_courses');
}

function row_dblclick_handler(ele)
{
  var selected_lecture = get_lecture_by_course_number(ele.attr('course-number'), ele.attr('lecture-number'));
  if (selected_lecture){
    //selected_lecture가 이미 들어있지 않으면
    if (already_owned_lecture(selected_lecture)){
      alert("이미 넣은 강의입니다.");
    }
    //강의 시간이 겹치면
    else if (already_exist_class_time(selected_lecture)){
      alert("강의시간이 겹칩니다.");
    }
    else {
      selected_lecture.color = generate_random_color(selected_lecture.color);
      my_lectures.push(selected_lecture);
      alert(4);
      generate_timecell(my_lectures);
      refresh_my_courses_table();
      my_course_tooltip_message("강의가 추가되었습니다.");
      ga('send', 'event', 'lecture', 'add', String(selected_lecture.course_number) + ' ' + String(selected_lecture.lecture_number));
    }
  }
}

function cancel_lecture_selection()
{
  $('.selected').removeClass('selected');
  $('.add-course-button').remove();
  $('.remove-course-button').remove();
  selected_row = null;
  my_courses_selected_row = null;
  alert(5);
  generate_timecell(my_lectures);
  $('#course_detail_wrapper').fadeOut();
}


function isTouchDevice(){
  try{
    document.createEvent("TouchEvent");
    return true;
  }catch(e){
    return false;
  }
}

function touchScroll(id){
  if(isTouchDevice()){ //if touch events exist...
    var el=document.getElementById(id);
    var scrollStartPos=0;

    document.getElementById(id).addEventListener("touchstart", function(event) {
      scrollStartPos=this.scrollTop+event.touches[0].pageY;
      //event.preventDefault();
    },false);

    document.getElementById(id).addEventListener("touchmove", function(event) {
      this.scrollTop=scrollStartPos-event.touches[0].pageY;
      event.preventDefault();
    },false);
  }
}

function s(str)
{
  if (!str) return "";
  return String(str);
}

$(function(){
  apiClient.get('init_client', {}, function(data){
    $('#init_loading_modal').dialog('close');

    coursebook_info = data.coursebook_info;

    if (!current_year && !current_semester){
      current_year = data.last_coursebook_info.year;
      current_semester = data.last_coursebook_info.semester;
    }
    //저장된 시간표 불러오기
    refresh_my_courses_table();
    alert(6);
    generate_timecell(my_lectures);
    change_semester(current_year, current_semester);

    //학기 dropdown 메뉴 초기화
    $('#semester_label').text(current_year + "-" + current_semester);
    var semester_dropdown_ul = $('#semester_dropdown_ul');
    semester_dropdown_ul.children().remove();
    for (var i=0;i<coursebook_info.length;i++){
      var year = coursebook_info[i].year;
      var semester = coursebook_info[i].semester;
      var list = $('<li></li>').appendTo(semester_dropdown_ul).addClass('semester-li');
      var link = $('<a href="#">'+year+"년 "+semester_to_text(semester)+'</a>').attr('year', year).attr('semester', semester).appendTo(list).addClass('semester-button');
      if (year == current_year && semester == current_semester) list.addClass('selected-semester-li')
    }
    //학기 변경
    $('.semester-button').unbind('click').click(function(){
      var ele = $(this);
      if (current_year == ele.attr('year') && current_semester == ele.attr('semester')) return true;
      //학기 변경
      change_semester(ele.attr('year'), ele.attr('semester'));
      $('.selected-semester-li').removeClass('selected-semester-li');
      ele.addClass('selected-semester-li');
      //검색결과 삭제
      $('#search_result_table tbody').children().remove();
      var row = $('<tr></tr>').appendTo($('#search_result_table tbody'));
      $('<td colspan="13"><h2>검색어를 입력하세요!</h2></td>').appendTo(row).css('text-align', 'center');
      //내 강의 초기화
      my_lectures = [];
      refresh_my_courses_table();
      alert(7);
      generate_timecell(my_lectures);
    });
  });

	$('.my-toggle').click(function () {
		 if(window.innerWidth<768) $('.navbar-collapse').collapse('hide');
	});

  //SNUTT 로고 클릭
  $('#brand_button').click(function(){
    $('#nav_search_result').trigger('click');
    return false;
  });

  //resize
  $(window).resize(function(){
    if (selected_row) selected_row.trigger('click');
 
    else{
    	alert(8);
    	generate_timecell(my_lectures);
    }
  });

  $('#nav_my_courses').click(function(){
    ga('send', 'event', 'tab', 'my_courses');
  });

  $('#nav_search_result').click(function(){
    ga('send', 'event', 'tab', 'search_result');
  });

  //tab transition
  $('a[data-toggle="tab"]').on('show', function (e) {
    switch ($(e.target).attr('href')){
    case "#my_courses": 
      current_tab = "my_courses";
      break;
    case "#search":
      current_tab = "search";
      break;
    case "#export":
      current_tab = "export";
      break;
    }
  })
  $('a[data-toggle="tab"]').on('shown', function (e) {
    switch ($(e.target).attr('href')){
    case "#my_courses": 
    	alert(9);
      generate_timecell(my_lectures);
      break;
    case "#search":
      $('#lectures_content').scrollTop(search_result_scroll_top);
      break;
    }
  })

  //set tooltip
  $('#nav_my_courses').tooltip({
    placement : 'bottom',
    trigger : 'manual',
    title : "강의가 추가되었습니다.",
    animation : false
  }).tooltip('show');
  $('.tooltip').addClass('my-course-tooltip').hide();

  //set tooltip
  $('#search_filter_toggle_button').tooltip({
    placement : 'right',
    trigger : 'manual',
    title : "강의가 추가되었습니다.",
    animation : false
  }).tooltip('show');
  $('.tooltip:last').addClass('search-filter-tooltip').hide();

  // send search_query
  var sendSearchQuery = function(params) {
    apiClient.get('search_query_db', params,
    function(data){
		page_loading_requesting = false;
		set_result_table(data);
		$('#nav_search_result').tab('show');
		page_loading_complete = true;
      })
    };

  //scroll change
  $('#lectures_content').scroll(function(){
    if (current_tab == "search"){
      var ele = $(this);
      var scrollHeight = ele.get(0).scrollHeight;
      var scrollTop = ele.scrollTop();
      var scrollBottom = ele.scrollTop() + ele.height();
      var difference = scrollHeight - scrollBottom;
      //현재 scroll 위치 갱신
      search_result_scroll_top = scrollTop;
	}
  });

  //search query
  $('#search_form').submit(function(){
    query_text = $('#search_query_text').val();
    if (query_text.length < 2) {
      alert("2자 이상 입력해주세요");
      return false;
    }
    page = 1;
    page_loading_complete = false;
    filter = get_filter();
    sendSearchQuery({
      year:current_year,
      semester:current_semester,
      filter:filter,
      type:search_type,
      query_text:query_text,
      page:page,
      per_page:per_page
    });
    ga('send', 'event', 'search', search_type, query_text);
    cancel_lecture_selection();
    return false;
  });

  //표의 빈공간 클릭 시 gray-cell 삭제
  $('#timetable tbody td').click(function(){
    cancel_lecture_selection();
  });

  //검색필터 on/off 토글
  $('#search_filter_toggle_button').click(function(){
    var ele = $(this);
    if (ele.attr('state') == 'off'){
      ele.attr('state', 'on').addClass('btn-info').addClass('dropup');
      search_filter_tooltip_message('검색필터가 켜졌습니다.');
      $('#search_filter').slideDown();
    }
    else {
      ele.attr('state', 'off').removeClass('btn-info').removeClass('dropup');
      search_filter_tooltip_message('검색필터가 꺼졌습니다.');
      $('#search_filter').slideUp();
    }
  });
  $('#search_filter').hide();
  //검색필터 라벨 클릭
  $('#search_filter .label').click(function(){
    var ele = $(this);
    if (!ele.hasClass('label-info')) ele.addClass('label-info');
    else ele.removeClass('label-info');
  });
  //검색필터 라벨 더블클릭
  $('#search_filter .label').dblclick(function(){
    var ele = $(this);
    ele.parent().children().removeClass('label-info');
    ele.addClass('label-info');
  }).addSwipeEvents().bind('doubletap', function(evt, touch) {
    var ele = $(this);
    ele.parent().children().removeClass('label-info');
    ele.addClass('label-info');
  });

  $('#search_filter .header').click(function(){
    var header = $(this);
    var selected = header.siblings('.label-info');
    var all = header.siblings('.label');
    //전부 선택되어있으면 전체선택 해제
    if (all.size() == selected.size()){
      all.removeClass('label-info');
    }else {
      all.addClass('label-info');
    }
  });


  function pagedown_element(ele){
    for (var i=0;i<7 && ele.next().length > 0;i++)
      ele = ele.next();
    return ele;
  }

  function pageup_element(ele){
    for (var i=0;i<7 && ele.prev().length > 0;i++)
      ele = ele.prev();
    return ele;
  }

  $('body').keydown(function(e){
    if (e.keyCode == 34 && current_tab == "search"){
      //pagedown
      //선택된 것이 없으면 1번째 row 선택
      if (!selected_row && lectures.length > 0){
        $('#search_result_table tbody tr').first().trigger('click');
        $('#search_query_text').blur();
      }
      else if (selected_row && pagedown_element(selected_row).length > 0){
        pagedown_element(selected_row).trigger('click');
        var new_position = selected_row.position().top - selected_row.parent().position().top + 26 - 110;
        $('#lectures_content').scrollTop(new_position);
        $('#search_query_text').blur();
      }
      return false;
    }
    else if (e.keyCode == 33 && current_tab == "search"){
      //pageup
      if (!selected_row && lectures.length > 0){
        $('#search_result_table tbody tr').first().trigger('click');
        selected_row.addClass('selected');
        $('#search_query_text').blur();
      }
      else if (selected_row && pageup_element(selected_row).length > 0){
        pageup_element(selected_row).trigger('click');
        var new_position = selected_row.position().top - selected_row.parent().position().top + 26 - 110;
        $('#lectures_content').scrollTop(new_position);
        $('#search_query_text').blur();
      }
      return false;
    }
    else if (e.keyCode == 40 && current_tab == "search"){
      //down
      //선택된 것이 없으면 1번째 row 선택
      if (!selected_row && lectures.length > 0){
        $('#search_result_table tbody tr').first().trigger('click');
        $('#search_query_text').blur();
      }
      else if (selected_row && selected_row.next().length > 0){
        selected_row.next().trigger('click');
        set_scroll_to_selected_row();
        $('#search_query_text').blur();
      }
      return false;
    }
    else if (e.keyCode == 38 && current_tab == "search"){
      //up
      if (!selected_row && lectures.length > 0){
        $('#search_result_table tbody tr').first().trigger('click');
        selected_row.addClass('selected');
        $('#search_query_text').blur();
      }
      else if (selected_row && selected_row.prev().length > 0){
        selected_row.prev().trigger('click');
        set_scroll_to_selected_row();
        $('#search_query_text').blur();
      }
      return false;
    }
    //내 강의
    else if (e.keyCode == 40 && current_tab == "my_courses"){
      //down
      //선택된 것이 없으면 1번째 row 선택
      if (!my_courses_selected_row && my_lectures.length > 0){
        $('#my_courses_table tbody tr').first().trigger('click');
        $('#search_query_text').blur();
      }
      else if (my_courses_selected_row && my_courses_selected_row.next().length > 0){
        my_courses_selected_row.next().trigger('click');
        set_scroll_to_my_courses_selected_row();
        $('#search_query_text').blur();
      }
      return false;
    }
    else if (e.keyCode == 38 && current_tab == "my_courses"){
      //up
      if (!my_courses_selected_row && my_lectures.length > 0){
        $('#my_courses_table tbody tr').first().trigger('click');
        $('#search_query_text').blur();
      }
      else if (my_courses_selected_row && my_courses_selected_row.prev().length > 0){
        my_courses_selected_row.prev().trigger('click');
        set_scroll_to_my_courses_selected_row();
        $('#search_query_text').blur();
      }
      return false;
    }
    else if (e.keyCode == 13 && current_tab == "search"){
      //enter
      if (selected_row && $('#search_query_text:focus').size() == 0){
        selected_row.trigger('dblclick');
      }
    }
    else if (e.keyCode == 13 && current_tab == "my_courses"){
      //enter
      if (my_courses_selected_row && $('#search_query_text:focus').size() == 0){
        my_courses_selected_row.trigger('dblclick');
      }
    }
    else {
      //$('#search_query_text').focus();
    }
  });

	set_dropdown_handler();

  //init modal
  $('#init_loading_modal').dialog({
    modal:true,
    hide:"fade",
    resizable:false,
    closeOnEscape:false,
    dialogClass:"no-title",
    autoOpen:true
  });

  //facebook modal
  $('#facebook_loading_modal').dialog({
    modal:true,
    resizable:false,
    closeOnEscape:false,
    dialogClass:"no-title",
    autoOpen:false
  });

  //custom lecture modal
  $('#custom_lecture_modal').dialog({
    modal:true,
    title:"사용자정의 시간표",
    dialogClass:"custom-lecture-dialog",
    width:250,
    height:190,
    open:function(){
      $('#custom_course_title').val("");
      $('#custom_location').val("");
      cancel_lecture_selection();
    },
    close:function(){
      $('#customcell').hide();
      custom_class_time = null;
    },
    resizable:false,
    autoOpen:false
  });

  $('#course_detail_wrapper').hide();

  //강의계획서 버튼
  $('#course_detail_plan_button').click(course_detail_plan_button_handler);

  $('#custom_lecture_close_button').click(function(){
    $('#custom_lecture_modal').dialog('close');
    return false;
  });

  //페이스북에 공유하기
  $('#publish_facebook_toggle_button').click(function(){
    var ele = $(this);
    if (ele.attr('state') == 'off'){
      ele.attr('state', 'on').addClass('dropup');
      $('#facebook_message_wrapper').slideDown();
      $('#facebook_message').focus();
    }
    else {
      ele.attr('state', 'off').removeClass('dropup');
      $('#facebook_message').blur();
      $('#facebook_message_wrapper').slideUp();
    }
    return false;
  });
  $('#facebook_message_wrapper').hide();

  //페이스북에 올리기
  $('#facebook_message_wrapper').submit(function(){
    var ele = $('#publish_facebook_ok_button');
    if (!ele.attr('disabled')){
      ele.attr('disabled', true);

      FB.login(function(response){
        if (response.authResponse){
          var access_token = response.authResponse.accessToken;
          var base64_data = $('.timetable-image').attr('src').replace(/data:image\/png;base64,/, "");
          var message = $("#facebook_message").val();
          apiClient.post('publish_to_facebook', {
            access_token:access_token,
            base64_data:base64_data,
            message:message
          }, function(data){
            $('#publish_facebook_ok_button').removeAttr('disabled');
            $('#facebook_loading_modal').dialog('close');
            if (data.data.error){
              alert('업로드에 실패했습니다.');
            }
            else {
              alert('성공적으로 게시되었습니다!');
              $('#facebook_message').val("");
              $('#facebook_message_wrapper').slideUp();
              $('#publish_facebook_toggle_button').attr('state', 'off').removeClass('dropup');
            }
          });

          $('#facebook_message').blur();
          $('#facebook_loading_modal').dialog('open');
        }
        else {
          alert("페이스북 로그인에 실패했습니다.");
          ele.removeAttr('disabled');
        }
      }, {scope:'publish_stream'});
    }
    return false;
  });

  //custom lecture form submit
  $('#custom_lecture_form').submit(function(){
    var course_title = $('#custom_course_title').val();
    var location = $('#custom_location').val();
    var custom_lecture = {
      course_number : "custom",
      lecture_number : custom_lecture_number++,
      course_title : course_title,
      class_time : custom_class_time,
      location : location,
      color : generate_random_color(),
      credit : 0
    };
    my_lectures.push(custom_lecture);
    refresh_my_courses_table();
    alert(10);
    
    generate_timecell(my_lectures);
    
    //my_lectures[my_lectures.length-1];
   /* alert(my_lectures[my_lectures.length-1].course_title);
    alert(my_lectures[my_lectures.length-1].location);
    alert(my_lectures[my_lectures.length-1].class_time);*/
    
    $("#custom_class_time").val(my_lectures[my_lectures.length-1].class_time+"");
    
    alert( $("#custom_class_time").val());
    $.ajax({
    	url: "${pageContext.request.contextPath}/timetable/main",
    	type:"post",
    	data:$("#custom_lecture_form").serialize(),
    	dataType:"json",
    	success:function(result){
    		alert(result);
    	},
    	error:function(err){
    		alert("error : " +err);
    	}
    });
    
    alert("a");
    my_course_tooltip_message("강의가 추가되었습니다.");
    $('#custom_lecture_modal').dialog('close');
    ga('send', 'event', 'lecture', 'custom_cell', 'create');
    return false;
  });
  
  //contents scroll
  touchScroll('lectures_content');

  //custom time 추가
  function wday_string(wday)
  {
    if (wday == "mon") return "월";
    if (wday == "tue") return "화";
    if (wday == "wed") return "수";
    if (wday == "thu") return "목";
    if (wday == "fri") return "금";
    if (wday == "sat") return "토";
    return "";
  }
  $('#timetable tbody td').mousedown(function(e){
    custom_start_cell = $(this);

    custom_wday = wday_string(custom_start_cell.attr('class'));
    custom_start_time = parseFloat(custom_start_cell.attr('time'));
  }).mousemove(function(e){
    if (custom_start_cell){
      custom_end_cell = $(this);
      custom_end_time = parseFloat(custom_end_cell.attr('time'));
      if (custom_class_time == (custom_wday + "(" + (Math.min(custom_start_time,custom_end_time)) + "-" + (Math.abs(custom_end_time - custom_start_time)+0.5) + ")"))
        return false;

      custom_class_time = custom_wday + "(" + (Math.min(custom_start_time,custom_end_time)) + "-" + (Math.abs(custom_end_time - custom_start_time)+0.5) + ")";
      generate_custom_cell({class_time : custom_class_time});
    }
    return false;
  });
  $('body').mouseup(function(e){
    //선택된 칸이 한칸 이상이어야..
    if (custom_end_cell){
      if (already_exist_class_time({class_time:custom_class_time})){
        alert("강의시간이 겹칩니다.");
        $('#customcell').hide();
        custom_class_time = null;
      }
      else {
        $('#ui-dialog-title-custom_lecture_modal').text('사용자정의 시간표 - ' + custom_class_time);
        $('#custom_lecture_modal').dialog('open');
      }
    }
    custom_start_cell = null;
    custom_end_cell = null;
  });
  //내보내기 네비게이션
  $('#nav_export').click(function(){
    //브라우저가 canvas.toDataURL을 지원할 때에만..
    ga('send', 'event', 'tab', 'export');
   	supportsToDataURL(); 
		if (!supportsToDataURL()){
      alert("현재 사용중인 브라우저에선 이미지 내보내기 기능을 지원하지 않습니다.");
      $('#image_export_wrapper').hide();
    }
    else {
      export_timetable();
    }
    var t_lectures = my_lectures;
    for(var i = 0; i < t_lectures.length ; i++)
    {
      t_lectures[i].course_number += "$";
      t_lectures[i].lecture_number+= "$";
    }
    apiClient.get('export_timetable', {
      year:current_year,
      semester:current_semester,
      my_lectures: my_lectures
    }, function(data){
      $('#saved_timetable_url').attr('href', '/user/'+data.filename).text(window.location.origin + "/user/"+data.filename);
    });
    
    for(var i = 0; i < t_lectures.length ; i++)
    {
      t_lectures[i].course_number = t_lectures[i].course_number.replace("$","");
      t_lectures[i].lecture_number = t_lectures[i].lecture_number.replace("$","");
    }

    $('#content_wrapper').hide();
    $('#social_comment_wrapper').hide();
    $('#export_wrapper').show();
    current_tab = "export";
    cancel_lecture_selection();
  });

  $('#main_navigation a').not('#nav_export').not('#nav_social_comment').not('#semester_label_button').click(function(){
    $('#content_wrapper').show();
    $('#export_wrapper').hide();
    $('#social_comment_wrapper').hide();
    alert(11);
    generate_timecell(my_lectures);
  });
  $('#export_wrapper').hide();
  $('#social_comment_wrapper').hide();

  //소셜댓글 네비게이션
  $('#nav_social_comment').click(function(){
    $('#content_wrapper').hide();
    $('#export_wrapper').hide();
    $('#social_comment_wrapper').show();
    current_tab = "social_comment";
    cancel_lecture_selection();
  });

  $('.search-result-table').disableSelection();
  $('#timetable_container').disableSelection();

  $('.course_detail_toggle').click(function(){
    var ele = $(this);
    var course_detail = $('#course_detail');
    if (course_detail.is(':visible')){
      course_detail.slideUp();
    }
    else {
      course_detail.slideDown();
    }
  });


  //document load end//
});


//파이어폭스 드래그 금지
/*
var omitformtags=["input", "textarea", "select"];
omitformtags=omitformtags.join("|");
function disableselect(e){
  if (omitformtags.indexOf(e.target.tagName.toLowerCase())==-1)
    return false;
}
function reEnable(){
  return true;
}
if (typeof document.onselectstart!="undefined")
  document.onselectstart=new Function ("return false")
else {
  document.onmousedown=disableselect;
  document.onmouseup=reEnable;
}
*/
//drag prevention
(function($){
$.fn.disableSelection = function() {
    return this.each(function() {
        $(this).attr('unselectable', 'on')
               .css({
                   '-moz-user-select':'none',
                   '-webkit-user-select':'none',
                   'user-select':'none',
                   '-ms-user-select':'none'
               })
               .each(function() {
                   this.onselectstart = function() { return false; };
               });
    });
};

})(jQuery);
