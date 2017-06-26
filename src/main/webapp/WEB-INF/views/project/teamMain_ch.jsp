<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
   <meta name="viewport" content="width=device-width" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   
   <title>개미와 베짱이, 대학조별과제 관리시스템</title>
   <!--   Core JS Files   -->
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
   <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
   <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
   <!-- Bootstrap core CSS     -->
   <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet" />
   <!-- Animation library for notifications   -->
   <link href="${pageContext.request.contextPath }/resources/css/animate.min.css" rel="stylesheet" />
   <!--  Paper Dashboard core CSS    -->
   <link href="${pageContext.request.contextPath }/resources/css/paper-dashboard.css" rel="stylesheet" />
   <!--  Fonts and icons     -->
   <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
   <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
   <link href="${pageContext.request.contextPath }/resources/css/themify-icons.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath }/resources/css/chat.css" rel="stylesheet">
   
   <!-- 필요한 css는 이 밑에 넣어주면 됨 -->
 <style>
 .progress{
    width: 150px;
    height: 150px;
    line-height: 150px;
    background: none;
    margin: 0 auto;
    box-shadow: none;
    position: relative;
}
.progress:after{
    content: "";
    width: 100%;
    height: 100%;
    border-radius: 50%;
    border: 12px solid #fff;
    position: absolute;
    top: 0;
    left: 0;
}
.progress > span{
    width: 50%;
    height: 100%;
    overflow: hidden;
    position: absolute;
    top: 0;
    z-index: 1;
}
.progress .progress-left{
    left: 0;
}
.progress .progress-bar{
    width: 100%;
    height: 100%;
    background: none;
    border-width: 12px;
    border-style: solid;
    position: absolute;
    top: 0;
}
.progress .progress-left .progress-bar{
    left: 100%;
    border-top-right-radius: 80px;
    border-bottom-right-radius: 80px;
    border-left: 0;
    -webkit-transform-origin: center left;
    transform-origin: center left;
}
.progress .progress-right{
    right: 0;
}
.progress .progress-right .progress-bar{
    left: -100%;
    border-top-left-radius: 80px;
    border-bottom-left-radius: 80px;
    border-right: 0;
    -webkit-transform-origin: center right;
    transform-origin: center right;
    animation: loading-1 1.8s linear forwards;
}
.progress .progress-value{
    width: 90%;
    height: 90%;
    border-radius: 50%;
    background: #44484b;
    font-size: 24px;
    color: #fff;
    line-height: 135px;
    text-align: center;
    position: absolute;
    top: 5%;
    left: 5%;
}
.progress.blue .progress-bar{
    border-color: #049dff;
}
.progress.blue .progress-left .progress-bar{
    animation: loading-2 1.5s linear forwards 1.8s;
}
.progress.yellow .progress-bar{
    border-color: #fdba04;
}
.progress.yellow .progress-left .progress-bar{
    animation: loading-3 1s linear forwards 1.8s;
}
.progress.pink .progress-bar{
    border-color: #ed687c;
}
.progress.pink .progress-left .progress-bar{
    animation: loading-4 0.4s linear forwards 1.8s;
}
.progress.green .progress-bar{
    border-color: #1abc9c;
}
.progress.green .progress-left .progress-bar{
    animation: loading-5 1.2s linear forwards 1.8s;
}
 @keyframes loading-1{
    0%{
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100%{
        -webkit-transform: rotate(180deg);
        transform: rotate(180deg);
    }
} 
@keyframes loading-2{
    0%{
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100%{
        -webkit-transform: rotate(180deg);
        transform: rotate(180deg);
    }
}
@keyframes loading-3{
    0%{
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100%{
        -webkit-transform: rotate(90deg);
        transform: rotate(90deg);
    }
}
@keyframes loading-4{
    0%{
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100%{
        -webkit-transform: rotate(36deg);
        transform: rotate(36deg);
    }
}
@keyframes loading-5{
    0%{
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100%{
        -webkit-transform: rotate(126deg);
        transform: rotate(126deg);
    }
}
@media only screen and (max-width: 990px){
    .progress{ margin-bottom: 20px; }
}
.pricing-option{
	height: 240px;
	padding: 10px;
}
.card-header{
	height: 20%;
}
.card-body{
	height: 65%;
}
.card-footer{
	height: 15%;
}

@import url(https://fonts.googleapis.com/css?family=Josefin+Sans:400,300,300italic,400italic,600,700,600italic,700italic);
body {
  font-family: "Josefin Sans", sans-serif;
  line-height: 1;
  height: 100%;
  background: #eee;
}

.demo-title {
  font-size: 3rem;
  margin-bottom: 50px;
}

.pricing-table {
  display: table;
  width: 100%;
}
.pricing-table .pricing-option {
  width: 28%;
  background: white;
  float: left;
  padding: 2%;
  -webkit-transition: all .3s ease-in-out;
  transition: all .3s ease-in-out;
}
.pricing-table .pricing-option:nth-child(even) {
  margin: 0 8%;
}
.pricing-table .pricing-option:hover {
  cursor: pointer;
  box-shadow: 0px 2px 30px rgba(0, 0, 0, 0.3);
  -webkit-transform: scale(1.04);
          transform: scale(1.04);
}
.pricing-table .pricing-option:hover i, .pricing-table .pricing-option:hover h1, .pricing-table .pricing-option:hover span, .pricing-table .pricing-option:hover b {
  color: #F85E6A;
}
.pricing-table .pricing-option:hover .front {
  opacity: 0;
  visibility: hidden;
}
.pricing-table .pricing-option:hover .back {
  opacity: 1 !important;
  visibility: visible !important;
}
.pricing-table .pricing-option:hover .back a.button {
  -webkit-transform: translateY(0px) !important;
          transform: translateY(0px) !important;
}
.pricing-table .pricing-option hr {
  border: none;
  border-bottom: 1px solid #F0F0F0;
}
.pricing-table .pricing-option i {
  font-size: 3rem;
  color: #D8D8D8;
  -webkit-transition: all .3s ease-in-out;
  transition: all .3s ease-in-out;
}
.pricing-table .pricing-option h1 {
  margin: 10px 0;
  color: #212121;
  -webkit-transition: all .3s ease-in-out;
  transition: all .3s ease-in-out;
}
.pricing-table .pricing-option p {
  color: #999;
  padding: 0 10px;
  line-height: 1.3;
}
.pricing-table .pricing-option .price {
  position: relative;
}
.pricing-table .pricing-option .price .front span.price {
  font-size: 2rem;
  text-transform: uppercase;
  margin-top: 20px;
  display: block;
  font-weight: 700;
  position: relative;
}
.pricing-table .pricing-option .price .front span.price b {
  position: absolute;
  font-size: 1rem;
  margin-left: 2px;
  font-weight: 600;
}
.pricing-table .pricing-option .price .back {
  opacity: 0;
  visibility: hidden;
  -webkit-transition: all .3s ease-in-out;
  transition: all .3s ease-in-out;
}
.pricing-table .pricing-option .price .back a.button {
  background: #F85E6A;
  padding: 15px 20px;
  display: inline-block;
  text-decoration: none;
  color: white;
  position: absolute;
  font-size: 13px;
  top: -5px;
  left: 0;
  right: 0;
  width: 150px;
  margin: auto;
  text-transform: uppercase;
  -webkit-transform: translateY(20px);
          transform: translateY(20px);
  -webkit-transition: all .3s ease-in-out;
  transition: all .3s ease-in-out;
}
.pricing-table .pricing-option .price .back a.button:hover {
  background: #f62d3d;
}

@media screen and (max-width: 600px) {
  .pricing-table .pricing-option {
    padding: 5%;
    width: 90%;
  }
  .pricing-table .pricing-option:nth-child(even) {
    margin: 30px 0 !important;
  }
}

 </style>
   <!-- 스크립트는 body 맨 아래쪽에 -->
</head>
<body>
   <div class="wrapper">
      <jsp:include page="sidebar_ch.jsp" />
      <div class="main-panel">
         <jsp:include page="header_ch.jsp" flush="false" /> <!-- </nav> -->
        
        <h2 align="center">${projectTitle}</h2>
         <div class="content" style="padding-top: 20px; margin-left: 15px" align="center">
            <div class="container-fluid">
               <!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
               <!-- 
                  작성할때 template.html 에서
                  <div class="row">부터 참고하면서 작성하면 됨
               -->
				
				<!-- <span class="pricing-table">
				<span class="pricing-option">
			        d
			    </span>
			    </span> -->
			    
               	<div class="pricing-table row" style="margin-bottom: 10px">
               		<div class="pricing-option col-lg-6">
               			<input type="hidden" value="${pageContext.request.contextPath}/project/teamInfo"/>
	            			<div class="card-header">
	            				<h5><span class="ti-time"> 조별과제 남은 일정</h5>
	            			</div>
	            			<div class="card-body"> 
		            			<div class="progress yellow">
					                <span class="progress-left">
					                    <span class="progress-bar"></span>
					                </span>
					                <span class="progress-right">
					                    <span class="progress-bar"></span>
					                </span>
					                <div class="progress-value">${result*-1}%</div>
					            </div>
				            </div>
				            <div class="card-footer">
	              			<h6 align="right"><a href="#" style="color: #00e0d9">detail</a></span></h6>
	              			</div>
	           		</div>
	           		
	           		<div class="pricing-option col-lg-6">
	           			<input type="hidden" value="#"/>
	            			<div class="card-header">
	            				<h5><span class="ti-light-bulb"/> 오늘의 명언</h5>
	            			</div>
	            			<div class="card-body" style="border-top: 1px gray solid;padding-top: 9px">
	              				<!-- 내용을 넣을 공간 -->
	              				${arr1}<br><br>
	              				<strong>${arr2}</strong>
	              			</div>
				            <div class="card-footer">
	              				<h6 align="right"><a href="#" style="color: #00e0d9">detail</a></span></h6>
	              			</div>
	           		</div>
	           		<div class="pricing-option col-lg-6">
	           			<input type="hidden" value="#"/>
	           				<img height="200px" src="${pageContext.request.contextPath}/resources/img/wanted.png"/>
	           		</div>
	          	</div>
	          	<br>
	            <div class="pricing-table row">
               		<div class="pricing-option col-lg-6">
               			<input type="hidden" value="${pageContext.request.contextPath}/projectCalendar/projectCalendar"/>
	            			<div class="card-header">
	            				<h5><span class="ti-calendar"/> 오늘의 계획</h5>
	            			</div>
	              			<div class="card-body">
	              				<!-- 내용을 넣을 공간 -->
	              				<div class="panel status panel-success" >
					                <div class="panel-heading">
					                    <h1 class="panel-title text-center">${todayDate}</h1>
					                </div>
					                <div class="panel-body text-center">                        
											<c:forEach items="${map}" var="map" varStatus="status">
				              					<c:if test="${status.count<3}">
				              						<font style="font-size: small;">${map.key} ${map.value}</font><br>
				              					</c:if>
				              					<c:if test="${status.count==3}">
				              						:<br>
				              					</c:if>
				              				</c:forEach>
					                </div>
					            </div>
	              			</div>
	              			<div class="card-footer">
	              				<h6 align="right"><a href="#" style="color: #00e0d9">detail</a></span></h6>
	              			</div>
	           		</div>
	           		<div class="pricing-option col-lg-6">
	           			<input type="hidden" value="${pageContext.request.contextPath}/vote/"/>
	            			<div class="card-header">
	            				<h5><span class="ti-menu-alt"/> 최신 투표항목</h5>
	            			</div>
	            			<div class="card-body" style="margin-bottom: 0px">
	            				<div class="col-lg-11" style="margin-left: 15px">
	            				<div class="card" style="height: 125px">
	              				<!-- 내용을 넣을 공간 -->
	              				<div class="well"  style="height: 40px; padding:5px; vertical-align: middle;"><Strong id="well" style="vertical-align: middle;">Q. ${vote.voteTitle}</Strong></div>
	              				<div align="left">
	              					<c:forEach items="${voteDetails}" var="voteDetail" varStatus="status">
	              						<c:if test="${status.count<voteDetails.size()}">
	              						<font style="font-size: small;vertical-align: middle;"><span class="ti-control-record"/>　${voteDetail.voteDetailColumn}</font><br>
	              						</c:if>
	              						<c:if test="${status.count==voteDetails.size()}">
	              						　　　:
	              						</c:if>
	              					</c:forEach>
	              				</div>
	              				</div>
	              				</div>
	              			</div>
	              			<div class="card-footer">
	              				<h6 align="right"><a href="#" style="color: #00e0d9">detail</a></span></h6>
	              			</div>
	           		</div>
	           		<div class="pricing-option col-lg-6">
	           			<input type="hidden" value="${pageContext.request.contextPath}/storage/storageTable/${projectNo}"/>
	            			<div class="card-header">
	              				<h5><span class="ti-save"/> 자료실 수용량</h5>
	              			</div>
	              			<div class="card-body">
	              			<div class="col-lg-11" style="margin-left: 15px">
	              				<!-- 내용을 넣을 공간 -->
	              				<br>
	              				<table>
	              					<tr>
	              						<td width="35%"><div style="color:#b4aba2;width: 100%;height: 60px;"><h1 align="center"><sapn class="ti-server"/></h1></div></td>
	              						<td width="65%" valign="bottom" align="right"><font style="font-size: xx-large;color: #5c4cf0" id="size">${totalFileSize}</font><font style="font-size: medium;color: #ecb14b " id="byte">Byte</font></td>
	              					</tr>
	              				</table>
	              			</div>
	              			</div>
	              			<div class="card-footer">
	              				<h6 align="right"><a href="#" style="color: #00e0d9">detail</a></span></h6>
	              			</div>
	           		</div>
	          	</div>
              
            </div>
         </div>
         
         
	     <c:import url="/project/chat"/> <!-- 이거 위치를 바꿔가면서 -->
         
         
         <jsp:include page="footer_ch.jsp" flush="false" />
      </div>
   </div>
   
  
   <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js" type="text/javascript"></script>
   <!--  Checkbox, Radio & Switch Plugins -->
   <script src="${pageContext.request.contextPath }/resources/js/bootstrap-checkbox-radio.js"></script>
   <!--  Charts Plugin -->
   <script src="${pageContext.request.contextPath }/resources/js/chartist.min.js"></script>
   <!--  Notifications Plugin    -->
   <script src="${pageContext.request.contextPath }/resources/js/bootstrap-notify.js"></script>
   <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
   <script src="${pageContext.request.contextPath }/resources/js/paper-dashboard.js"></script>
   <!-- 필요한 자바스크립트 파일은 여기에 넣어주면 됨 -->
   <script src="${pageContext.request.contextPath }/resources/js/sockjs.js"></script>
   <script src="${pageContext.request.contextPath }/resources/js/jquery.timeago.js"></script>
   <script>
   var bytes = parseInt(${totalFileSize});
   var s = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
   var e = Math.floor(Math.log(bytes)/Math.log(1024));
  
   if(e == "-Infinity"){
	   $("#size").text("0");
	   $("#byte").text(" "+s[0]);
   }
   else{
	   $("#size").text((bytes/Math.pow(1024, Math.floor(e))).toFixed(2));
	   $("#byte").text(" "+s[e]);
   }
   
   $(".pricing-option").dblclick(function(){
		location.href=$(this).children().val();
	})
   $(document).on('click', '.panel-heading span.icon_minim', function (e) {
	    var $this = $(this);
	    if (!$this.hasClass('panel-collapsed')) {
	    	$(".panel-footer").hide();
	        $this.parents('.panel').find('.panel-body').slideUp();
	        $this.addClass('panel-collapsed');
	        $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
	    } else {
	    	$(".panel-footer").show();
	        $this.parents('.panel').find('.panel-body').slideDown();
	        $this.removeClass('panel-collapsed');
	        $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
	    }
	});

	$(document).on('focus', '.panel-footer input.chat_input', function (e) {
	    var $this = $(this);
	    if ($('#minim_chat_window').hasClass('panel-collapsed')) {
	        $this.parents('.panel').find('.panel-body').slideDown();
	        $('#minim_chat_window').removeClass('panel-collapsed');
	        $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
	    }
	});

	$(document).on('click', '#new_chat', function (e) {
	    var size = $( ".chat-window:last-child" ).css("margin-left");
	     size_total = parseInt(size) + 400;
	    alert(size_total);
	    var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
	    clone.css("margin-left", size_total);
	});

	$(document).on('click', '.icon_close', function (e) {
	    //$(this).parent().parent().parent().parent().remove();
	    $( "#chat_window_1" ).remove();
	});






	// 
	$(document).ready(function() {
		$("time.timeago").timeago();

		$("#btn-chat").click(function() {
			sendMessage();
		});

		$('#btn-input').keyup(function(e) {
			if (e.keyCode == 13)
				sendMessage();
		});

		$("#panel-body").scrollTop($("#panel-body")[0].scrollHeight);

	});//ready끝


	//WebSocket을 지정한 URL로 연결한다
	//서버랑 연결 -> 에코핸들러가서 출력
	var sock = new SockJS("${pageContext.request.contextPath}/echo");
	//WebSocket 서버에서 메시지를 보내면 자동으로 실행된다
	//var onMessage = function onMessage //변수
	sock.onmessage = onMessage;

	// WebSocket과 연결을 끊고 싶을 때 실행하는 메소드다
	// sock.onclose = onClose;

	var name = '${userDTO.userName}';
	// name에 로그인된 사람 이름이 저장	

	function removeTag(str) {
		return str.replace(/(<([^>]+)>)/ig, "");
	}

	function getTimeStamp() {
	  var d = new Date();
	  d.setHours(d.getHours()-9); // KST 표준시랑 맞지 않아서 9시간 뺌 9시간 전값이 저장 ㅎㅎ
	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + 'T' +
		
	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2)+'Z';

	  return s;
	}

	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}


	function sendMessage() {
		if ($("#btn-input").val() != "") {
			//WebSocket으로 메시지를 전달한다.
			var beforeText = $("#btn-input").val();
			var afterText = removeTag(beforeText);
			var currTime = getTimeStamp();
			sock.send(name + '#sep@' + afterText +'#time@'+ currTime);
			// var userId = ${session.userId};
			
			$('#btn-input').val("");
			$('#btn-input').focus();
		} else {
			return;
		}
	}

	// evt 파라미터는 WebSocket이 보내준 데이터다
	// 변수안에 function을 넣음. 변수 생략 가능
	function onMessage(evt) {
		var data = evt.data;

		var seperatorIndex = data.indexOf('#sep@');
		var seperatorIndex2 = data.indexOf('#time@');
		var userName = data.substring(0, seperatorIndex);
		var chatMessage = data.substring(seperatorIndex + 5, seperatorIndex2);
		var currTime = getTimeStamp();
		if (name === userName) {
			var myMessage = '<div class="row msg_container base_sent"><div class="col-md-10 col-xs-10">';
			myMessage += '<div class="messages msg_sent"><p id="data">'
					+ chatMessage + '</p><time class="timeago" datetime="'+currTime+'"></time>'
					+ '<time>${userDTO.userName} •&nbsp;</time></div></div>';
			myMessage += '<div class="col-md-2 col-xs-2 avatar"><img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class="img-responsive"></div></div>';
		} else {
			var myMessage = '<div class="row msg_container base_receive"><div class="col-md-2 col-xs-2 avatar">';
			myMessage += '<img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">';
			myMessage += '</div><div class="col-md-10 col-xs-10"><div class="messages msg_receive"><p>'
					+ chatMessage + '</p><time>'+ userName + ' •&nbsp;</time>' + '<time class="timeago" datetime="'+currTime+'"></time></div></div></div>';
		}
		
		var myMessage = $("#panel-body").last().append(myMessage);
		$("#panel-body").scrollTop($("#panel-body")[0].scrollHeight);
		$("time.timeago").timeago();
	}

</script>
</body>
</html>