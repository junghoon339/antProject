<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="sysdate" class="java.util.Date" />
<fmt:formatDate value="${sysdate}" pattern="HH:mm:ss" var="sysdate" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/chat.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.timeago.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/chat.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
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
</head>
<body>
	<div class="container">
		<div class="row chat-window col-xs-5 col-md-3" id="chat_window_1"
			style="margin-left: 10px;">
			<div class="col-xs-12 col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading top-bar">
						<div class="col-md-8 col-xs-8">
							<h3 class="panel-title">
								<span class="glyphicon glyphicon-comment"></span> xx 조별과제 채팅
							</h3>
						</div>
						<div class="col-md-4 col-xs-4" style="text-align: right;">
							<a href="#"><span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"></span></a> 
								<!-- <a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a> -->
						</div>
					</div>
					<!-- 채팅은 이 안에 들어와야 함 -->
					<div class="panel-body msg_container_base" id="panel-body">

						<c:set var="sep" value="${fn:escapeXml('#sep@')}" />
						<c:set var="sep2" value="${fn:escapeXml('#time@')}" />
						<c:set var="userName" value="${userDTO.userName}" />
						<c:forEach var="chats" items="${chatList}" varStatus="i">
							<c:set var="name" value="${fn:substring(chatList[i.index], 0, fn:indexOf(chatList[i.index], sep))}" />
							<c:set var="content" value="${fn:substring(chatList[i.index], fn:indexOf(chatList[i.index],sep)+5, fn:indexOf(chatList[i.index], sep2))}" />
							<c:set var="contentTime" value="${fn:substring(chatList[i.index], fn:indexOf(chatList[i.index],sep2)+6, fn:length(chatList[i.index]))}" />
							
							<c:choose>
								<c:when test="${name!=userName}">
									<!-- 받는놈 = 팀원 -->
									<div class="row msg_container base_receive">
										<div class="col-md-2 col-xs-2 avatar">
											<img
												src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg"
												class=" img-responsive ">
										</div>
										<div class="col-md-10 col-xs-10">
											<div class="messages msg_receive">
												<p>
													<c:out value="${content}" escapeXml="false" />
												</p>
												<time>${name} •&nbsp;</time><time class="timeago" datetime="${contentTime}"></time>
											</div>
										</div>
									</div>
								</c:when>
								
								<c:otherwise>
									<!-- 보내는 놈 = 나 -->
									<div class="row msg_container base_sent">
										<div class="col-md-10 col-xs-10">
											<div class="messages msg_sent">
												<p id="data">
													<c:out value="${content}" escapeXml="false" />
												</p>
												<time class="timeago" datetime="${contentTime}"></time><time>${name} •&nbsp;</time>
											</div>
										</div>
										<!-- 프사 부분 -->
										<div class="col-md-2 col-xs-2 avatar">
											<img
												src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg"
												class=" img-responsive ">
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="btn-input" type="text"
								class="form-control input-sm chat_input"
								placeholder="Write your message here..." /> <span
								class="input-group-btn">
								<button class="btn btn-primary btn-sm" id="btn-chat">Send</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>