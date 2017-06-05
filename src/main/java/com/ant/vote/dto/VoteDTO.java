package com.ant.vote.dto;

public class VoteDTO {
	private int voteNo;
	private int projectUserNo;
	private String voteTilte;
	private String voteAddDate;
	private String voteEndDate;
	private String voteState;

	public VoteDTO(){}
	public VoteDTO(int voteNo, int userNo, int projectNo, int projectUserNo, String voteTilte, String voteAddDate,
			String voteEndDate, String voteState) {
		this.voteNo = voteNo;
		this.projectUserNo = projectUserNo;
		this.voteTilte = voteTilte;
		this.voteAddDate = voteAddDate;
		this.voteEndDate = voteEndDate;
		this.voteState = voteState;
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

	public String getVoteTilte() {
		return voteTilte;
	}

	public void setVoteTilte(String voteTilte) {
		this.voteTilte = voteTilte;
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
