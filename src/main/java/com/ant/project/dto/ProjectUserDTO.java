package com.ant.project.dto;

public class ProjectUserDTO {
	private int projectUserNo; //프로젝트팀원번호
	private int projectNo;	//프로젝트번호
	private int userNo;	//회원번호
	private String projectUserRole;	//팀원역할(조원,조장)
	private String projectUserTask;


	private ProjectDTO projectDTO; //관리자의 회원관리에서 사용
	
	public ProjectUserDTO() {}
	public ProjectUserDTO(int projectNo, int userNo) {
		super();
		this.projectNo =					 projectNo;
		this.userNo = userNo;
	}
	
	public ProjectUserDTO(int userNo, String projectUserTask) {
		super();
		this.userNo = userNo;
		this.projectUserTask = projectUserTask;
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

	public String getProjectUserTask() {
		return projectUserTask;
	}
	public void setProjectUserTask(String projectUserTask) {
		this.projectUserTask = projectUserTask;
	}
	public ProjectDTO getProjectDTO() {
		return projectDTO;
	}

	public void setProjectDTO(ProjectDTO projectDTO) {
		this.projectDTO = projectDTO;
	}
	
	
		
}
