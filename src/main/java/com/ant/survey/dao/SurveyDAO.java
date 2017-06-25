package com.ant.survey.dao;

import java.util.List;

import com.ant.project.dto.ProjectDTO;
import com.ant.survey.dto.SurveyDTO;
import com.ant.survey.dto.SurveyDetailDTO;
import com.ant.survey.dto.SurveyUserDTO;
import com.ant.user.dto.UserDTO;

public interface SurveyDAO {

	/**
	 * 해당 프로젝트의 Survey를 호출
	 * Parameter -> projectNo
	 * */
	SurveyDTO surveySelectByProjectNo(int projectNo);
	
	List<SurveyUserDTO> surveyUserSelect(int surveyNo);
	
	SurveyUserDTO surveyUserSelect(int surveyNo, int userNo);
	
	/**
	 * 해당 Survey에 결과를 호출
	 * 모든 조원이 매긴 점수를 합하기전에
	 * 합할 데이터들을 불러오는 과정
	 * Parameter -> surveyNo
	 * */
	SurveyDetailDTO surveyDetailSelectBySurveyNo(int surveyNo, int surveyUserNo);
	
	int surveyCreate(SurveyDTO surveyDTO);
	
	int surveyUpdate(int projectNo);
	
	int surveyUserCreate(SurveyUserDTO surveyUserDTO);
	
	int surveyUserUpdate(int surveyNo, int userNo);
	
	int surveyDetailCreate(SurveyDetailDTO surveyDetailDTO);
	
	/** 마감하기 시, 프로젝트의 state를 1로 변경 */
	int updateTeamInfo(int projectNo);
	
	/** 마감하기 시, 프로젝트의 남은 기간을 오늘자+1day로 변경 */
	int closingProject(int projectNo, String endDate);
	
	/** 투표참여 후 확인을 기점으로 조별과제내 사람들이 모두 투표를 참여했으면 state 2로 변경 */
	int closedProject(int projectNo);
	
	/** 끝났을때 모든 조원의 점수를 합산하여 호출 */
	List<SurveyDetailDTO> selectTotalScore(int surveyNo);
	
	List<ProjectDTO> selectProjectState2();
	
	List<SurveyUserDTO> selectSurveyUserState0(int surveyNo);
	
	UserDTO selectUser(int userNo);
	
	int updateXXX(int surveyNo, String userName);
}
