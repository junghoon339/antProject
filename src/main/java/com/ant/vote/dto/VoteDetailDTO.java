package com.ant.vote.dto;

import java.util.List;

public class VoteDetailDTO {

	private int voteDetailNo;
	private int voteNo;
	private String voteDetailColumn;

	private List<VoteSelectorDTO> selectors;
	
	public VoteDetailDTO(){}
	public VoteDetailDTO(int voteDetailNo, int voteNo, String voteDetailColumn) {
		this.voteDetailNo = voteDetailNo;
		this.voteNo = voteNo;
		this.voteDetailColumn = voteDetailColumn;
	}

	public List<VoteSelectorDTO> getSelectors() {
		return selectors;
	}
	
	public void setSelectors(List<VoteSelectorDTO> selectors) {
		this.selectors = selectors;
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

	public String getVoteDetailColumn() {
		return voteDetailColumn;
	}

	public void setVoteDetailColumn(String voteDetailColumn) {
		this.voteDetailColumn = voteDetailColumn;
	}

}
