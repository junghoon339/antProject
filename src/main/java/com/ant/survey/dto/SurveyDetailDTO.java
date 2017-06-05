package com.ant.survey.dto;

public class SurveyDetailDTO {

	private int surveyDetail;
	private int surveyNo;
	private int surveyUserNo;
	private String surveyDetailUserName;
	private String surveyDetailUserScore;

	public SurveyDetailDTO(){}
	public SurveyDetailDTO(int surveyDetail, int surveyNo, int surveyUserNo, String surveyDetailUserName,
			String surveyDetailUserScore) {
		this.surveyDetail = surveyDetail;
		this.surveyNo = surveyNo;
		this.surveyUserNo = surveyUserNo;
		this.surveyDetailUserName = surveyDetailUserName;
		this.surveyDetailUserScore = surveyDetailUserScore;
	}

	public int getSurveyDetail() {
		return surveyDetail;
	}

	public void setSurveyDetail(int surveyDetail) {
		this.surveyDetail = surveyDetail;
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
