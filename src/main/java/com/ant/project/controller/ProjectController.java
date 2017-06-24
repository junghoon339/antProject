package com.ant.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.StandardSocketOptions;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ant.calendar.dto.UserCalendarDTO;
import com.ant.calendar.service.UserCalendarService;
import com.ant.message.dto.MessageDTO;
import com.ant.message.service.MessageService;
import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;
import com.ant.project.service.ProjectService;
import com.ant.survey.controller.SurveyController;
import com.ant.survey.dto.SurveyDTO;
import com.ant.survey.dto.SurveyUserDTO;
import com.ant.survey.service.SurveyService;
import com.ant.user.dto.UserDTO;
import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXPlanner;
import com.dhtmlx.planner.DHXSecurity;
import com.dhtmlx.planner.DHXSkin;
import com.dhtmlx.planner.DHXStatus;
import com.itextpdf.text.log.SysoCounter;
import com.sun.org.apache.bcel.internal.generic.NEW;

@Controller
@RequestMapping("/project")
public class ProjectController implements Serializable {
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserCalendarService calendarService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private SurveyController surveyController;
	
	@Autowired
	private SurveyService surveyService;
	
	public static String date_format = "MM/dd/yyyy HH:mm";
	public static String filter_format = "yyyy-MM-dd";
	public DHXSecurity security;
	private HashMap<String, String> attributes;
	private Date from;
	private Date to;
	private Boolean dynFilter;
	private List<String> chatList;
	/**
	 * 진행중인 조별과제 홈화면(로그인하면 나오는 페이지)
	 * @throws ParseException 
	 * @throws Exception
	 */
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest req) throws ParseException{
		
		//NA-DRAGON-TIGER 지역변수 선언
		String surveyStartDate ;
		String surveyEndDate ;
		
		SimpleDateFormat sd = new SimpleDateFormat("MM/dd/yyyy", Locale.KOREA);
		Date now = new Date();
		Calendar surveyStartCal = Calendar.getInstance();
		Calendar surveyEndCal = Calendar.getInstance();
		
		surveyStartCal.setTime(now);
		surveyEndCal.setTime(now);
		surveyEndCal.add(Calendar.DATE, 1);
		
		surveyStartDate = sd.format(surveyStartCal.getTime());
		surveyEndDate = sd.format(surveyEndCal.getTime());
		
		//홈화면 진입시 projectNo에 null을 담음
		req.getSession().setAttribute("projectNo", null);
		
		// 현재 로그인된 userNo
		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();

		//현재시간=enddate가 된 조별과제를 진행중->완료대기중으로 자동수정
		int updateProState = projectService.updateProjectState(userNo);
		

		//Project STATE가 1인 경우, SURVEY를 생성하는 구문
		List<ProjectDTO> projects = projectService.selectIfProjectState1(userNo);
		Map<Integer, Boolean> surveySuccessList = new TreeMap<>();
		if(projects.size()!=0){
			for(ProjectDTO project : projects){
				int projectNo = project.getProjectNo();
				SurveyDTO survey = surveyService.surveySelectByProjectNo(projectNo);
				if(survey==null){
					// Project STATE가 1임에도 survey가 없는 경우 생성
					surveyService.surveyCreate(new SurveyDTO(0, projectNo, surveyStartDate, surveyEndDate, 0));
					SurveyDTO getSurvey = surveyService.surveySelectByProjectNo(projectNo);
					int surveyNo = getSurvey.getSurveyNo();
					
					List<UserDTO> projectUserList = projectService.selectProjectUsers(projectNo);
					
					for(UserDTO u : projectUserList){
						int getUserNo = u.getUserNo();
						surveyService.surveyUserCreate(new SurveyUserDTO(0, surveyNo, getUserNo, 0));
					}
					
				}// if(survey != null) end
				else{
					SurveyDTO getSurvey = surveyService.surveySelectByProjectNo(projectNo);
					int surveyNo = getSurvey.getSurveyNo();
					
					SurveyUserDTO surveyUserDTO =  surveyService.surveyUserSelect(surveyNo, userNo);
					int state = surveyUserDTO.getSurveyUserState();
					
					//이미 투표에 참여했다면, true를 통해 home_ch에서 설문조사 참여완료를 표시
					surveySuccessList.put(projectNo, state==1? true : false);
				}
			}// for(ProjectDTO project : projects) end
		}// if(!projects.isEmpty()) end

		
		
		
		// 현재진행중, 완료대기중 조별과제를 담은 map
		Map<String, List<ProjectDTO>> projectMap = projectService.selectProjectById(userNo);
		List<ProjectDTO> currentProList = projectMap.get("currentProList");
		List<ProjectDTO> surveyingProList = projectMap.get("surveyingProList");
		//List<ProjectDTO> completedProList = projectMap.get("completedProList");
		
		for(ProjectDTO dto:currentProList){
			Calendar startCal = Calendar.getInstance();
			
			startCal.setTime(new Date());
			long startTime = startCal.getTimeInMillis();
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date to = format.parse(dto.getProjectEnddate());
			
			startCal.setTime(to);
			long goalTime =startCal.getTimeInMillis();
			
			long dday = (goalTime-startTime);
			dday = dday/1000/60/60/24;
			
			dto.setDday((int)dday+1);
		}
		for(ProjectDTO dto:surveyingProList){
			Calendar startCal = Calendar.getInstance();
			
			startCal.setTime(new Date());
			long startTime = startCal.getTimeInMillis();
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date to = format.parse(dto.getProjectEnddate());
			
			startCal.setTime(to);
			long goalTime =startCal.getTimeInMillis();
			
			long dday = (goalTime-startTime);
			dday = dday/1000/60/60/24;
			
			dto.setDday((int)dday+1);
			//System.out.println("디데이: " + dto.getDday());
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("project/home_ch");
		mv.addObject("currentProList",currentProList);
		mv.addObject("surveyingProList",surveyingProList);
		mv.addObject("surveySuccessList", surveySuccessList);
		return mv;
	}
	
	/**
	 * 완료된 조별과제 
	 */
	@RequestMapping("/completedProject")
	public ModelAndView completedProject(HttpServletRequest req){
				
		// 현재 로그인된 userNo
		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();
		
		//완료된 조별과제를 담은 map
		Map<String, List<ProjectDTO>> projectMap = projectService.selectProjectById(userNo);
		List<ProjectDTO> completedProList = projectMap.get("completedProList");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("project/completedProject_ch");
		mv.addObject("completedProList",completedProList);
		return mv;
	}

	/**
	 * 하나의 팀프로젝트 메인화면
	 */
	@RequestMapping("/teamMain")
	public String teamMain(ProjectDTO projectDTO, HttpServletRequest req) {
		//session에 projectNo, projectState담기
		req.getSession().setAttribute("projectNo", projectDTO.getProjectNo());
		req.getSession().setAttribute("projectState", projectDTO.getProjectState());
		
		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();
		
		ProjectUserDTO projectUserDTO = new ProjectUserDTO(projectDTO.getProjectNo(), userNo);
		String projectUserRole = projectService.selectProjectUserRole(projectUserDTO);
		
		//session에 projectUserRole(조원,조장) 담음
		req.getSession().setAttribute("projectUserRole", projectUserRole);
		
		return "/project/teamMain_ch";
	}

	/**
	 * 새로운 조별과제방 생성
	 * @param:projectDTO
	 */
	@RequestMapping("/insertProject")
	public String insertProject(ProjectDTO projectDTO, String[] invitedUser, HttpServletRequest req) {

		// 조장이 될(현재 로그인한) 회원의 번호
		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();

		List<Integer> invitedUserNolist = null;
		
		//초대할 회원들이 존재한다면
		if(invitedUser!=null){	
			// 조별과제방에 초대된 회원들의 id invitedUser배열을 list로 변환
			List<String> invitedUserIdList = new ArrayList<>();
			Collections.addAll(invitedUserIdList, invitedUser);
				
			String messageReceiver ="";
			for(String userId : invitedUser){
				messageReceiver += userId+";";
			}
			System.out.println("최종 messageReceiver : " + messageReceiver);
			
			//초대장에 담을 projectNo
			//int projectNo = (int) req.getSession().getAttribute("projectNo");

			MessageDTO messageDTO = new MessageDTO();
			messageDTO.setMessageContent(userDTO.getUserName()+"님이 ["+projectDTO.getProjectName()+"] 조별과제방으로 초대함-생성시 초대"); //쪽지내용
			messageDTO.setUserNoMessageSender(userDTO.getUserNo()); //보내는사람userNo
			messageDTO.setMessageReceiver(messageReceiver); //받는사람ID
			//조원들에게 초대쪽지보내기
			messageService.messageInsert(messageDTO);
			
			// 초대된 회원의 번호를 담은 리스트
			//invitedUserNolist = projectService.selectUserNoById(invitedUserIdList);
		}

		// 조별과제방 삽입 service
		int resultInsPro = projectService.insertProject(projectDTO, invitedUser, userNo);

		return "redirect:/project/home";
	}

	/**
	 * 조별과제 정보 조회 
	 */
	@RequestMapping("/teamInfo")
	public ModelAndView teamInfo(HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		
		ProjectDTO projectDTO = projectService.selectProject(projectNo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("projectDTO", projectDTO);
		mv.setViewName("project/teamInfo_ch");
		
		return mv;
	}
	
	/**
	 * 조별과제 정보 수정
	 */
	@RequestMapping("/updateTeamInfo")
	public String updateTeamInfo(ProjectDTO projectDTO,HttpServletRequest req){
		System.out.println("업데이트 컨트롤러 실행됬다!!!!");
		int projectNo = (int) req.getSession().getAttribute("projectNo");	
		projectDTO.setProjectNo(projectNo);
		System.out.println("수정하려고하는 프로젝트 상태 : "+projectDTO.getProjectState());
		int result = projectService.updateTeamInfo(projectDTO);
		return "redirect:/project/teamInfo";
	}
	
	/**
	 * 조별과제 팀원 조회
	 */
	@RequestMapping("/projectUserInfo")
	public ModelAndView projectUserInfo(HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		List<UserDTO> projectUserList = projectService.selectProjectUsers(projectNo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("projectUserList",projectUserList);
		mv.setViewName("project/projectUserInfo_ch");
		return mv;
	}
	
	@RequestMapping("/chat")
	public ModelAndView chat(HttpSession session){
		int projectNo = (int) session.getAttribute("projectNo");
		ModelAndView mv = new ModelAndView("chat/chatBackUp");
		
		try {
			File file = new File("/chat/chat_room_no_" + projectNo + ".txt");
			if (!file.exists()){
				file.createNewFile();
			}
			chatList = FileUtils.readLines(file,"utf-8");
		} catch (IOException e) {
			e.printStackTrace();
		}

		mv.addObject("chatList", chatList);
		return mv;
	}
	
	/**
	 * 조별과제 팀원별 역할 수정
	 */
	@RequestMapping("/updateProjectUserTask")
	public String updateProjectUserTask(ProjectUserDTO projectUserDTO, HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		projectUserDTO.setProjectNo(projectNo);
		
		int result = projectService.updateProjectUserTask(projectUserDTO);
		
		return "redirect:/project/projectUserInfo";
	}
	
	/**
	 * 조별과제 팀원 삭제
	 */
	@RequestMapping("/deleteProjectUser")
	public String deleteProjectUser(ProjectUserDTO projectUserDTO, HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		projectUserDTO.setProjectNo(projectNo);
		
		int result = projectService.deleteProjectUser(projectUserDTO);
		
		return "redirect:/project/projectUserInfo";
	}
	
	/**
	 * 팀원 초대-팀원정보 페이지에서
	 */
	@RequestMapping("/addProjectUser")
	public String addProjectUser(String userId, HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");

		ProjectDTO projectDto=projectService.selectProject(projectNo);
		
		MessageDTO messageDTO = new MessageDTO();
		messageDTO.setMessageContent(userDTO.getUserName()+"님이 [" +projectDto.getProjectName()+ "] 조별과제방으로 초대했습니다.-추가초대"); //쪽지내용
		messageDTO.setUserNoMessageSender(userDTO.getUserNo()); //보내는사람userNo
		messageDTO.setMessageReceiver(userId); //받는사람ID
		
		messageService.messageInsert(messageDTO);

		ProjectUserDTO projectUserDTO = new ProjectUserDTO();
		projectUserDTO.setProjectNo(projectNo);
		projectUserDTO.setUserId(userId);
		projectService.insertProjectMember(projectUserDTO);
		
		return "redirect:/project/projectUserInfo";
	}
	
	@RequestMapping("/report")
	public ModelAndView report(HttpServletRequest req){
		ModelAndView mv = new ModelAndView("project/report");
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		ProjectDTO projectDTO = projectService.selectProject(projectNo);
		List<UserDTO> projectUserList = projectService.selectProjectUsers(projectNo);
		
		
		
		
		mv.addObject("projectUserList",projectUserList);
		mv.addObject("projectDTO",projectDTO);
		
		return mv;
	}

	/**
	 * 안읽은 쪽지갯수 header에 표시 패배
	 */
	@RequestMapping("selectUnchkMessage")
	@ResponseBody
	public int selectUnchkMessage(HttpServletRequest req){
		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		return projectService.selectUnchkMessage(userDTO.getUserNo());
	}
}
