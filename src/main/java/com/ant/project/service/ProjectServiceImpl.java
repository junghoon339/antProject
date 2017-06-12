package com.ant.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.project.dao.ProjectDAO;
import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAO projectDAO;
	
	@Override
	public int insertProject(ProjectDTO projectDTO) {
		int result = projectDAO.insertProject(projectDTO);
		return result;
	}

	@Override
	public int selectProjectNo() {
		int projectNo = projectDAO.selectProjectNo();
		return projectNo;
	}

	@Override
	public int insertProjectLeader(ProjectUserDTO projectUserDTO) {
		int result = projectDAO.insertProjectLeader(projectUserDTO);
		return result;
	}

	@Override
	public List<Integer> SelectUserNoById(List<String> invitedUserIdList) {
		List<Integer> invitedUserNolist = projectDAO.SelectUserNoById(invitedUserIdList);
		return invitedUserNolist;
	}
	
	
	
	

}
