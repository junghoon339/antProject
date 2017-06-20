package com.ant.timetable.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/timetable")
public class TimetableController {
	
	@RequestMapping("/main")
	public String main (){
		return "timetable/timetable";
	}

}
