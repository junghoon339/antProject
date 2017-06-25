package com.ant.project.dao;

import java.util.List;
import java.util.Map;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;
import com.ant.user.dto.UserDTO;

public interface ProjectDAO {
	/**
	 * 1.조별과제방 생성
	 */
	public int insertProject(ProjectDTO projectDTO);

	/**
	 * 2.방금생성된 조별과제 projectNo 검색
	 */
	public int selectProjectNo();
	
	/**
	 * 3.조장삽입
	 * @param: ProjectUserDTO -	projectUserNo, projectNo, userNo, projectUserRole
	 */
	public int insertProjectLeader(ProjectUserDTO projectUserDTO);
	
	/**
	 * 4.초대된 회원들의 id로 userNo 검색
	 * @param: list(���濡 �ʴ�� userId��)
	 */
	public List<Integer> selectUserNoById(List<String> invitedUserIdList);
	
	/**
	 * 5.조원 등록
	 */
	public int insertProjectMember(ProjectUserDTO projectUserDTO);
	
	/**
	 * projectEnddate가 현재날짜일때 projectState변경
	 */
	public int updateProjectState(int userNo);
	
	/**
	 * 조별과제목록을 검색 (map에 담아)
	 */
	public Map<String, List<ProjectDTO>> selectProjectById(int userNo);
	
	/**
	 * 조별과제 정보 검색
	 */
	public ProjectDTO selectProject(int projectNo);
	
	/**
	 * 조별과제 정보를 수정
	 */
	public int updateTeamInfo(ProjectDTO projectDTO);
	
	/**
	 * 조원정보 검색
	 */
	public List<UserDTO> selectProjectUsers(int projectNo);
	
	/**
	 * 조원 역할 수정
	 */
	public int updateProjectUserTask(ProjectUserDTO projectUserDTO);
	
	/**
	 * 조원 삭제
	 */
	public int deleteProjectUser(ProjectUserDTO projectUserDTO);
	
	/**
	 * 자신이 해당조별과제의 조장인지 조원인지 검색
	 */
	public String selectProjectUserRole(ProjectUserDTO projectUserDTO);
	
	/**
	 * project state가 1인 project들을 검색
	 * */
	public List<ProjectDTO> selectIfProjectState1(int userNo);
	
	/**
	 * 안읽은 쪽지갯수 header에 표시
	 */
	public int selectUnchkMessage(int userNo);
	
	/**
	 * 조원 초대시 이미 속해있는 조원인지 검색
	 */
	public String selectChkProjectMember(ProjectUserDTO projectUserDTO);
}
