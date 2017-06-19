package com.ant.project.service;

import java.util.List;
import java.util.Map;

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
	public int insertProject(ProjectDTO projectDTO, List<Integer> invitedUserNoList, int userNo) {
		int result=0;
		//1.���������� ����
		int resultInsPro = projectDAO.insertProject(projectDTO);
		
		//2.��� ���Ե� ���������� ��ȣ �˻�
		int projectNo = projectDAO.selectProjectNo();
		
		//3.���� ����
		//������ ���������濡 ����
		ProjectUserDTO projectUserDTO = new ProjectUserDTO(projectNo, userNo);
		//System.out.println("������Ʈ��ȣ"+projectUserDTO.getProjectNo()+" / ����userNo : "+projectUserDTO.getUserNo());
		int resultInsLeader = insertProjectLeader(projectUserDTO);
		
		//4.�ʴ�� �������� ����������
		//�ʴ�� ������
		System.out.println("\n �ʴ�� ������ ��ȣ......!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		for(int userNo2 : invitedUserNoList){
			System.out.println("�ʴ�� ���� id : " + userNo2);
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

	@Override
	public Map<String, List<ProjectDTO>> selectProjectById(int userNo) {
		//System.out.println("ProjectServiceImpl������!! userNo : "+userNo);
		Map<String, List<ProjectDTO>> projectMap = projectDAO.selectProjectById(userNo);
		//System.out.println("ProjectServiceImpl���� selectProjectById()ȣ����!! projectMap : "+projectMap);

		
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
