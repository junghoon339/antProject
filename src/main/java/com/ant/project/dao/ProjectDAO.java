package com.ant.project.dao;

import java.util.List;
import java.util.Map;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;
import com.ant.user.dto.UserDTO;

public interface ProjectDAO {
	/**
	 * 1. ���ο����ù����
	 */
	public int insertProject(ProjectDTO projectDTO);

	/**
	 * 2.��� ���Ե� ���������� ��ȣ �˻�
	 * @param:����
	 */
	public int selectProjectNo();
	
	/**
	 * 3.���� ����
	 * @param: ProjectUserDTO -	projectUserNo, projectNo, userNo, projectUserRole
	 */
	public int insertProjectLeader(ProjectUserDTO projectUserDTO);
	
	/**
	 * 4.����ID�� ���� userno �˻�
	 * @param: list(���濡 �ʴ�� userId��)
	 */
	public List<Integer> selectUserNoById(List<String> invitedUserIdList);
	
	/**
	 * ���� ���� 
	 */
	public int insertProjectMember(ProjectUserDTO projectUserDTO);
	
	/**
	 * projectEnddate가 현재날짜일때 projectState변경
	 */
	public int updateProjectState(int userNo);
	
	/**
	 * 5. ���� ������/�Ϸ�� ������Ʈ �˻�
	 */
	public Map<String, List<ProjectDTO>> selectProjectById(int userNo);
	
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
