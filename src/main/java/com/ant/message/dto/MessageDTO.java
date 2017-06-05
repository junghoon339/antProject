package com.ant.message.dto;

public class MessageDTO {
	private int messageNo;
	private int userNoMessageSender;
	private int userNoMessagereceiver;
	private String messageContent;
	private String messageSendtime;
	private String messageReceiver;
	
	public MessageDTO(){
		
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public int getUserNoMessageSender() {
		return userNoMessageSender;
	}

	public void setUserNoMessageSender(int userNoMessageSender) {
		this.userNoMessageSender = userNoMessageSender;
	}

	public int getUserNoMessagereceiver() {
		return userNoMessagereceiver;
	}

	public void setUserNoMessagereceiver(int userNoMessagereceiver) {
		this.userNoMessagereceiver = userNoMessagereceiver;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getMessageSendtime() {
		return messageSendtime;
	}

	public void setMessageSendtime(String messageSendtime) {
		this.messageSendtime = messageSendtime;
	}

	public String getMessageReceiver() {
		return messageReceiver;
	}

	public void setMessageReceiver(String messageReceiver) {
		this.messageReceiver = messageReceiver;
	}
	
}
