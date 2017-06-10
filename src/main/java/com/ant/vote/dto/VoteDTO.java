package com.ant.vote.dto;

import java.util.List;

public class VoteDTO {
	private int voteNo;
	private int projectUserNo;
	private String voteTitle;
	private String voteAddDate;
	private String voteEndDate;
	private String voteState;

	private List<VoteDetailDTO> details;
	
	public VoteDTO(){}
	public VoteDTO(int voteNo, int userNo, int projectUserNo, String voteTitle, String voteAddDate,
			String voteEndDate, String voteState) {
		this.voteNo = voteNo;
		this.projectUserNo = projectUserNo;
		this.voteTitle = voteTitle;
		this.voteAddDate = voteAddDate;
		this.voteEndDate = voteEndDate;
		this.voteState = voteState;
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

	public int getProjectUserNo() {
		return projectUserNo;
	}

	public void setProjectUserNo(int projectUserNo) {
		this.projectUserNo = projectUserNo;
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

	public String getVoteState() {
		return voteState;
	}

	public void setVoteState(String voteState) {
		this.voteState = voteState;
	}

}
