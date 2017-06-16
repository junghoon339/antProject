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
	
	// ��� ������ �����Ѵ�
	// ���1 Map
	private Map<String, List<WebSocketSession>> sessionListMap = new HashMap<String, List<WebSocketSession>>();
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// ���2 List //��üä��//����������
	// private List<WebSocketSession> sessionList = new
	// ArrayList<WebSocketSession>();

	/**
	 * Ŭ���̾�Ʈ ���� ���Ŀ� ����Ǵ� �޼ҵ�
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
	 * Ŭ���̾�Ʈ�� ������ ������ �޽����� �������� �� ����Ǵ� �޼ҵ�
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// �Ʒ��� ���̴� �ִ� 2��
		logger.info("From {}, recieved Message : {} ", session.getId(), message.getPayload());
		
		// String tempMessage = message.getPayload();
		// int seperatorIndex = tempMessage.indexOf(":");
		//
		// String userName = tempMessage.substring(0, seperatorIndex);
		// String chatMessage = tempMessage.substring(seperatorIndex+1);

		// ����Ǿ��ִ� ��� Ŭ���̾�Ʈ�鿡�� �޽����� �����Ѵ�
		// 2 List
		// for(WebSocketSession sess : sessionList){
		// System.out.println(session.getId()+"�̰� ���� ���� session id");
		// System.out.println(sess.getId()+"�̰� ����Ʈ�� ����ִ� session id");
		// sess.sendMessage(new TextMessage(message.getPayload()));
		// }

		// 1 Map
		Iterator<String> sessionListIterator = sessionListMap.keySet().iterator();
		String projectNo = "";
		while (sessionListIterator.hasNext()) {
			// sessionList�� �����ִ� projectNo�� ����
			projectNo = sessionListIterator.next();
			
			for (WebSocketSession sess : sessionListMap.get(projectNo)) {
				sess.sendMessage(new TextMessage(message.getPayload()));
			}
		}
		
		service.writeChat(Integer.parseInt(projectNo), message.getPayload());
		System.out.println("after writechat");
	}

	/**
	 * Ŭ���̾�Ʈ�� ������ ������ �� ����Ǵ� �޼ҵ�
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