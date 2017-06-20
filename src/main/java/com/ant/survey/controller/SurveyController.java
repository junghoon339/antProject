package com.ant.survey.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
	public List<UserDTO> survey(int projectNo){
		System.out.println("값받아와버리기~"+projectNo);
		List<UserDTO> projectUserList = projectService.selectProjectUsers(projectNo);
		
//		List<UserDTO> projectUserList = new ArrayList<>();
//		projectUserList.add(new UserDTO("test@naver.com", "가용호", "1234", "코스타대학교", "자바보안과"));
//		projectUserList.add(new UserDTO("test2@naver.com", "나용호", "1234", "코스타대학교", "자바보안과"));
//		Date startDate = new Date();
//		Date endDate = new Date();
		
//		surveyService.surveyCreate(surveyDTO);
		for(UserDTO u : projectUserList){
			System.out.println("이름----> "+u.getUserName());
		}
		
		return projectUserList;
	}
}
