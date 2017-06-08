package com.ant.user.dto;

public class AuthorityDTO {
	private int authorityNo;
	private int userNo;
	private String authority;
	
	public AuthorityDTO() {}
	public AuthorityDTO(int userNo, String authority) {
		super();
		this.userNo = userNo;
		this.authority = authority;
	}
	public AuthorityDTO(int authorityNo, int userNo, String authority) {
		super();
		this.authorityNo = authorityNo;
		this.userNo = userNo;
		this.authority = authority;
	}
	
	public int getAuthorityNo() {
		return authorityNo;
	}
	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	
}
