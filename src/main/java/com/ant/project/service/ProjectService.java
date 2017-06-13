package com.ant.project.service;

import java.util.List;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;

public interface ProjectService {
	
	/**
	 * 새로운팀플방생성
	 */
	public int insertProject(ProjectDTO projectDTO);
	
	/**
	 * 2.방금 삽입된 조별과제의 번호 검색
	 * @param:없음
	 */
	public int selectProjectNo();
	
	/**
	 * 3.조장 삽입
	 * @param: ProjectUserDTO -	projectUserNo, projectNo, userNo, projectUserRole
	 */
	public int insertProjectLeader(ProjectUserDTO projectUserDTO);
	
	/**
	 * 4.팀원ID를 갖고 userno 검색
	 * @param: List<String>(팀방에 초대된 userId들)
	 * @return: List<Integer>(팀방에 초대된 userNo들)
	 */
	public List<Integer> SelectUserNoById(List<String> invitedUserIdList);
}
