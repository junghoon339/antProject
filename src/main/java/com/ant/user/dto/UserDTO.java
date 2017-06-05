package com.ant.user.dto;

public class UserDTO {
	private int userNo;
	private String userId;
	private String userName;
	private String userPassword;
	private String userSchool;
	private String userMajor;
	
	public UserDTO() {
		super();
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
}