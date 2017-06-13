package com.ant.project.dao;

import java.util.List;

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
		//sqlSession.commit();
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
	public List<Integer> SelectUserNoById(List<String> list) {
		List <Integer> invitedUserNolist = sqlSession.selectList("projectMapper.selectUserNoById", list);
		System.out.println("ProjectDAOImpl------------>>>>>>invitedUserNolist:"+invitedUserNolist);

		return invitedUserNolist;
	}

	
	
	
}

