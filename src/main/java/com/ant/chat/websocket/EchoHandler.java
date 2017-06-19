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

	// 모든 세션을 저장한다
	private Map<String, List<WebSocketSession>> sessionListMap = new HashMap<String, List<WebSocketSession>>();

	/**
	 * 클占쏙옙占싱억옙트 占쏙옙占쏙옙 占쏙옙占식울옙 占쏙옙占쏙옙풔占� 占쌨소듸옙
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 占쏙옙占싶쇽옙占싶울옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占실울옙占쏙옙 projectNo占쏙옙 占쏙옙占쏙옙占쏙옙
		Map<String, Object> projectNoMap = session.getAttributes();
		int projectNo = (int) projectNoMap.get("projectNo");

		List<WebSocketSession> sessionList = null;
		System.out.println("ㅠㅠㅠㅠㅠ");
		// 세션리스트가 들어있는 맵이 존재하는지 확인
		if (sessionListMap.get(Integer.toString(projectNo))==null) {
			// 비어있으면 그 리스트를 만들어 줌
			System.out.println(1111111111);
			sessionList = new ArrayList<WebSocketSession>();
		} else {
			System.out.println(22222222);
			sessionList = sessionListMap.get(Integer.toString(projectNo));
		}
		System.out.println(session);
		sessionList.add(session);
		System.out.println(sessionListMap.get(Integer.toString(projectNo)));
		sessionListMap.put(Integer.toString(projectNo), sessionList);

		// 2 List :
		logger.info(" {} conntected ", session.getId());
	}

	/**
	 * 클占쏙옙占싱억옙트占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌨쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙풔占� 占쌨소듸옙
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> projectNoMap = session.getAttributes();
		int projectNo = (int) projectNoMap.get("projectNo");
		// 占싣뤄옙占쏙옙 占쏙옙占싱댐옙 占쌍댐옙 2占쏙옙
		logger.info("From {}, recieved Message : {} ", session.getId(), message.getPayload());

		for (WebSocketSession sess : sessionListMap.get(Integer.toString(projectNo))) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}

		service.writeChat(projectNo, message.getPayload());
		System.out.println("after writechat");
	}

	/**
	 * 클占쏙옙占싱억옙트占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙풔占� 占쌨소듸옙
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> projectNoMap = session.getAttributes();
		int projectNo = (int) projectNoMap.get("projectNo");

		System.out.println("afterCOn" + projectNo);
		List<WebSocketSession> sessionList = sessionListMap.get(Integer.toString(projectNo));

		System.out.println(sessionListMap.get(Integer.toString(projectNo)));
		// 2 List
		sessionList.remove(session);

		// 1 Map
		if (sessionList.isEmpty()) {
			sessionListMap.remove(Integer.toString(projectNo));
		}

		logger.info(" {} Connection Closed ", session.getId());
	}
}