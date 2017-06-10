package com.ant.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.project.dto.ProjectDTO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertProject(ProjectDTO projectDTO) {
		int result = sqlSession.insert("projectMapper.insertProject",projectDTO);
		return result;
	}

}

