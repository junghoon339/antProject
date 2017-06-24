package com.ant.calendar.controller;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ant.calendar.dto.ProjectCalendarDTO;
import com.ant.calendar.service.ProjectCalendarService;
import com.ant.calendar.service.UserCalendarService;
import com.ant.project.dto.ProjectDTO;
import com.ant.project.service.ProjectService;
import com.ant.user.dto.UserDTO;
import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXPlanner;
import com.dhtmlx.planner.DHXSecurity;
import com.dhtmlx.planner.DHXSkin;
import com.dhtmlx.planner.DHXStatus;

@Controller
@RequestMapping("/projectCalendar")
public class ProjectCalendarController implements Serializable {
	
	@Autowired
	private ProjectCalendarService calendarService;
	
	@Autowired
	private ProjectService projectService;

	public static String date_format = "MM/dd/yyyy HH:mm";
	public static String filter_format = "yyyy-MM-dd";
	public DHXSecurity security;
	private HashMap attributes;
	private Date from;
	private Date to;
	private Boolean dynFilter;

	
	@RequestMapping("/report")
	public ModelAndView report(HttpServletRequest req) throws Exception {

		System.out.println("projectCalendar 뿌려짐");
		String contextPath = req.getContextPath();
		HttpSession session = req.getSession();

		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		int userNo = userDTO.getUserNo();
		System.out.println("user_no : "+userNo);
		
		int projectNo = (int) session.getAttribute("projectNo");
		ProjectDTO projectDTO = projectService.selectProject(projectNo);
		int nono = projectDTO.getProjectNo();
		System.out.println("project_no : " +nono);
		/*int projectNo = projectDTO.getProjectNo();*/
		

		
		// calendar����
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
		planner.config.setDefaultDate("%Y년%M월 %j일");
		planner.config.setDayDate("%D");

		CsrfToken token = (CsrfToken) req.getAttribute(CsrfToken.class.getName());
		System.out.println("token:" + token);

		planner.data.dataprocessor
				.setURL(contextPath + "/projectCalendar/events?" + token.getParameterName() + "=" + token.getToken());
		planner.parse(calendarService.getEvent(projectNo));

		ModelAndView mv = new ModelAndView();
		mv.addObject("schedule", planner.render());
		mv.setViewName("project/report");
		// mv.addObject("currentProList",currentProList);
		// mv.addObject("completedProList",completedProList);
		
		List<UserDTO> projectUserList = projectService.selectProjectUsers(projectNo);
		
		
		
		
		mv.addObject("projectUserList",projectUserList);
		mv.addObject("projectDTO",projectDTO);

		
		return mv;
	}
	
	@RequestMapping("/projectCalendar")
	public ModelAndView home(HttpServletRequest req) throws Exception {
		
		System.out.println("projectCalendar 뿌려짐");
		String contextPath = req.getContextPath();
		HttpSession session = req.getSession();

		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		int userNo = userDTO.getUserNo();
		System.out.println("user_no : "+userNo);
		
		int projectNo = (int) session.getAttribute("projectNo");
		ProjectDTO projectDTO = projectService.selectProject(projectNo);
		int nono = projectDTO.getProjectNo();
		System.out.println("project_no : " +nono);
		/*int projectNo = projectDTO.getProjectNo();*/
		

		
		// calendar����
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
		planner.config.setDefaultDate("%Y년%M월 %j일");
		planner.config.setDayDate("%D");

		CsrfToken token = (CsrfToken) req.getAttribute(CsrfToken.class.getName());
		System.out.println("token:" + token);

		planner.data.dataprocessor
				.setURL(contextPath + "/projectCalendar/events?" + token.getParameterName() + "=" + token.getToken());
		planner.parse(calendarService.getEvent(projectNo));

		ModelAndView mv = new ModelAndView();
		mv.addObject("schedule", planner.render());
		mv.setViewName("calendar/scheduler");
		// mv.addObject("currentProList",currentProList);
		// mv.addObject("completedProList",completedProList);
		return mv;
	}
	
	
	@RequestMapping("/events")
	@ResponseBody
	public String events(HttpServletRequest request) throws Exception {
		System.out.println("1. event����");
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
			System.out.println("id: " + value);
			if (value != null)
				actions = (new StringBuilder()).append(actions).append(saveOne(request, value, "")).toString();
		}
		return (new StringBuilder()).append("<?xml version=\"1.0\"?><data>").append(actions).append("</data>")
				.toString();
	}

	private String saveOne(HttpServletRequest request, String id, String prefix) {
		System.out.println("2. saveOne����");
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

		DHXEv ev = createEvent(id, status);
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
		System.out.println("3. toLowerCase����");
		String first = value.substring(0, 1);
		String last = value.substring(1);
		return (new StringBuilder()).append(first.toLowerCase()).append(last).toString();
	}

	public DHXEv createEvent(String id, DHXStatus status) {
		System.out.println("4. createEvent����");
		return new DHXEvent();
	}

	public DHXStatus saveEvent(DHXEv event, DHXStatus status, HttpSession session) {
		System.out.println("5. saveEvent����");
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

		ProjectCalendarDTO schedule = new ProjectCalendarDTO();

		schedule.setEvent_name(event.getText());

		UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
		schedule.setUser_no(userDTO.getUserNo());
		System.out.println("user_no " + userDTO.getUserNo());
		
		
		int projectNo = (int) session.getAttribute("projectNo");
		ProjectDTO projectDTO = projectService.selectProject(projectNo);
		int nono = projectDTO.getProjectNo();		
		schedule.setProject_no(nono);
		System.out.println("nono=??? : "+nono);
		
		schedule.setStart_date(start_date);
		schedule.setEnd_date(end_date);
		
		if(event.getId()!=null){
			System.out.println("�̺�Ʈ ���̵� : "+event.getId());
			schedule.setEvent_id(event.getId());			
		}
		 

		if (status == DHXStatus.UPDATE) {
			System.out.println("projectCalendar update ��Ʈ�ѷ�->���� ����");
			calendarService.updateEvent(schedule);
			event.setId(schedule.getEvent_id());

		} else if (status == DHXStatus.INSERT) {
			System.out.println("projectCalendar insert ��Ʈ�ѷ�->���� ����");
			calendarService.insertEvent(schedule);
			event.setId(schedule.getEvent_id()-1);

		} else if (status == DHXStatus.DELETE) {
			calendarService.deleteEvent(event.getId());

		}

		return status;
	}

	protected void parseRequest(HttpServletRequest request) {
		System.out.println("6. parseRequest ����");
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
		System.out.println("7. filterEvent ����");
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
