package com.ant.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;

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
		System.out.println("ProjectDAOImpl------------>>>>>>invitedUserNolist:"+invitedUserNolist);

		return invitedUserNolist;
	}

	@Override
	public Map<String, List<ProjectDTO>> selectProjectById(int userNo) {
		
		System.out.println("ProjectDAOImpl���� selectProjectById()ȣ���!!!");

		
		Map<String, Integer> map = new HashMap<>();
		map.put("projectState", 0);
		map.put("userNo", userNo);
		
		//����������
		List<ProjectDTO> currentProList = sqlSession.selectList("projectMapper.selectProjectById", map);
		System.out.println("db���� ������ ���������� list...........");
		for(ProjectDTO dto:currentProList)
			System.out.println(dto.getProjectName());

		//�Ϸ��
		map.put("projectState", 1);
		List<ProjectDTO> completedProList = sqlSession.selectList("projectMapper.selectProjectById", map);

		Map<String, List<ProjectDTO>> projectMap = new HashMap<>();
		projectMap.put("currentProList", currentProList);
		projectMap.put("completedProList", completedProList);
		
		System.out.println("ProjectDAOImpl���� selectProjectById()ȣ����!! projectMap : "+projectMap);

		return projectMap;
	}
	
	

	
	
	
}

