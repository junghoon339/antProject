package com.ant.survey.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.project.dto.ProjectDTO;
import com.ant.survey.dto.SurveyDTO;
import com.ant.survey.dto.SurveyDetailDTO;
import com.ant.survey.dto.SurveyUserDTO;
import com.ant.user.dto.UserDTO;

@Repository
public class SurveyDAOImpl implements SurveyDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public SurveyDTO surveySelectByProjectNo(int projectNo) {
		return session.selectOne("surveyMapper.surveySelect1",projectNo);
	}
	
	@Override
	public List<SurveyUserDTO> surveyUserSelect(int surveyNo) {
		Map<String, Integer> map = new TreeMap<>();
		map.put("surveyNo", surveyNo);
		map.put("userNo", 0);
		return session.selectList("surveyMapper.surveyUserSelect", map);
	}

	@Override
	public SurveyUserDTO surveyUserSelect(int surveyNo, int userNo) {
		Map<String, Integer> map = new TreeMap<>();
		map.put("surveyNo", surveyNo);
		map.put("userNo", userNo);
		return session.selectOne("surveyMapper.surveyUserSelect", map);
	}

	@Override
	public SurveyDetailDTO surveyDetailSelectBySurveyNo(int surveyNo, int surveyUserNo) {
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

	@Override
	public int closingProject(int projectNo, String endDate) {
		Map<String, Object> map = new TreeMap<>();
		map.put("projectNo", projectNo);
		map.put("endDate", endDate);
		return session.update("surveyMapper.closingProject", map);
	}

	@Override
	public int closedProject(int projectNo) {
		return session.update("surveyMapper.colsedProject", projectNo);
	}

	@Override
	public List<SurveyDetailDTO> selectTotalScore(int surveyNo) {
		return session.selectList("surveyMapper.selectTotalScore", surveyNo);
	}

	@Override
	public List<ProjectDTO> selectProjectState2() {
		return session.selectList("projectMapper.selectProjectState2");
	}

	@Override
	public List<SurveyUserDTO> selectSurveyUserState0(int surveyNo) {
		return session.selectList("surveyMapper.selectSurveyUserState0", surveyNo);
	}

	@Override
	public UserDTO selectUser(int userNo) {
		return session.selectOne("projectMapper.selectUserByUserNo", userNo);
	}

	@Override
	public int updateXXX(int surveyNo, String userName) {
		Map<String, Object> map = new TreeMap<>();
		map.put("surveyNo", surveyNo);
		map.put("userName", userName);
		return session.update("surveyMapper.updateXXX", map);
	}
	
}
