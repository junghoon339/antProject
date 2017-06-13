package com.ant.project.service;

import java.util.List;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;

public interface ProjectService {
	
	/**
	 * ���ο����ù����
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
	 * @param: List<String>(���濡 �ʴ�� userId��)
	 * @return: List<Integer>(���濡 �ʴ�� userNo��)
	 */
	public List<Integer> SelectUserNoById(List<String> invitedUserIdList);
}
