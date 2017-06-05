package com.ant.survey.dto;

public class SurveyUserDTO {

	private int surveyUser;
	private int surveyNo;
	private int userNo;
	private int surveyUserState;

	public SurveyUserDTO(){}
	public SurveyUserDTO(int surveyUser, int surveyNo, int userNo, int surveyUserState) {
		this.surveyUser = surveyUser;
		this.surveyNo = surveyNo;
		this.userNo = userNo;
		this.surveyUserState = surveyUserState;
	}

	public int getSurveyUser() {
		return surveyUser;
	}

	public void setSurveyUser(int surveyUser) {
		this.surveyUser = surveyUser;
	}

	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSurveyUserState() {
		return surveyUserState;
	}

	public void setSurveyUserState(int surveyUserState) {
		this.surveyUserState = surveyUserState;
	}

}
