package com.ant.survey.dto;

public class SurveyDTO {

	private int surveyNo;
	private int projectNo;
	private String surveyStartDate;
	private String surveyEndDate;
	private int surveyState;

	public SurveyDTO() {}
	public SurveyDTO(int surveyNo, int projectNo, String surveyStartDate, String surveyEndDate, int surveyState) {
		this.surveyNo = surveyNo;
		this.projectNo = projectNo;
		this.surveyStartDate = surveyStartDate;
		this.surveyEndDate = surveyEndDate;
		this.surveyState = surveyState;
	}

	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getSurveyStartDate() {
		return surveyStartDate;
	}

	public void setSurveyStartDate(String surveyStartDate) {
		this.surveyStartDate = surveyStartDate;
	}

	public String getSurveyEndDate() {
		return surveyEndDate;
	}

	public void setSurveyEndDate(String surveyEndDate) {
		this.surveyEndDate = surveyEndDate;
	}

	public int getSurveyState() {
		return surveyState;
	}

	public void setSurveyState(int surveyState) {
		this.surveyState = surveyState;
	}

}
