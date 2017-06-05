package com.ant.vote.dto;

public class VoteDetailDTO {

	private int voteDetailNo;
	private int voteNo;
	private int userNo;
	private String voteDetailColumn;

	public VoteDetailDTO(){}
	public VoteDetailDTO(int voteDetailNo, int voteNo, int userNo, String voteDetailColumn) {
		this.voteDetailNo = voteDetailNo;
		this.voteNo = voteNo;
		this.userNo = userNo;
		this.voteDetailColumn = voteDetailColumn;
	}

	public int getVoteDetailNo() {
		return voteDetailNo;
	}

	public void setVoteDetailNo(int voteDetailNo) {
		this.voteDetailNo = voteDetailNo;
	}

	public int getVoteNo() {
		return voteNo;
	}

	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getVoteDetailColumn() {
		return voteDetailColumn;
	}

	public void setVoteDetailColumn(String voteDetailColumn) {
		this.voteDetailColumn = voteDetailColumn;
	}

}
