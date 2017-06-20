package com.ant.timetable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ant.timetable.dto.TimetableDTO;
import com.ant.timetable.service.TimetableService;

@Controller
@RequestMapping("/timetable")
public class TimetableController {
	@Autowired
	private TimetableService service;
	
	/*@RequestMapping("/projectTimetable")
	public String projectTimetable(){
		return "timetable/projectTimetable";
	}*/
	
	@RequestMapping("/main")
	public String main (){
		return "timetable/userTimetable";
	}
	
	@RequestMapping("/timetableInsert")
	@ResponseBody
	public int insert(TimetableDTO timetableDTO){
		System.out.println(timetableDTO.getTimetableClassInfo());
		System.out.println(timetableDTO.getTimetableLocation());
		System.out.println(timetableDTO.getUserNo());
		System.out.println(timetableDTO.getTimetableSubject());
		System.out.println(timetableDTO.getTimetableColor());
		return service.timetableInsert(timetableDTO);
	}
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public List<TimetableDTO> selectAll(int userNo){
		return service.selectAll(userNo);
	}

}
