package com.ant.project.dao;

import java.util.List;
import java.util.Map;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;
import com.ant.user.dto.UserDTO;

public interface ProjectDAO {
	/**
	 * 1. 새로운팀플방생성
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
	 * @param: list(팀방에 초대된 userId들)
	 */
	public List<Integer> selectUserNoById(List<String> invitedUserIdList);
	
	/**
	 * 5. 현재 진행중/완료된 프로젝트 검색
	 */
	public Map<String, List<ProjectDTO>> selectProjectById(int userNo);
	
	/**
	 * 팀플 정보 검색
	 */
	public ProjectDTO selectProject(int projectNo);
	
	/**
	 * 팀플 정보 수정
	 */
	public int updateTeamInfo(ProjectDTO projectDTO);
	
	/**
	 * 팀원 정보 검색
	 */
	public List<UserDTO> selectProjectUsers(int projectNo);
	
	/**
	 * 팀원정보중 맡은임무 수정
	 */
	public int updateProjectUserTask(ProjectUserDTO projectUserDTO);
	
	/**
	 * 팀원 삭제
	 */
	public int deleteProjectUser(ProjectUserDTO projectUserDTO);
	
	/**
	 * 해당프로젝트의 역할(조원or조장) 검색
	 */
	public String selectProjectUserRole(ProjectUserDTO projectUserDTO);
}
