package com.ant.project.service;

import java.util.List;
import java.util.Map;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;

public interface ProjectService {
	
	/**
	 * 새로운팀플방생성
	 */
	public int insertProject(ProjectDTO projectDTO,List<Integer> invitedUserNoList,int userNo);
	
	
	/**
	 * 조장 삽입
	 * @param: ProjectUserDTO -	projectUserNo, projectNo, userNo, projectUserRole
	 */
	public int insertProjectLeader(ProjectUserDTO projectUserDTO);
	
	/**
	 * 조원ID를 갖고 userno 검색
	 * @param: List<String>(팀방에 초대된 userId들)
	 * @return: List<Integer>(팀방에 초대된 userNo들)
	 */
	public List<Integer> selectUserNoById(List<String> invitedUserIdList);

	/**
	 * 현재 진행중/완료된 프로젝트 검색
	 */
	public Map<String, List<ProjectDTO>>  selectProjectById(int userNo);
	

}
