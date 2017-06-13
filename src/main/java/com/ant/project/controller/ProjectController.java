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
	 * Ȩȭ��(�α��μ����ϸ� ������� ȭ��)
	 */
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest req){
		//�α��ε� userNo 
/*		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();
		System.out.println("controller���� �޾ƿ��� userNo = " + userNo);
		
		//userNo�� ������������Ʈ, �Ϸ��������Ʈ
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
	 * �ϳ��� ������Ʈ����ȭ��
	 */
	@RequestMapping("/teamMain") 
	public String teamMain() {
		return "project/teamMain";
	}
	
	
	/**
	 * �������� ����
	 * @param:projectDTO
	 */
	@RequestMapping("/insertProject")
	public String insertProject(ProjectDTO projectDTO, String [] invitedUser, HttpServletRequest request){
		System.out.println("insertProject Controllerȣ���.............");
		
		//������ ��(���� �α�����) ȸ���� ��ȣ
		UserDTO userDTO = (UserDTO) request.getSession().getAttribute("userDTO");
		int userNo=userDTO.getUserNo();
		
		//���������濡 �ʴ�� ȸ������ id invitedUser�迭��  list�� ��ȯ
		List<String> invitedUserIdList = new ArrayList<>();
		Collections.addAll(invitedUserIdList, invitedUser);
				
		//�ʴ�� ȸ���� ��ȣ�� ���� ����Ʈ
		List<Integer> invitedUserNolist=projectService.selectUserNoById(invitedUserIdList);
		
		
		//���������� ���� service
		int resultInsPro =  projectService.insertProject(projectDTO,invitedUserNolist,userNo);
		
		

		return "";
	}
	
}
