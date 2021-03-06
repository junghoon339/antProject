package com.ant.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
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

@Controller
@RequestMapping("/project")
public class ProjectController implements Serializable {
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserCalendarService calendarService;

	public static String date_format = "MM/dd/yyyy HH:mm";
	public static String filter_format = "yyyy-MM-dd";
	public DHXSecurity security;
	private HashMap attributes;
	private Date from;
	private Date to;
	private Boolean dynFilter;
	private List<String> chatList;
	/**
	 * 幡鉢檎(稽益昔 失因馬檎 句趨走澗 鉢檎)
	 * @throws Exception
	 */
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest req) throws Exception {
		// 稽益昔吉 userNo
		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();
		System.out.println("controller拭辞 閤焼神澗 userID= "+userDTO.getUserId()+"/ userNo= " + userNo);

		// userNo稽 遭楳掻覗稽詮闘, 刃戟吉覗稽詮闘 
		Map<String, List<ProjectDTO>> projectMap = projectService.selectProjectById(userNo);
		List<ProjectDTO> currentProList = projectMap.get("currentProList");
		List<ProjectDTO> completedProList = projectMap.get("completedProList");
		//System.out.println("currentProList: " + currentProList.isEmpty());
		//System.out.println("completedProList: " + completedProList.isEmpty());
		
		

		// 4鯵税 tab拭 級嬢哀 汽戚斗 層搾...
		//System.out.println("select姿形虞!!!");
		String contextPath = req.getContextPath();
/*		HttpSession session = req.getSession();

		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		int userNo = userDTO.getUserNo();*/

		// calendar慎蝕
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
		planner.config.setMonthDate("%Y鰍 %M杉");
		planner.config.setDefaultDate("%Y鰍 %M杉 %j析");
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
		mv.addObject("completedProList",completedProList);
		return mv;
	}

	/**
	 * 馬蟹税 繕紺引薦 五昔鉢檎
	 */
	@RequestMapping("/teamMain/{projectNo}")
	public String teamMain(@PathVariable int projectNo, HttpServletRequest req) {
		//session拭 projectNo煽舌
		req.getSession().setAttribute("projectNo", projectNo);
		
		//session拭 繕据,繕舌 眼奄
		UserDTO userDTO = (UserDTO) req.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();
		
		ProjectUserDTO projectUserDTO = new ProjectUserDTO(projectNo, userNo);
		String projectUserRole = projectService.selectProjectUserRole(projectUserDTO);
		
		req.getSession().setAttribute("projectUserRole", projectUserRole);
		
		return "/project/teamMain";
	}

	/**
	 * 繕紺引薦 諮脊
	 * @param:projectDTO
	 */
	@RequestMapping("/insertProject")
	public String insertProject(ProjectDTO projectDTO, String[] invitedUser, HttpServletRequest request) {

		// 繕舌戚 吃(薄仙 稽益昔廃) 噺据税 腰硲
		UserDTO userDTO = (UserDTO) request.getSession().getAttribute("userDTO");
		int userNo = userDTO.getUserNo();

		// 繕紺引薦号拭 段企吉 噺据級税 id invitedUser壕伸聖 list稽 痕発
		List<String> invitedUserIdList = new ArrayList<>();
		Collections.addAll(invitedUserIdList, invitedUser);

		// 段企吉 噺据税 腰硲研 眼精 軒什闘
		List<Integer> invitedUserNolist = projectService.selectUserNoById(invitedUserIdList);

		// 繕紺引薦号 諮脊 service
		int resultInsPro = projectService.insertProject(projectDTO, invitedUserNolist, userNo);

		return "redirect:/project/home";
	}

	/**
	 * 得巴舛左 穿端 繕噺
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
	 * 得巴舛左 呪舛
	 */
	@RequestMapping("/updateTeamInfo")
	public String updateTeamInfo(ProjectDTO projectDTO,HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");	
		projectDTO.setProjectNo(projectNo);
		int result = projectService.updateTeamInfo(projectDTO);
		return "redirect:/project/teamInfo";
	}
	
	/**
	 * 得据舛左 穿端 繕噺
	 */
	@RequestMapping("/projectUserInfo")
	public ModelAndView projectUserInfo(HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		List<UserDTO> projectUserList = projectService.selectProjectUsers(projectNo);
		
		//System.out.println("controller拭辞 閤焼神澗 得据軒什闘 projectUserList"+projectUserList);
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
			chatList = FileUtils.readLines(new File("/chat/chat_room_no_" + projectNo + ".txt"), "utf-8");
		} catch (IOException e) {
			e.printStackTrace();
		}

		mv.addObject("chatList", chatList);
		return mv;
	}
	
	/**
	 * 得据舛左掻 乎精績巷 呪舛
	 */
	@RequestMapping("/updateProjectUserTask")
	public String updateProjectUserTask(ProjectUserDTO projectUserDTO, HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		projectUserDTO.setProjectNo(projectNo);
		
		int result = projectService.updateProjectUserTask(projectUserDTO);
		
		return "redirect:/project/projectUserInfo";
	}
	
	/**
	 * 得据 肢薦
	 */
	@RequestMapping("/deleteProjectUser")
	public String deleteProjectUser(ProjectUserDTO projectUserDTO, HttpServletRequest req){
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		projectUserDTO.setProjectNo(projectNo);
		
		int result = projectService.deleteProjectUser(projectUserDTO);
		
		return "redirect:/project/projectUserInfo";
	}
	
	
	@RequestMapping("/events")
	@ResponseBody
	public String events(HttpServletRequest request) throws Exception {
		System.out.println("1. event羨悦");
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
		System.out.println("2. saveOne羨悦");
		security = new DHXSecurity();
		attributes = new HashMap();
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
		System.out.println("2.saveOne拭辞 id羨悦:"+id);
		DHXEv ev = createEvent(id, status);
		System.out.println("2.saveOne拭辞 ev.getId()羨悦222222:"+ev.getId());
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

		Set keys = attributes.keySet();
		for (Iterator i$ = keys.iterator(); i$.hasNext();) {
			String key = (String) i$.next();
			attrs = (new StringBuilder()).append(attrs).append(" ").append(key).append("=\"")
					.append((String) attributes.get(key)).append("\"").toString();
		}

		return (new StringBuilder()).append("<action type=\"").append(st).append("\" sid=\"").append(id)
				.append("\" tid=\"").append(ev.getId()).append("\"").append(attrs).append(" />").toString();
	}

	private String toLowerCase(String value) {
		System.out.println("3. toLowerCase羨悦");
		String first = value.substring(0, 1);
		String last = value.substring(1);
		return (new StringBuilder()).append(first.toLowerCase()).append(last).toString();
	}

	public DHXEv createEvent(String id, DHXStatus status) {
		System.out.println("4. createEvent羨悦");
		return new DHXEvent();
	}

	public DHXStatus saveEvent(DHXEv event, DHXStatus status, HttpSession session) {
		System.out.println("5. saveEvent羨悦");
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
			System.out.println("焼たたたたたた"+event.getId());
			schedule.setEvent_id(event.getId());
		}
		
		/*Integer i=null;
		i=schedule.getEvent_id();
		  System.out.println("iiiiiiiiiiiiiiii:"+i);
		  
		  
		 if(i!=null){
			 
			 System.out.println("i亜 null 焼諌凶:"+schedule.getEvent_id());
		 }
		  System.out.println("event.getId()zzzzzz:"+event.getId());*/

		if (status == DHXStatus.UPDATE) {
			System.out.println("update 珍闘継君->辞搾什 羨悦");
			calendarService.updateEvent(schedule);
			event.setId(schedule.getEvent_id());
		} else if (status == DHXStatus.INSERT) {
			System.out.println("insert 珍闘継君->辞搾什 羨悦");
			
			calendarService.insertEvent(schedule);
			System.out.println("拭君?:"+schedule.getEvent_id());
			
			event.setId(schedule.getEvent_id()-1);

		} else if (status == DHXStatus.DELETE) {
			calendarService.deleteEvent(event.getId());

		}

		return status;
	}

	protected void parseRequest(HttpServletRequest request) {
		System.out.println("6. parseRequest 羨悦");
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
		System.out.println("7. filterEvent 羨悦");
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
