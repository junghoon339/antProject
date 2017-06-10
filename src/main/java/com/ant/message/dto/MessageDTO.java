package com.ant.message.dto;

public class MessageDTO {
	private int messageNo;
	private int userNoMessageSender;
	private int userNoMessagereceiver;
	private String messageContent;
	private String messageSendTime;
	private String messageReceiveTime;
	
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

	public String getMessageSendTime() {
		return messageSendTime;
	}

	public void setMessageSendTime(String messageSendTime) {
		this.messageSendTime = messageSendTime;
	}

	public String getMessageReceiveTime() {
		return messageReceiveTime;
	}

	public void setMessageReceiveTime(String messageReceiveTime) {
		this.messageReceiveTime = messageReceiveTime;
	}

	
}
