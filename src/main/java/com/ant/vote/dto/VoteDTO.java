package com.ant.vote.dto;

import java.util.List;

public class VoteDTO {
	private int voteNo;
	private int userNo;
	private int projectNo;
	private String voteTitle;
	private String voteAddDate;
	private String voteEndDate;
	private int voteState;

	private List<VoteDetailDTO> details;
	
	public VoteDTO(){}
	public VoteDTO(int voteNo, int userNo, int projectNo, String voteTitle, String voteAddDate, String voteEndDate, int voteState) {
		this.voteNo = voteNo;
		this.userNo = userNo;
		this.projectNo = projectNo;
		this.voteTitle = voteTitle;
		this.voteAddDate = voteAddDate;
		this.voteEndDate = voteEndDate;
		this.voteState = voteState;
	}
	public VoteDTO(int voteNo, int userNo, int projectNo, String voteTitle, String voteAddDate, String voteEndDate, int voteState, List<VoteDetailDTO> details) {
		this.voteNo = voteNo;
		this.userNo = userNo;
		this.projectNo = projectNo;
		this.voteTitle = voteTitle;
		this.voteAddDate = voteAddDate;
		this.voteEndDate = voteEndDate;
		this.voteState = voteState;
		this.details = details;
	}
	
	public List<VoteDetailDTO> getDetails() {
		return details;
	}
	public void setDetails(List<VoteDetailDTO> details) {
		this.details = details;
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
	
	public int getProjectNo() {
		return projectNo;
	}
	
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	
	public String getVoteTitle() {
		return voteTitle;
	}

	public void setVoteTitle(String voteTitle) {
		this.voteTitle = voteTitle;
	}

	public String getVoteAddDate() {
		return voteAddDate;
	}

	public void setVoteAddDate(String voteAddDate) {
		this.voteAddDate = voteAddDate;
	}

	public String getVoteEndDate() {
		return voteEndDate;
	}

	public void setVoteEndDate(String voteEndDate) {
		this.voteEndDate = voteEndDate;
	}

	public int getVoteState() {
		return voteState;
	}

	public void setVoteState(int voteState) {
		this.voteState = voteState;
	}

}
