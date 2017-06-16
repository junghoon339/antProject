package com.ant.chat.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
	// 방법1 Map
	private Map<String, List<WebSocketSession>> sessionListMap = new HashMap<String, List<WebSocketSession>>();
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// 방법2 List //단체채팅//누가쓴지모름
	// private List<WebSocketSession> sessionList = new
	// ArrayList<WebSocketSession>();

	/**
	 * 클라이언트 연결 이후에 실행되는 메소드
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 1 MAP :
		Map<String, Object> projectNoMap = session.getAttributes();
		int projectNo = (int) projectNoMap.get("projectNo");
		
		sessionList.add(session);
		
		sessionListMap.put(Integer.toString(projectNo), sessionList);
		
		// 2 List :
		logger.info(" {} conntected ", session.getId());
	}

	/**
	 * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// 아래와 같이는 최대 2개
		logger.info("From {}, recieved Message : {} ", session.getId(), message.getPayload());
		
		// String tempMessage = message.getPayload();
		// int seperatorIndex = tempMessage.indexOf(":");
		//
		// String userName = tempMessage.substring(0, seperatorIndex);
		// String chatMessage = tempMessage.substring(seperatorIndex+1);

		// 연결되어있는 모든 클라이언트들에게 메시지를 전송한다
		// 2 List
		// for(WebSocketSession sess : sessionList){
		// System.out.println(session.getId()+"이건 현재 세션 session id");
		// System.out.println(sess.getId()+"이건 리스트에 들어있던 session id");
		// sess.sendMessage(new TextMessage(message.getPayload()));
		// }

		// 1 Map
		Iterator<String> sessionListIterator = sessionListMap.keySet().iterator();
		String projectNo = "";
		while (sessionListIterator.hasNext()) {
			// sessionList를 갖고있는 projectNo가 나옴
			projectNo = sessionListIterator.next();
			
			for (WebSocketSession sess : sessionListMap.get(projectNo)) {
				sess.sendMessage(new TextMessage(message.getPayload()));
			}
		}
		
		service.writeChat(Integer.parseInt(projectNo), message.getPayload());
		System.out.println("after writechat");
	}

	/**
	 * 클라이언트가 연결을 끊었을 때 실행되는 메소드
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> projectNoMap = session.getAttributes();
		int projectNo = (int) projectNoMap.get("projectNo");

		// 2 List
		sessionList.remove(session);
		
		// 1 Map
		if (sessionList.isEmpty()){
			sessionListMap.remove(Integer.toString(projectNo));
		}
		logger.info(" {} Connection Closed ", session.getId());
	}
	
	
}