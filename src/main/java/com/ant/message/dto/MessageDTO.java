package com.ant.message.dto;

import com.ant.user.dto.UserDTO;

public class MessageDTO {
	private int messageNo;
	private int userNoMessageSender;
	private String messageReceiver;
	private int userNoMessagereceiver;
	private String messageContent;
	private String messageSendTime;
	private String messageReceiveTime;
	private int messageState; //0일때는 모두 보여줌, 1일때는 sender는 안보여짐(sender삭제),2일때는receiver안보여짐(receiver삭제),3일때는 모두안보여짐,, 아님 삭제하거나..알아서..
	
	private UserDTO userDTO;
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

	public int getMessageState() {
		return messageState;
	}

	public void setMessageState(int messageState) {
		this.messageState = messageState;
	}

	public UserDTO getUserDTO() {
		return userDTO;
	}

	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}

	public String getMessageReceiver() {
		return messageReceiver;
	}

	public void setMessageReceiver(String messageReceiver) {
		this.messageReceiver = messageReceiver;
	}
	
	

	
}
