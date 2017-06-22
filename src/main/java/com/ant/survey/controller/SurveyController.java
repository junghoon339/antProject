package com.ant.survey.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ant.project.service.ProjectService;
import com.ant.survey.dto.SurveyDTO;
import com.ant.survey.dto.SurveyDetailDTO;
import com.ant.survey.dto.SurveyUserDTO;
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
		
		SurveyDTO survey = surveyService.surveySelectByProjectNo(projectNo);
		int surveyNo = survey.getSurveyNo();
		
		SurveyUserDTO surveyUser = surveyService.surveyUserSelect(surveyNo, userNo);
		List<UserDTO> users = new ArrayList<>();
		
		if(surveyUser.getSurveyUserState()==1){
			return users;
		}
		
		String userName = user.getUserName();
		
		List<UserDTO> projectUserList = projectService.selectProjectUsers(projectNo);
		
		for(UserDTO u : projectUserList){
			if(!u.getUserName().equals(userName)){
				users.add(u);
			}
		}
		
		return users;
	}
	
	
	
	@RequestMapping("/mainPage")
	public String mainPage(HttpSession session){
		
		int projectNo = (int) session.getAttribute("projectNo");
		
		String surveyStartDate ;
		String surveyEndDate ;
		String surveyEndDate2;
		
		SimpleDateFormat sd = new SimpleDateFormat("MM/dd/yyyy", Locale.KOREA);
		SimpleDateFormat sd2 = new SimpleDateFormat("yy/MM/dd", Locale.KOREA);
		Date now = new Date();
		
		Calendar startCal = Calendar.getInstance();
		Calendar endCal = Calendar.getInstance();
		
		startCal.setTime(now);
		endCal.setTime(now);
		endCal.add(Calendar.DATE, 1);
		
		surveyStartDate = sd.format(startCal.getTime());
		surveyEndDate = sd.format(endCal.getTime());
		surveyEndDate2 = sd2.format(endCal.getTime());
		
		// 마감하기 이후, State 1로 변경하는 부분,,
		surveyService.updateTeamInfo(projectNo);
		
		//마감하기 이후, 프로젝트 종료시간을 변경하는 부분,,
		surveyService.closingProject(projectNo, surveyEndDate2);
		
		surveyService.surveyCreate(new SurveyDTO(0, projectNo, surveyStartDate, surveyEndDate, 0));
		
		SurveyDTO survey = surveyService.surveySelectByProjectNo(projectNo);
		int surveyNo = survey.getSurveyNo();
		
		List<UserDTO> projectUserList = projectService.selectProjectUsers(projectNo);
		
		for(UserDTO u : projectUserList){
			int userNo = u.getUserNo();
			surveyService.surveyUserCreate(new SurveyUserDTO(0, surveyNo, userNo, 0));
		}
		
		return "redirect:/project/home";
	}
	
	@RequestMapping("/insertSurveyDetail")
	public String createSurveyUser(HttpSession session, int projectNo, String[] userName, String[] userScore){
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		int userNo = user.getUserNo();
		SurveyDTO survey = surveyService.surveySelectByProjectNo(projectNo);
		int surveyNo = survey.getSurveyNo();
		SurveyUserDTO surveyUser = surveyService.surveyUserSelect(surveyNo, userNo);
		int surveyUserNo = surveyUser.getSurveyUserNo();
		for(int i=0; i<userName.length;i++){
			surveyService.surveyDetailCreate(new SurveyDetailDTO(0, surveyNo, surveyUserNo, userName[i], userScore[i]));
		}
		surveyService.surveyUserUpdate(surveyNo, userNo);
		
		List<SurveyUserDTO> surveyUsers = surveyService.surveyUserSelect(surveyNo);
		int a = 1;
		for(SurveyUserDTO su : surveyUsers){
			System.out.println(su.getSurveyNo() +" : "+ su.getUserNo()+"의 상태 = "+su.getSurveyUserState());
			a = a * su.getSurveyUserState();
		}
		if (a==1){
			System.out.println("모두참여햇음 ㅇㅇ");
			surveyService.closedProject(projectNo);
		}
		return "redirect:/project/home";
	}
}
