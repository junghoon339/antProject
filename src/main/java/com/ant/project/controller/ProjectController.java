package com.ant.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService ProjectService;
	
	/**
	 * 홈화면(로그인성공하면 띄워지는 화면)
	 */
	@RequestMapping("/home")
	public void home(){}
	
	
	/**
	 * 1.조별과제 삽입
	 * @param:projectDTO
	 */
	@RequestMapping("/insertProject")
	public String insertProject(ProjectDTO projectDTO){
		System.out.println("insertProject Controller호출됨.............");
		ProjectService.insertProject(projectDTO);
		return "";
	}
	
	/**
	 * 2.방금 삽입된 조별과제의 번호 검색
	 * @param:없음
	 */

	
	/**
	 * 3.조장 삽입
	 * @param: list(projectNso,loginId)
	 */
	
	/**
	 * 4.팀원ID를 갖고 userno 검색
	 * @param: list(팀방에 초대된 userId들)
	 */
	
	
	
}
