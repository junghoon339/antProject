package com.ant.survey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.survey.dao.SurveyDAO;
import com.ant.survey.dto.SurveyDTO;
import com.ant.survey.dto.SurveyDetailDTO;
import com.ant.survey.dto.SurveyUserDTO;

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
	
}
