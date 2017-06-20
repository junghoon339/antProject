<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="sysdate" class="java.util.Date" />
<fmt:formatDate value="${sysdate}" pattern="HH:mm:ss" var="sysdate" />
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
							class="glyphicon glyphicon-minus icon_minim"></span></a>
						<!-- <a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a> -->
					</div>
				</div>
				<!-- 채팅은 이 안에 들어와야 함 -->
				<div class="panel-body msg_container_base" id="panel-body">

					<c:set var="sep" value="${fn:escapeXml('#sep@')}" />
					<c:set var="sep2" value="${fn:escapeXml('#time@')}" />
					<c:set var="userName" value="${userDTO.userName}" />
					<c:forEach var="chats" items="${chatList}" varStatus="i">
						<c:set var="name"
							value="${fn:substring(chatList[i.index], 0, fn:indexOf(chatList[i.index], sep))}" />
						<c:set var="content"
							value="${fn:substring(chatList[i.index], fn:indexOf(chatList[i.index],sep)+5, fn:indexOf(chatList[i.index], sep2))}" />
						<c:set var="contentTime"
							value="${fn:substring(chatList[i.index], fn:indexOf(chatList[i.index],sep2)+6, fn:length(chatList[i.index]))}" />

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
											<time>${name} •&nbsp;</time>
											<time class="timeago" datetime="${contentTime}"></time>
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
											<time class="timeago" datetime="${contentTime}"></time>
											<time>${name} •&nbsp;</time>
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