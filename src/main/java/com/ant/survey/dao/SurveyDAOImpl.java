package com.ant.survey.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.survey.dto.SurveyDTO;
import com.ant.survey.dto.SurveyDetailDTO;
import com.ant.survey.dto.SurveyUserDTO;

@Repository
public class SurveyDAOImpl implements SurveyDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public SurveyDTO surveySelectByProjectNo(int projectNo) {
		return null;
	}
	
	@Override
	public SurveyDetailDTO surveyDetailSelectBySurveyNo(int surveyNo) {
		return null;
	}

	@Override
	public int surveyCreate(SurveyDTO surveyDTO) {
		return session.insert("surveyMapper.surveyCreate", surveyDTO);
	}

	@Override
	public int surveyUpdate(int projectNo) {
		return session.update("surveyMapper.surveyUpdate", projectNo);
	}

	@Override
	public int surveyUserCreate(SurveyUserDTO surveyUserDTO) {
		return session.insert("surveyMapper.surveyUserCreate", surveyUserDTO);
	}

	@Override
	public int surveyUserUpdate(int surveyNo, int userNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("surveyNo", surveyNo);
		map.put("userNo", userNo);
		
		return session.update("surveyMapper.surveyUserUpdate", map);
	}

	@Override
	public int surveyDetailCreate(SurveyDetailDTO surveyDetailDTO) {
		return session.insert("surveyMapper.surveyDetailCreate", surveyDetailDTO);
	}

	@Override
	public int updateTeamInfo(int projectNo) {
		return session.update("surveyMapper.updateTeamInfo", projectNo);
	}
	
}
