// GLOBAL VARIABLES
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
  {border:"#BA313B",plane:"#d6d6d6"}, // pink/red
  {border:"#BA6C31",plane:"#FFCFB2"},  // skin-tone/brown
  {border:"#1579C2",plane:"#ffe229"}, // light blue
  {border:"#2B8728",plane:"#B6F9B2"}, // green
  {border:"#45B2B8",plane:"#BFF7F8"}, // really light blue
 
  {border:"#A337A1",plane:"#F6B5F5"}, // purple
  {border:"#B8991B",plane:"#FFF49A"} // beige/yello
  
  
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

var userNoColor=[]; //userNo에 해당하는 색깔지정
var checkedUserNo=[]; //체크된 userNo
$(function(){
	selectUserNos();
	
	$(document).on("click","input[type='checkbox']",function(){
		checkedUserNo=[];
		$(":checked").each(function(index,item){
			//alert(index);
			checkedUserNo[index]=$(item).attr("id");
			
			
		})
		//alert(checkedUserNo[0]);
		selectAll();
		// alert($(this).attr("id"));
	});
});

function selectUserNos(){
	$.ajax({
		url:commonUrl+"/timetable/selectUserNos",
		type:"post",
		data:"projectNo="+projectNo+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val(),
		dataType:"json",
		success:function(result){
			// alert(result);
			var str="";
			$(result).each(function(index,item){
				// alert(index);
				// item.userDTO.userName
				str+='<label id="checkboxLabel" for="'+item.timetableDTO.userNo+'" class="btn" style="background-color:'+colors[index].plane+';color:white;border-width:0px">'+item.userName+'<input type="checkbox" id="'+item.timetableDTO.userNo+'" class="badgebox"><span class="badge" style="background-color:white;color:'+colors[index].plane+';">&check;</span></label>';
				 var tempUserNoColor = {
					      userNo : item.timetableDTO.userNo,
					      color : colors[index],
					     
					    };
				
				userNoColor.push(tempUserNoColor);
			})
			$("#checkboxUserNo").html(str);
		},
		error:function(err){
			alert("err : "+err);
		}
	});
}

