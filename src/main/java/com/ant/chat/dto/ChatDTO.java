package com.ant.chat.dto;

public class ChatDTO {
	private int chatNo;
	private int projectNo;
	private String chatPath;
	
	public ChatDTO() {
		super();
	}

	public ChatDTO(int chatNo, int projectNo, String chatPath) {
		super();
		this.chatNo = chatNo;
		this.projectNo = projectNo;
		this.chatPath = chatPath;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getChatPath() {
		return chatPath;
	}

	public void setChatPath(String chatPath) {
		this.chatPath = chatPath;
	}
}