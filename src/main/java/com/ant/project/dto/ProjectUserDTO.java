package com.ant.project.dto;

public class ProjectUserDTO {
	private int projectUserNo; //������Ʈ������ȣ
	private int projectNo;	//������Ʈ��ȣ
	private int userNo;	//ȸ����ȣ
	private String projectUserRole;	//��������

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
