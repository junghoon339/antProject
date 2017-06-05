package com.ant.project.dto;

public class ProjectUserDTO {
	private int projectUserNo; //프로젝트팀원번호
	private int projectNo;	//프로젝트번호
	private int userNo;	//회원번호
	private String projectUserRole;	//팀원역할

	public ProjectUserDTO() {}

	public ProjectUserDTO(int projectUserNo, int projectNo, int userNo, String projectUserRole) {
		super();
		this.projectUserNo = projectUserNo;
		this.projectNo = projectNo;
		this.userNo = userNo;
		this.projectUserRole = projectUserRole;
	}

	public int getProjectUserNo() {
		return projectUserNo;
	}

	public void setProjectUserNo(int projectUserNo) {
		this.projectUserNo = projectUserNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getProjectUserRole() {
		return projectUserRole;
	}

	public void setProjectUserRole(String projectUserRole) {
		this.projectUserRole = projectUserRole;
	}
	
	
	
	
}
