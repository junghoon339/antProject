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
   
   <title>Insert title here</title>
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
   <!-- 스크립트는 body 맨 아래쪽에 -->
</head>
<body>
   <div class="wrapper">
      <jsp:include page="sidebar_ch.jsp" />
      <div class="main-panel">
         <jsp:include page="header_ch.jsp" flush="false" /> <!-- </nav> -->
         <div class="content">
            <div class="container-fluid">
               <!-- 이곳에 내용작성!!!!!!!!!!!!!!!! -->
               <!-- 
                  작성할때 template.html 에서
                  <div class="row">부터 참고하면서 작성하면 됨
               -->
               
               

            </div>
         </div>
	     <c:import url="/project/chat"/> <!-- 이거 위치를 바꿔가면서 -->
         <jsp:include page="footer_ch.jsp" flush="false" />
      </div>
   </div>
   
   <!--   Core JS Files   -->
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
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