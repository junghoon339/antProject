package com.ant.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.project.dao.ProjectDAO;
import com.ant.project.dto.ProjectDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAO projectDAO;
	
	@Override
	public int insertProject(ProjectDTO projectDTO) {
		int result = projectDAO.insertProject(projectDTO);
		return result;
	}

}
