package com.ant.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.synth.SynthSpinnerUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ant.project.dao.ProjectDAO;
import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;
import com.ant.user.dto.UserDTO;

@Service
@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAO projectDAO;
	
	@Override
//	public int insertProject(ProjectDTO projectDTO, List<Integer> invitedUserNoList, int userNo) {
	public int insertProject(ProjectDTO projectDTO, String[] invitedUser, int userNo) {
		int result=0;
		//1.조별과제방 삽입
		int resultInsPro = projectDAO.insertProject(projectDTO);
		
		//2.방금 삽입된 조별과제의 번호 검색
		int projectNo = projectDAO.selectProjectNo();
		
		//3.조장 삽입
		//조장을 조별과제방에 삽입
		ProjectUserDTO projectUserDTO = new ProjectUserDTO(projectNo, userNo);
		//System.out.println("프로젝트번호"+projectUserDTO.getProjectNo()+" / 조장userNo : "+projectUserDTO.getUserNo());
		int resultInsLeader = insertProjectLeader(projectUserDTO);
		
		//4.조원 삽입
		for(String userId:invitedUser){
			projectUserDTO.setUserId(userId);
			projectDAO.insertProjectMember(projectUserDTO);
		}
		result=1;
		return result;
	}

	@Override
	public int insertProjectLeader(ProjectUserDTO projectUserDTO) {
		int result = projectDAO.insertProjectLeader(projectUserDTO);
		return result;
	}

	@Override
	public List<Integer> selectUserNoById(List<String> invitedUserIdList) {
		List<Integer> invitedUserNolist = projectDAO.selectUserNoById(invitedUserIdList);
		return invitedUserNolist;
	}

	//조원삽입
	@Override
	public int insertProjectMember(ProjectUserDTO projectUserDTO) {
		return projectDAO.insertProjectMember(projectUserDTO);
	}

	@Override
	public Map<String, List<ProjectDTO>> selectProjectById(int userNo) {
		Map<String, List<ProjectDTO>> projectMap = projectDAO.selectProjectById(userNo);
		return projectMap;
	}

	@Override
	public ProjectDTO selectProject(int projectNo) {
		ProjectDTO projectDTO = projectDAO.selectProject(projectNo);
		return projectDTO;
	}
	
	@Override
	public int updateTeamInfo(ProjectDTO projectDTO) {
		int result = projectDAO.updateTeamInfo(projectDTO);
		return result;
	}

	@Override
	public List<UserDTO> selectProjectUsers(int projectNo) {
		List<UserDTO> projectUserList = projectDAO.selectProjectUsers(projectNo);
		return projectUserList;
	}
	
	@Override
	public int updateProjectUserTask(ProjectUserDTO projectUserDTO) {
		int result = projectDAO.updateProjectUserTask(projectUserDTO);
		return result;
	}
	
	@Override
	public int deleteProjectUser(ProjectUserDTO projectUserDTO) {
		int result = projectDAO.deleteProjectUser(projectUserDTO);
		return result;
	}

	@Override
	public String selectProjectUserRole(ProjectUserDTO projectUserDTO) {
		String projectUserRole = projectDAO.selectProjectUserRole(projectUserDTO);
		return projectUserRole;
	}
}