function selectAll(){
	// 초기화작업
	my_lectures = [];
    refresh_my_courses_table();
	$.ajax({
		url:commonUrl+"/timetable/teamSelectAll",
		type:"post",
		data:"projectNo="+projectNo+"&"+$("#securityInfo").attr("name")+"="+$("#securityInfo").val(),
		dataType:"json",
		success:function(result){
			// alert(result);
			var colorNum=0;
			$('.timecell-container').remove();
			  var unitcell_width = $('#timetable_container td.mon').outerWidth();
			  var unitcell_height = $('#timetable_container td.mon').outerHeight();
			  var leftcell_width = $('#timetable tbody th').outerWidth();
			  var topcell_height = $('#timetable thead th').outerHeight();
			  var border_weight = 1;
			  
			$.map(result,function(value,index){
				// index => key값
				// value => list값
				for(var k=0;k<checkedUserNo.length;k++){
					if(checkedUserNo[k]==index){
						colorNum++;
						$(value).each(function(i,timetableDTO){
							// alert(index+"의 과목명 : "+val.timetableSubject);
							custom_lecture_number=timetableDTO.timetableNo;
							
							 var cellColors;
							 for(var i=0;i<userNoColor.length;i++){
								 if(index==userNoColor[i].userNo){
									 cellColors=userNoColor[i].color;
								 }
							 }
							//alert("색상은..?"+cellColors.plane);
							 
							 var custom_lecture = {
								      course_number : "custom",
								      lecture_number : custom_lecture_number,
								      course_title : timetableDTO.timetableSubject,
								      class_time : timetableDTO.timetableClassInfo,
								      location : timetableDTO.timetableLocation,
								      color : colors[colorNum],
								      userNo : index
								    };
								    my_lectures.push(custom_lecture);
						      var wday = wday_to_num(timetableDTO.timetableClassInfo.charAt(0));
						      var start_time = parseFloat(timetableDTO.timetableClassInfo.replace(/[()]/g,"").split('-')[0].slice(1))*2;
						      var duration = parseFloat(timetableDTO.timetableClassInfo.replace(/[()]/g,"").split('-')[1])*2;
						     // alert("요일 : "+wday);
						     // alert("시작 : "+start_time);
						     // alert("지속 : "+duration);
						      // 기준 셀
						      var criteria_cell = $($('#timetable td')[6*start_time+wday]);
						      var criteria_cell2;
						      var criteria_cell3 = $($('#timetable td')[6*(start_time+duration-1)+wday]);
						      if (wday == 5 || wday == 4) criteria_cell2 = criteria_cell.prev();
						      else criteria_cell2 = criteria_cell.next();
						      
						      //alert("aaaa"+criteria_cell3.position().top);
						      var width = Math.abs(criteria_cell2.position().left - criteria_cell.position().left) + border_weight;
						      var height = criteria_cell3.position().top - criteria_cell.position().top+criteria_cell3.innerHeight() +2* border_weight;
						      var left = criteria_cell.position().left - criteria_cell.parent().position().left;
						      var top = criteria_cell.position().top - criteria_cell.parent().parent().position().top + topcell_height;

						     /*
								 * alert("width:"+width);
								 * alert("height:"+height); alert("left:"+left);
								 * alert("top:"+top);
								 */
						      // create container
						      // cell색칠하는부분
						    //  var cellColors=timetableDTO.timetableColor.split(";");
						      var container = $('<div></div>').addClass('timecell-container').appendTo($('#timecells_container'));
						      //alert(cellColors.plane)
						      var tdiv = $('<div></div>').addClass('timecell').width(width).height(height).css('left', left).css('top', top).css('background-color', cellColors.plane).css('color', cellColors.border).appendTo(container);
						      var tdivc = $('<div class="timecellinfo-containter">').appendTo(tdiv);
						      $('<span></span>').text(timetableDTO.timetableSubject).appendTo(tdivc);
						      
						      $('<br />').appendTo(tdivc);
						      $('<span></span>').text(timetableDTO.timetableLocation).appendTo(tdivc);
						      
						      // gray cell이면 gray-cell 클래스 추가
						    /*
							 * if (lecture.color == gray_color)
							 * tdiv.addClass('gray-cell');
							 * 
							 * alert(lecture.course_number);
							 * alert(lecture.lecture_number);
							 */
						      tdiv.attr('course-number', 'custom').attr('lecture-number', timetableDTO.timetableNo);
					
					});
				}
				
				
				
				      
				}
				
				
				//cancel_lecture_selection();
				
			});
			
			/*
			 * $('.timecell-container').remove(); var unitcell_width =
			 * $('#timetable_container td.mon').outerWidth(); var
			 * unitcell_height = $('#timetable_container td.mon').outerHeight();
			 * var leftcell_width = $('#timetable tbody th').outerWidth(); var
			 * topcell_height = $('#timetable thead th').outerHeight(); var
			 * border_weight = 1; $(result).each(function(index,timetableDTO){
			 * alert("테이블번호여:"+timetableDTO.timetableNo);
			 */
			// handlingOverlap(my_lectures);
		},
		error:function(err){
			alert("에러발생 : "+err);
		}
	});
}

