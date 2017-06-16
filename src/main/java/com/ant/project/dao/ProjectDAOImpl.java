package com.ant.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;
import com.ant.user.dto.UserDTO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertProject(ProjectDTO projectDTO) {
		int result = sqlSession.insert("projectMapper.insertProject",projectDTO);
		return result;
	}

	@Override
	public int selectProjectNo() {
		int projectNo = sqlSession.selectOne("projectMapper.selectProjectNo");
		return projectNo;
		
	}

	@Override
	public int insertProjectLeader(ProjectUserDTO projectUserDTO) {
		int result = sqlSession.insert("projectMapper.insertProjectLeader", projectUserDTO);
		return result;
	}
	
	@Override
	public List<Integer> selectUserNoById(List<String> list) {
		List <Integer> invitedUserNolist = sqlSession.selectList("projectMapper.selectUserNoById", list);
		//System.out.println("ProjectDAOImpl------------>>>>>>invitedUserNolist:"+invitedUserNolist);

		return invitedUserNolist;
	}

	@Override
	public Map<String, List<ProjectDTO>> selectProjectById(int userNo) {
		
		System.out.println("ProjectDAOImpl에서 selectProjectById()호출됨!!!");

		
		Map<String, Integer> map = new HashMap<>();
		map.put("projectState", 0);
		map.put("userNo", userNo);
		
		//현재진행중 조별과제
		List<ProjectDTO> currentProList = sqlSession.selectList("projectMapper.selectProjectById", map);


		//완료된 조별과제
		map.put("projectState", 2);
		List<ProjectDTO> completedProList = sqlSession.selectList("projectMapper.selectProjectById", map);

		//projectMap에 currentProList,completedProList를 담음
		Map<String, List<ProjectDTO>> projectMap = new HashMap<>();
		projectMap.put("currentProList", currentProList);
		projectMap.put("completedProList", completedProList);
		
		return projectMap;
	}

	@Override
	public ProjectDTO selectProject(int projectNo) {
		ProjectDTO projectDTO = sqlSession.selectOne("projectMapper.selectProject", projectNo);
		return projectDTO;
	}

	@Override
	public int updateTeamInfo(ProjectDTO projectDTO) {
		int result = sqlSession.update("projectMapper.updateTeamInfo", projectDTO);
		return result;
	}

	@Override
	public List<UserDTO> selectProjectUsers(int projectNo) {
		List<UserDTO> projectUserList = sqlSession.selectList("projectMapper.selectProjectUsers", projectNo);
		return projectUserList;
	}

	@Override
	public int updateProjectUserTask(ProjectUserDTO projectUserDTO) {
		int result = sqlSession.update("projectMapper.updateProjectUserTask", projectUserDTO);
		return result;
	}

	@Override
	public int deleteProjectUser(ProjectUserDTO projectUserDTO) {
		int result = sqlSession.delete("projectMapper.deleteProjectUser", projectUserDTO);
		return result;
	}

	@Override
	public String selectProjectUserRole(ProjectUserDTO projectUserDTO) {
		String projectUserRole = sqlSession.selectOne("projectMapper.selectProjectUserRole", projectUserDTO);
		return projectUserRole;
	}
	
	

	
	
	
}

