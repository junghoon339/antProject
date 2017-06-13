package com.ant.project.service;

import java.util.List;
import java.util.Map;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;

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
	

}
