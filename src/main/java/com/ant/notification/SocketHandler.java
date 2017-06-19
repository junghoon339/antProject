package com.ant.notification;

import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketHandler extends TextWebSocketHandler implements InitializingBean {
	 
    private final Logger logger = LogManager.getLogger(getClass());
    private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

   
    public SocketHandler (){
          super();
          this.logger.info("create SocketHandler instance!");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session,
                 CloseStatus status) throws Exception {
          super.afterConnectionClosed(session, status);

          sessionSet.remove(session);
          this.logger.info("remove session!");
    }
    
    /**
     * 2���� �̺�Ʈó��
     * 1.send:Ŭ���̾�Ʈ�� �������� �޼��� ����
     * 2.emit:������ ����Ǿ� �ִ� Ŭ���̾�Ʈ�鿡�� �޽��� ����
     * 
     * @param WebSocketSession �޽����� ���� Ŭ���̾�Ʈ
     * @param TextMessage �޼����� ����
     * */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
    	for(WebSocketSession webSocketSession:sessionSet){
    		
    		//���� ����ڴ� ���� �ʱ� ���� ���ǹ�
        	if(!session.getId().equals(webSocketSession.getId())){
        		System.out.println(message.getPayload());
        		webSocketSession.sendMessage(new TextMessage(message.getPayload()));
        	}
    	}
    }
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
                 throws Exception {
          super.afterConnectionEstablished(session);
         
          sessionSet.add(session);
          this.logger.info("add session!");
    }

    
   /* @Override
    public void handleMessage(WebSocketSession session,
                 WebSocketMessage<?> message) throws Exception {
          super.handleMessage(session, message);
          System.out.println("�޼�����!!!!!!!:"+message.getPayload().toString());
          System.out.println("���ǻ�����:"+this.sessionSet.size());
          for(WebSocketSession sessionss:this.sessionSet){
        	  System.out.println("aaa:"+sessionss.getLocalAddress());
        	  System.out.println("bbb:"+sessionss.getId());
        	  System.out.println("ccc:"+sessionss);
          }
          for (WebSocketSession sessions: this.sessionSet){
        	  //System.out.println("�����̴�.....!!!!!!"+session.getId());
                 if (session.isOpen()){
                        try{
                              sessions.sendMessage(new TextMessage(message.getPayload().toString()));
                        }catch (Exception ignored){
                              this.logger.error("fail to send message!", ignored);
                        }
                 }
          }
          this.logger.info("receive message:"+message.toString());
    }*/

    @Override
    public void handleTransportError(WebSocketSession session,
                 Throwable exception) throws Exception {
          this.logger.error("web socket error!", exception);
    }

    @Override
    public boolean supportsPartialMessages() {
          this.logger.info("call method!");
         
          return super.supportsPartialMessages();
    }
   
    public void sendMessage (String message){
    	
          for (WebSocketSession session: this.sessionSet){
        	  //System.out.println("�����̴�.....!!!!!!"+session.getId());
                 if (session.isOpen()){
                        try{
                              session.sendMessage(new TextMessage(message));
                        }catch (Exception ignored){
                              this.logger.error("fail to send message!", ignored);
                        }
                 }
          }
    }

    //��ü �ο����� �ѷ��ִ°�,, ���⿡ notificatino�����ؾ���
    @Override
    public void afterPropertiesSet() throws Exception {

        /* Thread thread = new Thread(){

                 int i=0;
                 @Override
                 public void run() {
                        while (true){

                              try {
                                     sendMessage ("send message index "+i++);
                                     Thread.sleep(1000);
                              } catch (InterruptedException e) {
                                     e.printStackTrace();
                                     break;
                              }
                        }
                 }

          };

          thread.start();*/
    }

}