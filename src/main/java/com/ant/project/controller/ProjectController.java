package com.ant.project.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;
import com.ant.project.service.ProjectService;
import com.ant.user.dto.UserDTO;
import com.ant.user.service.UserService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * 홈화면(로그인성공하면 띄워지는 화면)
	 */
	@RequestMapping("/home")
	public void home(){}
	
	
	/**
	 * 조별과제 삽입
	 * @param:projectDTO
	 */
	@RequestMapping("/insertProject")
	public String insertProject(ProjectDTO projectDTO, String [] invitedUser, HttpServletRequest request){
		System.out.println("insertProject Controller호출됨.............");
		
		//1.조별과제방 삽입
		int resultInsPro =  projectService.insertProject(projectDTO);
		
		//2.방금 삽입된 조별과제의 번호 검색
		int projectNo = projectService.selectProjectNo();
		
		//3.조장 삽입
		//조장ID(지금로그인된ID)를 갖고 user_no검색
		UserDTO userDTO = userService.selectUserById("tina818@naver.com");	//나중에바꿀것!!★★★★★★★★★
		int userNo=userDTO.getUserNo();
		
		//조장을 조별과제방에 삽입
		ProjectUserDTO projectUserDTO = new ProjectUserDTO(projectNo, userNo);
		System.out.println("프로젝트번호"+projectUserDTO.getProjectNo()+" / 조장userNo : "+projectUserDTO.getUserNo());
		int resultInsLeader = projectService.insertProjectLeader(projectUserDTO);
		
		//4.초대된 조원에게 쪽지보내기
		//초대된 조원의 id로 userNo검색
		System.out.println("\n form에서 넘어오는 invitedUser배열");
		for(String user : invitedUser){
			System.out.println("초대된 팀원 id : " + user);
		}
		//invitedUser배열을 list로 변환
		ArrayList<String> invitedUserIdList = new ArrayList<>();
		Collections.addAll(invitedUserIdList, invitedUser);
		
		System.out.println("\n invitedUser배열을 list로 변환됨......");
		for(String userId : invitedUserIdList){
			System.out.println("초대된 팀원 id : " + userId);
		}
		
		
		List<Integer> invitedUserNolist=projectService.SelectUserNoById(invitedUserIdList);
		System.out.println("\n 초대된 팀원의 번호......!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		for(int userNo2 : invitedUserNolist){
			System.out.println("초대된 팀원 id : " + userNo2);
		}
		
		return "";
	}
	
	

	
	/**
	 * 4.팀원ID를 갖고 userno 검색
	 * @param: list(팀방에 초대된 userId들)
	 */
	
	
	
}
