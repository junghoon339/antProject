package com.ant.survey.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ant.project.service.ProjectService;
import com.ant.survey.service.SurveyService;
import com.ant.user.dto.UserDTO;

@Controller
@RequestMapping("/survey")
public class SurveyController {

	@Autowired
	private SurveyService surveyService;
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("/")
	@ResponseBody
	public List<UserDTO> survey(HttpSession session, int projectNo){
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		int userNo = user.getUserNo();
		String userName = user.getUserName();
		List<UserDTO> users = new ArrayList<>();
		List<UserDTO> projectUserList = projectService.selectProjectUsers(projectNo);
		
		
		for(UserDTO u : projectUserList){
			System.out.println(u.getUserName()+"=="+userName+"? --->"+!(u.getUserName().equals(userName)));
			if(!u.getUserName().equals(userName)){
				users.add(u);
			}
		}
		
		return users;
	}
	
	@RequestMapping("/mainPage")
	public String mainPage(HttpSession session){
		int projectNo = (int) session.getAttribute("projectNo");
		
		surveyService.updateTeamInfo(projectNo);
		return "redirect:/project/home";
	}
}
