package com.ant.survey.dao;

import com.ant.survey.dto.SurveyDTO;
import com.ant.survey.dto.SurveyDetailDTO;
import com.ant.survey.dto.SurveyUserDTO;

public interface SurveyDAO {

	/**
	 * 해당 프로젝트의 Survey를 호출
	 * Parameter -> projectNo
	 * */
	SurveyDTO surveySelectByProjectNo(int projectNo);
	
	/**
	 * 해당 Survey에 결과를 호출
	 * 모든 조원이 매긴 점수를 합하기전에
	 * 합할 데이터들을 불러오는 과정
	 * Parameter -> surveyNo
	 * */
	SurveyDetailDTO surveyDetailSelectBySurveyNo(int surveyNo);
	
	int surveyCreate(SurveyDTO surveyDTO);
	
	int surveyUpdate(int projectNo);
	
	int surveyUserCreate(SurveyUserDTO surveyUserDTO);
	
	int surveyUserUpdate(int surveyNo, int userNo);
	
	int surveyDetailCreate(SurveyDetailDTO surveyDetailDTO);
	
}
