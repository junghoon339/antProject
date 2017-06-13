package com.ant.project.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView home(HttpServletRequest req){
		//로그인된 userNo 
/*		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();
		System.out.println("controller에서 받아오는 userNo = " + userNo);
		
		//userNo로 진행중프로젝트, 완료된프로젝트
		Map<String, List<ProjectDTO>> projectMap = projectService.selectProjectById(userNo);
		List<ProjectDTO> currentProList = projectMap.get("currentProList");
		List<ProjectDTO> completedProList = projectMap.get("completedProList");
		
		
		System.out.println("------------------------------------currentProList : "+currentProList);
		for(ProjectDTO dto :currentProList)
			System.out.println("/proNo : "+dto.getProjectNo()+"/proName : "+dto.getProjectName()+"/state : "+dto.getProjectState());
		
		System.out.println("------------------------------------completedProList : "+completedProList);
		for(ProjectDTO dto :completedProList)
			System.out.println("/proNo : "+dto.getProjectNo()+"/proName : "+dto.getProjectName()+"/state : "+dto.getProjectState());
		
		*/
		ModelAndView mv = new ModelAndView();
		//mv.addObject("currentProList",currentProList);
		//mv.addObject("completedProList",completedProList);
		mv.setViewName("project/home");
		return mv;
	}
	
	/**
	 * 하나의 프로젝트메인화면
	 */
	@RequestMapping("/teamMain") 
	public String teamMain() {
		return "project/teamMain";
	}
	
	
	/**
	 * 조별과제 삽입
	 * @param:projectDTO
	 */
	@RequestMapping("/insertProject")
	public String insertProject(ProjectDTO projectDTO, String [] invitedUser, HttpServletRequest request){
		System.out.println("insertProject Controller호출됨.............");
		
		//조장이 될(현재 로그인한) 회원의 번호
		UserDTO userDTO = (UserDTO) request.getSession().getAttribute("userDTO");
		int userNo=userDTO.getUserNo();
		
		//조별과제방에 초대된 회원들의 id invitedUser배열을  list로 변환
		List<String> invitedUserIdList = new ArrayList<>();
		Collections.addAll(invitedUserIdList, invitedUser);
				
		//초대된 회원의 번호를 담은 리스트
		List<Integer> invitedUserNolist=projectService.selectUserNoById(invitedUserIdList);
		
		
		//조별과제방 삽입 service
		int resultInsPro =  projectService.insertProject(projectDTO,invitedUserNolist,userNo);
		
		

		return "";
	}
	
}
