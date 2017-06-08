package com.ant.todo.dto;

public class TodoDTO {
	private int todoNo;
	private int userNo;
	private int projectNo;
	private int todoLocation;
	private String todoContent;
	
	
	public int getTodoNo() {
		return todoNo;
	}
	public void setTodoNo(int todoNo) {
		this.todoNo = todoNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public int getTodoLocation() {
		return todoLocation;
	}
	public void setTodoLocation(int todoLocation) {
		this.todoLocation = todoLocation;
	}
	public String getTodoContent() {
		return todoContent;
	}
	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}
	
	
}
