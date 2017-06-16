package com.ant.project.dto;

public class ProjectUserDTO {
	private int projectUserNo; //������Ʈ������ȣ
	private int projectNo;	//������Ʈ��ȣ
	private int userNo;	//ȸ����ȣ
	private String projectUserRole;	//��������(����,����)
	private String projectUserTask;


	private ProjectDTO projectDTO; //�������� ȸ���������� ���
	
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
