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
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.ant.user.dto.UserDTO;
import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXPlanner;
import com.dhtmlx.planner.DHXSecurity;
import com.dhtmlx.planner.DHXSkin;
import com.dhtmlx.planner.DHXStatus;
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

	public static String date_format = "MM/dd/yyyy HH:mm";
	public static String filter_format = "yyyy-MM-dd";
	public DHXSecurity security;
	private HashMap<String, String> attributes;
	private Date from;
	private Date to;
	private Boolean dynFilter;
	private List<String> chatList;
	/**
	 * 홈화면(로그인 성공하면 띄워지는 화면)
	 * @throws Exception
	 */
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest req) throws Exception {
		// 로그인된 userNo
		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();

		// userNo로 진행중프로젝트, 완료된프로젝트 
		Map<String, List<ProjectDTO>> projectMap = projectService.selectProjectById(userNo);
		List<ProjectDTO> currentProList = projectMap.get("currentProList");
		List<ProjectDTO> surveyingProList = projectMap.get("surveyingProList");
		List<ProjectDTO> completedProList = projectMap.get("completedProList");
		//System.out.println("completedProList: " + completedProList.isEmpty());
		
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
			System.out.println("디데이 : "+dday);
		}
		

		// 4개의 tab에 들어갈 데이터 준비...
		//System.out.println("select뿌려라!!!");
		String contextPath = req.getContextPath();
