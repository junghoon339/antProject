package com.ant.survey.dto;

import java.util.List;

public class SurveyDetailDTO {

	private int surveyDetailNo;
	private int surveyNo;
	private int surveyUserNo;
	private String surveyDetailUserName;
	private String surveyDetailUserScore;

	public SurveyDetailDTO(){}
	public SurveyDetailDTO(int surveyDetailNo, int surveyNo, int surveyUserNo, String surveyDetailUserName,
			String surveyDetailUserScore) {
		this.surveyDetailNo = surveyDetailNo;
		this.surveyNo = surveyNo;
		this.surveyUserNo = surveyUserNo;
		this.surveyDetailUserName = surveyDetailUserName;
		this.surveyDetailUserScore = surveyDetailUserScore;
	}
	
	public int getSurveyDetailNo() {
		return surveyDetailNo;
	}

	public void setSurveyDetailNo(int surveyDetailNo) {
		this.surveyDetailNo = surveyDetailNo;
	}

	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}

	public int getSurveyUserNo() {
		return surveyUserNo;
	}

	public void setSurveyUserNo(int surveyUserNo) {
		this.surveyUserNo = surveyUserNo;
	}

	public String getSurveyDetailUserName() {
		return surveyDetailUserName;
	}

	public void setSurveyDetailUserName(String surveyDetailUserName) {
		this.surveyDetailUserName = surveyDetailUserName;
	}

	public String getSurveyDetailUserScore() {
		return surveyDetailUserScore;
	}

	public void setSurveyDetailUserScore(String surveyDetailUserScore) {
		this.surveyDetailUserScore = surveyDetailUserScore;
	}

}