function handlingOverlap(lecture){
	
	var m0=new Map();
	var m1=new Map();
	var m2=new Map();
	var m3=new Map();
	var m4=new Map();
	var m5=new Map();
	// m0.set(key,value);
	
	// alert(m0.get(1));
	
	for(var i=0;i<lecture.length;i++){
		
			    
		var mylec=lecture[i];
		 var custom_lecture = {
			      course_number : "custom",
			      lecture_number : custom_lecture_number,
			      course_title : timetableDTO.timetableSubject,
			      class_time : timetableDTO.timetableClassInfo,
			      location : timetableDTO.timetableLocation,
			      color : colors[colorNum],
			      userNo : index
			    };
			    my_lectures.push(custom_lecture);
		var wday = wday_to_num(mylec.class_time.charAt(0));
	    var start_time = parseFloat(mylec.class_time.replace(/[()]/g,"").split('-')[0].slice(1))*2;
	    var duration = parseFloat(mylec.class_time.replace(/[()]/g,"").split('-')[1])*2;
	    var colors=mylec.color.plane+";"+mylec.color.border;
	    for(var j=start_time;j<start_time+duration;j++){
	    	if(eval('m'+wday).get(j)!=null){
	    		eval('m'+wday).set(j,(eval('m'+wday).get(j))+"|"+colors); 
	    	}else{
	    		eval('m'+wday).set(j,colors);
	    	}	
	    }
	  	// alert(mylec.class_time);
	}
	
	// for(var i=0;i<6;i++){
		// alert("bb");
		/*
		 * $.map(m0,function(val,index){ alert("Aa"); if(val.indexOf('|')!=-1){
		 * alert("인덱스여:"+index); alert("val이여:"+val); }
		 * 
		 * });
		 */
	
	var unitcell_width = $('#timetable_container td.mon').outerWidth();
	  var unitcell_height = $('#timetable_container td.mon').outerHeight();
	  var leftcell_width = $('#timetable tbody th').outerWidth();
	  var topcell_height = $('#timetable thead th').outerHeight();
	  var border_weight = 1;
		for(var i=0;i<6;i++){
			var temp=0;
			
			eval('m'+i).forEach(function(value,key,mapObj){
				// var duration=0;
				
				if(value.indexOf("|")!=-1){
					if(key<=temp) return true;
					// if(key<=temp)
					alert(i+'요일의'+key+" : "+value);
					// alert("이거되냐:"+mapObj.get(++key));
					var result=getTemp(value,key,mapObj).split("|");
					// duration=result[0];
					temp=result[1];
					/*
					 * alert("key:"+key); alert("duration:"+duration);
					 * alert("temp:"+temp);
					 */
					
					// alert("duration:"+duration);
					 var wday =i;
				     var start_time = key;
				     var duration = result[0];
				    /*
					 * alert("요일 : "+wday); alert("시작 : "+start_time); alert("지속 :
					 * "+duration);
					 */
				      // 기준 셀
				      var criteria_cell = $($('#timetable td')[6*start_time+wday]);
				      var criteria_cell2;
				     // alert(6*(start_time+duration-1)+wday);
				      var criteria_cell3 = $($('#timetable td')[6*(start_time+duration-1)+wday]);
				      
				      if (wday == 5 || wday == 4) criteria_cell2 = criteria_cell.prev();
				      else criteria_cell2 = criteria_cell.next();
				      
				      //alert(criteria_cell3.position());
				      var width = Math.abs(criteria_cell2.position().left - criteria_cell.position().left) + border_weight;
				      var height = criteria_cell3.position().top - criteria_cell.position().top+criteria_cell3.innerHeight() +2* border_weight;
				      var left = criteria_cell.position().left - criteria_cell.parent().position().left;
				      var top = criteria_cell.position().top - criteria_cell.parent().parent().position().top + topcell_height;

				     /*
						 * alert("width:"+width); alert("height:"+height);
						 * alert("left:"+left); alert("top:"+top);
						 */;
				      // create container
				      // cell색칠하는부분
				      var cellColors=timetableDTO.timetableColor.split(";");
				      var container = $('<div></div>').addClass('timecell-container').appendTo($('#timecells_container'));  				
				      var tdiv = $('<div></div>').addClass('timecell').width(width).height(height).css('left', left).css('top', top).css('background-color', "#FFB2BC").css('color', "#BA313B").appendTo(container);
				      var tdivc = $('<div class="timecellinfo-containter">').appendTo(tdiv);
				     // $('<span></span>').text(timetableDTO.timetableSubject).appendTo(tdivc);
				      
				      $('<br />').appendTo(tdivc);
				     // $('<span></span>').text(timetableDTO.timetableLocation).appendTo(tdivc);
				}
			});
		}	
}

function getTemp(value,key,mapObj){
	var duration=1;
	while(true){
		if(value==mapObj.get(++key)){
			duration++;
		}else{
			return duration+"|"+key;
		}
	}
}

$(window).resize(function(){
    selectAll();
});

function wday_to_num(wday){
  if (wday == "월") return 0;
  if (wday == "화") return 1;
  if (wday == "수") return 2;
  if (wday == "목") return 3;
  if (wday == "금") return 4;
  if (wday == "토") return 5;
  return -1;
}

(jQuery);