/*		HttpSession session = req.getSession();

		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		int userNo = userDTO.getUserNo();*/

		// calendar영역
		DHXPlanner planner = new DHXPlanner(contextPath + "/resources/codebase/", DHXSkin.TERRACE);
		planner.localizations.set("cr");
		planner.setWidth(900);

		planner.setInitialView("month");

		planner.config.setTimeStep(60);
		planner.config.setEventDuration(60);
		planner.config.setAutoEndDate(true);
		planner.config.setFirstHour(9);
		planner.config.setLastHour(19);
		planner.config.setStartOnMonday(false);
		planner.config.setMonthDate("%Y년 %M월");
		planner.config.setDefaultDate("%Y년 %M월 %j일");
		planner.config.setDayDate("%D");

		CsrfToken token = (CsrfToken) req.getAttribute(CsrfToken.class.getName());
		//System.out.println("token:" + token);

		planner.data.dataprocessor
				.setURL(contextPath + "/project/events?" + token.getParameterName() + "=" + token.getToken());
		planner.parse(calendarService.getEvent(userNo));

		ModelAndView mv = new ModelAndView();
		mv.addObject("schedule", planner.render());
		mv.setViewName("project/home");
		mv.addObject("currentProList",currentProList);
		mv.addObject("surveyingProList",surveyingProList);
		mv.addObject("completedProList",completedProList);
		return mv;
	}

	/**
	 * 하나의 조별과제 메인화면
	 */
	@RequestMapping("/teamMain/{projectNo}")
	public String teamMain(@PathVariable int projectNo, HttpServletRequest req) {
		//session에 projectNo저장
		req.getSession().setAttribute("projectNo", projectNo);
		
		//session에 조원,조장 담기
		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();
		
		ProjectUserDTO projectUserDTO = new ProjectUserDTO(projectNo, userNo);
		String projectUserRole = projectService.selectProjectUserRole(projectUserDTO);
		
		req.getSession().setAttribute("projectUserRole", projectUserRole);
		
		return "/project/teamMain";
	}

	/**
	 * 조별과제 삽입
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
	 * 팀플정보 전체 조회
	 */
	@RequestMapping("/teamInfo")
	public ModelAndView teamInfo(HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		ProjectDTO projectDTO = projectService.selectProject(projectNo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("projectDTO",projectDTO);
		mv.setViewName("project/teamInfo");
		return mv;
	}
	
	/**
	 * 팀플정보 수정
	 */
	@RequestMapping("/updateTeamInfo")
	public String updateTeamInfo(ProjectDTO projectDTO,HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");	
		projectDTO.setProjectNo(projectNo);
		int result = projectService.updateTeamInfo(projectDTO);
		return "redirect:/project/teamInfo";
	}
	
	/**
	 * 팀원정보 전체 조회
	 */
	@RequestMapping("/projectUserInfo")
	public ModelAndView projectUserInfo(HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		List<UserDTO> projectUserList = projectService.selectProjectUsers(projectNo);
		
		//System.out.println("controller에서 받아오는 팀원리스트 projectUserList"+projectUserList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("projectUserList",projectUserList);
		mv.setViewName("project/projectUserInfo");
		return mv;
	}
	
	@RequestMapping("/chat")
	public ModelAndView chat(HttpSession session){
		int projectNo = (int) session.getAttribute("projectNo");
		ModelAndView mv = new ModelAndView("chat/chat");
		
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
	 * 팀원정보중 맡은임무 수정
	 */
	@RequestMapping("/updateProjectUserTask")
	public String updateProjectUserTask(ProjectUserDTO projectUserDTO, HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		projectUserDTO.setProjectNo(projectNo);
		
		int result = projectService.updateProjectUserTask(projectUserDTO);
		
		return "redirect:/project/projectUserInfo";
	}
	
	/**
	 * 팀원 삭제
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
	
	@RequestMapping("/events")
	@ResponseBody
	public String events(HttpServletRequest request) throws Exception {
		System.out.println("1. event접근");
		String value = request.getParameter("ids");

		String actions = "";
		if (value != null) {
			String ids[] = value.split(",");
			for (int i = 0; i < ids.length; i++)
				actions = (new StringBuilder()).append(actions)
						.append(saveOne(request, ids[i], (new StringBuilder()).append(ids[i]).append("_").toString()))
						.toString();

		} else {
			value = request.getParameter("id");
			System.out.println("id:" + value);
			if (value != null)
				actions = (new StringBuilder()).append(actions).append(saveOne(request, value, "")).toString();
		}
		return (new StringBuilder()).append("<?xml version=\"1.0\"?><data>").append(actions).append("</data>")
				.toString();
	}

	private String saveOne(HttpServletRequest request, String id, String prefix) {
		System.out.println("2. saveOne접근");
		security = new DHXSecurity();
		attributes = new HashMap<String, String>();
		from = null;
		to = null;
		dynFilter = Boolean.valueOf(true);
		HttpSession session = request.getSession();
		String st = request
				.getParameter((new StringBuilder()).append(prefix).append("!nativeeditor_status").toString());
		DHXStatus status = DHXStatus.UNKNOWN;
		if (st.equals("insert") || st.equals("inserted"))
			status = DHXStatus.INSERT;
		else if (st.equals("update") || st.equals("updated"))
			status = DHXStatus.UPDATE;
		else if (st.equals("delete") || st.equals("deleted"))
			status = DHXStatus.DELETE;
		System.out.println("2.saveOne에서 id접근:"+id);
		DHXEv ev = createEvent(id, status);
		System.out.println("2.saveOne에서 ev.getId()접근222222:"+ev.getId());
		attributes.clear();

		if (security.can(status).booleanValue()) {
			Method m[] = ev.getClass().getMethods();
			for (int i = 0; i < m.length; i++) {
				String name = m[i].getName();
				if (status == DHXStatus.INSERT && name.equals("setId") || !name.startsWith("set"))
					continue;
				String param = toLowerCase(name.substring(3));

				String value = request.getParameter((new StringBuilder()).append(prefix).append(param).toString());

				if (value == null)
					continue;
				Class t[] = new Class[1];
				t[0] = java.lang.String.class;
				Method method = null;
				try {
					method = ev.getClass().getMethod(name, t);
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
				} catch (SecurityException e) {
					e.printStackTrace();
				}
				try {
					method.invoke(ev, new Object[] { value });
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
			}

			status = saveEvent(ev, status, session);
		} else {
			status = DHXStatus.ERROR;
		}
		if (status == DHXStatus.UPDATE)
			st = "update";
		else if (status == DHXStatus.DELETE)
			st = "delete";
		else if (status == DHXStatus.INSERT)
			st = "inserted";
		else if (status == DHXStatus.ERROR)
			st = "error";
		String attrs = "";

		Set<String> keys = attributes.keySet();
		for (Iterator<String> i$ = keys.iterator(); i$.hasNext();) {
			String key = i$.next();
			attrs = (new StringBuilder()).append(attrs).append(" ").append(key).append("=\"")
					.append(attributes.get(key)).append("\"").toString();
		}

		return (new StringBuilder()).append("<action type=\"").append(st).append("\" sid=\"").append(id)
				.append("\" tid=\"").append(ev.getId()).append("\"").append(attrs).append(" />").toString();
	}

	private String toLowerCase(String value) {
		System.out.println("3. toLowerCase접근");
		String first = value.substring(0, 1);
		String last = value.substring(1);
		return (new StringBuilder()).append(first.toLowerCase()).append(last).toString();
	}

	public DHXEv createEvent(String id, DHXStatus status) {
		System.out.println("4. createEvent접근");
		return new DHXEvent();
	}

	public DHXStatus saveEvent(DHXEv event, DHXStatus status, HttpSession session) {
		System.out.println("5. saveEvent접근");
		if (event.getStart_date().getHours() == 0) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(event.getStart_date());
			calendar.set(Calendar.HOUR, 9);
			event.setStart_date(calendar.getTime());
		}
		if (event.getEnd_date().getHours() == 0) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(event.getEnd_date());
			calendar.set(Calendar.HOUR, 17);
			event.setEnd_date(calendar.getTime());

		}

		String start_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(event.getStart_date());
		String end_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(event.getEnd_date());

		UserCalendarDTO schedule = new UserCalendarDTO();

		schedule.setEvent_name(event.getText());

		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		schedule.setUser_no(userDTO.getUserNo());
		System.out.println("user_no" + userDTO.getUserNo());

		schedule.setStart_date(start_date);
		schedule.setEnd_date(end_date);
		
		if(event.getId()!=null){
			System.out.println("아ㅏㅏㅏㅏㅏㅏ"+event.getId());
			schedule.setEvent_id(event.getId());
		}
		
		/*Integer i=null;
		i=schedule.getEvent_id();
		  System.out.println("iiiiiiiiiiiiiiii:"+i);
		  
		  
		 if(i!=null){
			 
			 System.out.println("i가 null 아닐때:"+schedule.getEvent_id());
		 }
		  System.out.println("event.getId()zzzzzz:"+event.getId());*/

		if (status == DHXStatus.UPDATE) {
			System.out.println("update 컨트롤러->서비스 접근");
			calendarService.updateEvent(schedule);
			event.setId(schedule.getEvent_id());
		} else if (status == DHXStatus.INSERT) {
			System.out.println("insert 컨트롤러->서비스 접근");
			
			calendarService.insertEvent(schedule);
			System.out.println("에러?:"+schedule.getEvent_id());
			
			event.setId(schedule.getEvent_id()-1);

		} else if (status == DHXStatus.DELETE) {
			calendarService.deleteEvent(event.getId());

		}

		return status;
	}

	protected void parseRequest(HttpServletRequest request) {
		System.out.println("6. parseRequest 접근");
		if (request == null)
			return;
		String fromValue = request.getParameter("from");
		String toValue = request.getParameter("to");
		try {
			if (fromValue != null)
				from = (new SimpleDateFormat(filter_format)).parse(fromValue);
			if (toValue != null)
				to = (new SimpleDateFormat(filter_format)).parse(toValue);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	protected Boolean filterEvent(DHXEv ev) {
		System.out.println("7. filterEvent 접근");
		if (!dynFilter.booleanValue())
			return Boolean.valueOf(true);
		if (from == null && to == null)
			return Boolean.valueOf(true);
		if (from != null && !ev.getStart_date().after(from))
			return Boolean.valueOf(false);
		if (to != null && !ev.getEnd_date().before(to))
			return Boolean.valueOf(false);
		else
			return Boolean.valueOf(true);
	}

	public Date getFilterFrom() {
		return from;
	}

	public Date getFilterTo() {
		return to;
	}

	public void setDynFilter(Boolean value) {
		dynFilter = value;
	}

	public Date getFrom() {
		return from;
	}

	public void setFrom(Date from) {
		this.from = from;
	}

	public Date getTo() {
		return to;
	}

	public void setTo(Date to) {
		this.to = to;
	}

	public Boolean getDynFilter() {
		return dynFilter;
	}

	public void addResponseAttribute(String name, String value) {
		attributes.put(name, value);
	}

}
