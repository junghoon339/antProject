package com.ant.user.dto;

import java.util.List;

import com.ant.project.dto.ProjectUserDTO;

public class UserDTO {
	private int userNo;
	private String userId;
	private String userName;
	private String userPassword;
	private String userSchool;
	private String userMajor;
	
	private List<ProjectUserDTO> listProjectUserDTO;//관리자에서 회원관리시 사용
	private int doingProject;
	private int doneProject;
	
	public UserDTO() {
		super();
	}

	public UserDTO(String userId, String userName, String userPassword, String userSchool,
			String userMajor) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userSchool = userSchool;
		this.userMajor = userMajor;
	}
	
	public UserDTO(int userNo, String userId, String userName, String userPassword, String userSchool,
			String userMajor) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userSchool = userSchool;
		this.userMajor = userMajor;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserSchool() {
		return userSchool;
	}

	public void setUserSchool(String userSchool) {
		this.userSchool = userSchool;
	}

	public String getUserMajor() {
		return userMajor;
	}

	public void setUserMajor(String userMajor) {
		this.userMajor = userMajor;
	}

	public List<ProjectUserDTO> getListProjectUserDTO() {
		return listProjectUserDTO;
	}

	public void setListProjectUserDTO(List<ProjectUserDTO> listProjectUserDTO) {
		this.listProjectUserDTO = listProjectUserDTO;
	}

	public int getDoingProject() {
		return doingProject;
	}

	public void setDoingProject(int doingProject) {
		this.doingProject = doingProject;
	}

	public int getDoneProject() {
		return doneProject;
	}

	public void setDoneProject(int doneProject) {
		this.doneProject = doneProject;
	}	
	
	
}