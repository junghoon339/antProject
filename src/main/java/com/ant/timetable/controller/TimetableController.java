package com.ant.timetable.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/timetable")
public class TimetableController {
	
	@RequestMapping("/projectTimetable")
	public String projectTimetable(){
		return "timetable/projectTimetable";
	}
	
	@RequestMapping("/main")
	public String main (){
		return "timetable/timetable";
	}

}
