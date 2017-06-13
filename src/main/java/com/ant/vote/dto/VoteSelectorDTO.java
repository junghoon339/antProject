package com.ant.vote.dto;

public class VoteSelectorDTO {

	private int voteSelectorNo;
	private int userNo;
	private int voteDetailNo;
	
	public VoteSelectorDTO(){}
	public VoteSelectorDTO(int voteSelectorNo, int userNo, int voteDetailNo) {
		this.voteSelectorNo = voteSelectorNo;
		this.userNo = userNo;
		this.voteDetailNo = voteDetailNo;
	}
	
	public int getVoteSelectorNo() {
		return voteSelectorNo;
	}
	
	public void setVoteSelectorNo(int voteSelectorNo) {
		this.voteSelectorNo = voteSelectorNo;
	}
	
	public int getUserNo() {
		return userNo;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public int getVoteDetailNo() {
		return voteDetailNo;
	}
	
	public void setVoteDetailNo(int voteDetailNo) {
		this.voteDetailNo = voteDetailNo;
	}
	
}
