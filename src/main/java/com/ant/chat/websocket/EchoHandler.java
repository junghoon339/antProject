package com.ant.chat.websocket;
 
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
 
 
public class EchoHandler extends TextWebSocketHandler {
    
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    //��� ������ �����Ѵ�
    //���1 Map
    //private Map <String,WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
    
    //���2 List //��üä��//����������
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    
    /**
     * Ŭ���̾�Ʈ ���� ���Ŀ� ����Ǵ� �޼ҵ�
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
        //1 MAP :
        //session.put(session.getId(), session);
        //2 List :
        sessionList.add(session);
        logger.info(" {} conntected ", session.getId());
    }
    /**
     * Ŭ���̾�Ʈ�� ������ ������ �޽����� �������� �� ����Ǵ� �޼ҵ�
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
            TextMessage message) throws Exception {
        
        //�Ʒ��� ���̴� �ִ� 2��
        logger.info("From {}, recieved Message : {} ", session.getId(), message.getPayload() );
         
        String tempMessage = message.getPayload();
        int seperatorIndex = tempMessage.indexOf(":");
        
        String userName = tempMessage.substring(0, seperatorIndex);
        String chatMessage = tempMessage.substring(seperatorIndex+1);
        
        //����Ǿ��ִ� ��� Ŭ���̾�Ʈ�鿡�� �޽����� �����Ѵ�
        //2 List
        for(WebSocketSession sess : sessionList){
        	System.out.println(session.getId()+"�̰� ���� ���� session id");
        	System.out.println(sess.getId()+"�̰� ����Ʈ�� ����ִ� session id");
        	sess.sendMessage(new TextMessage(chatMessage));
        }
        
        //1 Map
//        Iterator <String> sessionIds = sessions.keySet().iterator();
//        String sessionId = "";
//        while(sessionIds.hasNext()){
//            sessionId = sessionIds.next();
//            sessions.get(sessionId).sendMessage(new TextMessage("echo: " + message.getPayload() ));
//        }
//        
        //session.sendMessage(new TextMessage("echo: " + message.getPayload() ));
    }
    
    /**
     * Ŭ���̾�Ʈ�� ������ ������ �� ����Ǵ� �޼ҵ�
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
        
        //2 List
        sessionList.remove(session);
        
        //1 Map
        //sessions.remove(session.getId());
        
        logger.info(" {} Connection Closed ", session.getId());
    }
 
}
