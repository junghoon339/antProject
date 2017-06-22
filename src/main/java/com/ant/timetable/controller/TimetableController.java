package com.ant.timetable.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ant.timetable.dto.TimetableDTO;
import com.ant.timetable.service.TimetableService;
import com.ant.user.dto.UserDTO;

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
		return "timetable/userTimetable_ch";
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
	
	@RequestMapping("/changeColor")
	@ResponseBody
	public int changeColor(int timetableNo,String timetableColor){
		return service.changeColor(timetableNo, timetableColor);
	}
	
	@RequestMapping("/timetableDelete")
	@ResponseBody
	public int timetableDelete(int timetableNo){
		return service.timetableDelete(timetableNo);
	}

	
	
	////////////////////////////////////////////////////////팀
	@RequestMapping("/teamSelectAll")
	@ResponseBody
	public Map<Integer,List<TimetableDTO>> teamSelectAll(int projectNo){
		return service.teamSelectAll(projectNo);
	}
	
	@RequestMapping("/selectUserNos")
	@ResponseBody
	public List<UserDTO> selectUserNos(int projectNo){
		//System.out.println("사이즈다잉 : "+service.selectUserNos(projectNo).size());
		return service.selectUserNos(projectNo);
	}
	
	@RequestMapping("/teamMain")
	public String teamMain(){
		return "timetable/projectTimetable";
	}
}
