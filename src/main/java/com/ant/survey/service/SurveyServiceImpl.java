package com.ant.survey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.project.dto.ProjectDTO;
import com.ant.survey.dao.SurveyDAO;
import com.ant.survey.dto.SurveyDTO;
import com.ant.survey.dto.SurveyDetailDTO;
import com.ant.survey.dto.SurveyUserDTO;
import com.ant.user.dto.UserDTO;
import com.ant.vote.dto.VoteDTO;

@Service
public class SurveyServiceImpl implements SurveyService{

	@Autowired
	private SurveyDAO surveyDAO;

	@Override
	public SurveyDTO surveySelectByProjectNo(int projectNo) {
		return surveyDAO.surveySelectByProjectNo(projectNo);
	}
	
	@Override
	public List<SurveyUserDTO> surveyUserSelect(int surveyNo) {
		return surveyDAO.surveyUserSelect(surveyNo);
	}

	@Override
	public SurveyUserDTO surveyUserSelect(int surveyNo, int userNo) {
		return surveyDAO.surveyUserSelect(surveyNo, userNo);
	}

	@Override
	public SurveyDetailDTO surveyDetailSelectBySurveyNo(int surveyNo, int surveyUserNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int surveyCreate(SurveyDTO surveyDTO) {
		return surveyDAO.surveyCreate(surveyDTO);
	}

	@Override
	public int surveyUpdate(int projectNo) {
		return surveyDAO.surveyUpdate(projectNo);
	}

	@Override
	public int surveyUserCreate(SurveyUserDTO surveyUserDTO) {
		return surveyDAO.surveyUserCreate(surveyUserDTO);
	}

	@Override
	public int surveyUserUpdate(int surveyNo, int userNo) {
		return surveyDAO.surveyUserUpdate(surveyNo, userNo);
	}

	@Override
	public int surveyDetailCreate(SurveyDetailDTO surveyDetailDTO) {
		return surveyDAO.surveyDetailCreate(surveyDetailDTO);
	}
	
	@Override
	public int updateTeamInfo(int projectNo) {
		return surveyDAO.updateTeamInfo(projectNo);
	}

	@Override
	public int closingProject(int projectNo, String endDate) {
		return surveyDAO.closingProject(projectNo, endDate);
	}

	@Override
	public int closedProject(int projectNo) {
		return surveyDAO.closedProject(projectNo);
	}

	@Override
	public List<SurveyDetailDTO> selectTotalScore(int surveyNo) {
		return surveyDAO.selectTotalScore(surveyNo);
	}

	@Override
	public List<ProjectDTO> selectProjectState2() {
		return surveyDAO.selectProjectState2();
	}

	@Override
	public List<SurveyUserDTO> selectSurveyUserState0(int surveyNo) {
		return surveyDAO.selectSurveyUserState0(surveyNo);
	}

	@Override
	public UserDTO selectUser(int userNo) {
		return surveyDAO.selectUser(userNo);
	}

	@Override
	public int updateXXX(int surveyNo, String userName) {
		return surveyDAO.updateXXX(surveyNo, userName);
	}

}
