package com.ant.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.synth.SynthSpinnerUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ant.project.dao.ProjectDAO;
import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;

@Service
@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAO projectDAO;
	
	@Override
	public int insertProject(ProjectDTO projectDTO, List<Integer> invitedUserNoList, int userNo) {
		int result=0;
		//1.조별과제방 삽입
		int resultInsPro = projectDAO.insertProject(projectDTO);
		
		//2.방금 삽입된 조별과제의 번호 검색
		int projectNo = projectDAO.selectProjectNo();
		
		//3.조장 삽입
		//조장을 조별과제방에 삽입
		ProjectUserDTO projectUserDTO = new ProjectUserDTO(projectNo, userNo);
		System.out.println("프로젝트번호"+projectUserDTO.getProjectNo()+" / 조장userNo : "+projectUserDTO.getUserNo());
		int resultInsLeader = insertProjectLeader(projectUserDTO);
		
		//4.초대된 조원에게 쪽지보내기
		//초대된 조원들
		System.out.println("\n 초대된 팀원의 번호......!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		for(int userNo2 : invitedUserNoList){
			System.out.println("초대된 팀원 id : " + userNo2);
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
		System.out.println("ProjectServiceImpl진입함!! userNo : "+userNo);
		Map<String, List<ProjectDTO>> projectMap = projectDAO.selectProjectById(userNo);
		System.out.println("ProjectServiceImpl에서 selectProjectById()호출결과!! projectMap : "+projectMap);

		
		return projectMap;
	}

	
	
	
	
	

}
