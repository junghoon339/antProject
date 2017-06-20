package com.ant.chat.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ant.chat.service.ChatService;

public class EchoHandler extends TextWebSocketHandler {
	@Autowired
	private ChatService service;
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	// 맵 = 프로젝트 넘버, 리스트 = 그 프로젝트에 담긴 세션들
	private Map<String, List<WebSocketSession>> sessionListMap = new HashMap<String, List<WebSocketSession>>();

	/**
	 * 세션이 연결되면 젤 먼저 여기로 옴
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> projectNoMap = session.getAttributes();
		int projectNo = (int) projectNoMap.get("projectNo");

		List<WebSocketSession> sessionList = null;
		
		// 세션리스트가 들어있는 맵이 존재하는지 확인
		if (sessionListMap.get(Integer.toString(projectNo))==null) {
			// 비어있으면 그 리스트를 만들어 줌
			sessionList = new ArrayList<WebSocketSession>();
		} else {
			sessionList = sessionListMap.get(Integer.toString(projectNo));
		}
		sessionList.add(session);
		sessionListMap.put(Integer.toString(projectNo), sessionList);

		logger.info(" {} conntected ", session.getId());
	}

	/**
	 * 메시지를 보내면 이게 실행댐
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> projectNoMap = session.getAttributes();
		int projectNo = (int) projectNoMap.get("projectNo");
		
		logger.info("From {}, recieved Message : {} ", session.getId(), message.getPayload());

		// 프로젝트 넘버에 해당하는 리스트를 꺼내고, 그 리스트에 접속한 세션에게 메세지 전송
		for (WebSocketSession sess : sessionListMap.get(Integer.toString(projectNo))) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}

		service.writeChat(projectNo, message.getPayload());
		System.out.println("after writechat");
	}

	/**
	 * 세션 접속이 끊기고
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> projectNoMap = session.getAttributes();
		int projectNo = (int) projectNoMap.get("projectNo");

		System.out.println("afterCOn" + projectNo);
		List<WebSocketSession> sessionList = sessionListMap.get(Integer.toString(projectNo));

		System.out.println(sessionListMap.get(Integer.toString(projectNo)));

		// 세션 삭제
		sessionList.remove(session);

		// 세션 리스트가 모두 삭제되면 맵도 삭제
		if (sessionList.isEmpty()) {
			sessionListMap.remove(Integer.toString(projectNo));
		}

		logger.info(" {} Connection Closed ", session.getId());
	}
}