package com.ant.survey.dto;

import java.util.List;

public class SurveyUserDTO {

	private int surveyUserNo;
	private int surveyNo;
	private int userNo;
	private int surveyUserState;

	private List<SurveyDetailDTO> surveyDetails;
	
	public SurveyUserDTO(){}
	public SurveyUserDTO(int surveyUserNo, int surveyNo, int userNo, int surveyUserState) {
		this.surveyUserNo = surveyUserNo;
		this.surveyNo = surveyNo;
		this.userNo = userNo;
		this.surveyUserState = surveyUserState;
	}

	public List<SurveyDetailDTO> getSurveyDetails() {
		return surveyDetails;
	}
	
	public void setSurveyDetails(List<SurveyDetailDTO> surveyDetails) {
		this.surveyDetails = surveyDetails;
	}
	
	public int getSurveyUserNo() {
		return surveyUserNo;
	}

	public void setSurveyUserNo(int surveyUserNo) {
		this.surveyUserNo = surveyUserNo;
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
