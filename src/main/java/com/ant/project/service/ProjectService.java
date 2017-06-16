package com.ant.project.service;

import java.util.List;
import java.util.Map;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;
import com.ant.user.dto.UserDTO;

public interface ProjectService {
	
	/**
	 * ���ο����ù����
	 */
	public int insertProject(ProjectDTO projectDTO,List<Integer> invitedUserNoList,int userNo);
	
	
	/**
	 * ���� ����
	 * @param: ProjectUserDTO -	projectUserNo, projectNo, userNo, projectUserRole
	 */
	public int insertProjectLeader(ProjectUserDTO projectUserDTO);
	
	/**
	 * ����ID�� ���� userno �˻�
	 * @param: List<String>(���濡 �ʴ�� userId��)
	 * @return: List<Integer>(���濡 �ʴ�� userNo��)
	 */
	public List<Integer> selectUserNoById(List<String> invitedUserIdList);

	/**
	 * ���� ������/�Ϸ�� ������Ʈ �˻�
	 */
	public Map<String, List<ProjectDTO>>  selectProjectById(int userNo);
	
	/**
	 * ���� ���� �˻�
	 */
	public ProjectDTO selectProject(int projectNo);
	
	/**
	 * ���� ���� ����
	 */
	public int updateTeamInfo(ProjectDTO projectDTO);
	
	/**
	 * ���� ���� �˻�
	 */
	public List<UserDTO> selectProjectUsers(int projectNo);
	
	/**
	 * ���������� �����ӹ� ����
	 */
	public int updateProjectUserTask(ProjectUserDTO projectUserDTO);
	
	/**
	 * ���� ����
	 */
	public int deleteProjectUser(ProjectUserDTO projectUserDTO);
	
	/**
	 * �ش�������Ʈ�� ����(����or����) �˻�
	 */
	public String selectProjectUserRole(ProjectUserDTO projectUserDTO);
	

}
