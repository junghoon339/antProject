<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/chat.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/chat.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn-chat").click(function() {
			sendMessage();
		});
	});
	//WebSocket을 지정한 URL로 연결한다
	//서버랑 연결 -> 에코핸들러가서 출력
	var sock = new SockJS("${pageContext.request.contextPath}/user/chat");
	//WebSocket 서버에서 메시지를 보내면 자동으로 실행된다
	//var onMessage = function onMessage //변수
	sock.onmessage = onMessage;

	//WebSocket과 연결을 끊고 싶을 때 실행하는 메소드다
	sock.onclose = onClose;

	/*     sock.onopen = function() {
	    sock.send( $("#message").val() +"<br/>");
	}; */
	function sendMessage() {

		//WebSocket으로 메시지를 전달한다.
		sock.send($("#message").val() + "<br/>");
	}

	// evt 파라미터는 WebSocket이 보내준 데이터다
	// 변수안에 function을 넣음. 변수 생략 가능
	function onMessage(evt) {
		var data = evt.data;
		$("#data").append(data);
		//sock.close();
	}
	// var onClose 변수 생략
	function onClose(evt) {
		$("#data").append("Connection Closed!");
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
							<a href="#"><span id="minim_chat_window"
								class="glyphicon glyphicon-minus icon_minim"></span></a> <a href="#"><span
								class="glyphicon glyphicon-remove icon_close"
								data-id="chat_window_1"></span></a>
						</div>
					</div>
					<!-- 채팅은 이 안에 들어와야 함 -->
					<div class="panel-body msg_container_base">
						<!-- 보내는 놈 = 나 -->
						<div class="row msg_container base_sent">
							<div class="col-md-10 col-xs-10">
								<div class="messages msg_sent">
									<p>
										<!-- 여기에 채팅 내용이 들어옵니다. -->
									</p>
									<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
								</div>
							</div>
							<!-- 프사 부분 -->
							<div class="col-md-2 col-xs-2 avatar">
								<img
									src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg"
									class=" img-responsive ">
							</div>
						</div>


						<!-- 받는놈 = 팀원 -->
						<div class="row msg_container base_receive">
							<div class="col-md-2 col-xs-2 avatar">
								<img
									src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg"
									class=" img-responsive ">
							</div>
							<div class="col-md-10 col-xs-10">
								<div class="messages msg_receive">
									<p>that mongodb thing looks good, huh? tiny master db, and
										huge document store</p>
									<time datetime="2009-11-13T20:00">Timothy • 51 min</time>
								</div>
							</div>
						</div>

					</div>
					<!-- <div class="panel-body msg_container_base"> -->

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
					<!-- panel-footer -->


				</div>
				<!-- <div class="panel panel-default"> -->
			</div>
			<!-- <div class="col-xs-12 col-md-12"> -->
		</div>
		<!-- 		<div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left: 10px;"> -->
		
		<!-- 		
		<div class="btn-group dropup">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				<span class="glyphicon glyphicon-cog"></span> <span class="sr-only">Toggle
					Dropdown</span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#" id="new_chat"><span
						class="glyphicon glyphicon-plus"></span> Novo</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-list"></span>
						Ver outras</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-remove"></span>
						Fechar Tudo</a></li>
				<li class="divider"></li>
				<li><a href="#"><span class="glyphicon glyphicon-eye-close"></span>
						Invisivel</a></li>
			</ul>
		</div> -->
	</div>
	<!-- container -->

	<!-- 	
		<input type="text" id="message" />
		<input type="button" id="sendBtn" value="SEND" />
		<div id="data"></div>
	-->
</body>
</html>