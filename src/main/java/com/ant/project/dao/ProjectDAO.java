package com.ant.project.dao;

import java.util.List;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;

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
	public List<Integer> SelectUserNoById(List<String> invitedUserIdList);
}
