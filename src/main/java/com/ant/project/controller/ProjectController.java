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
	
	@RequestMapping("/insertProject")
	public String insertProject(ProjectDTO projectDTO){
		ProjectService.insertProject(projectDTO);
		return "home";
	}
	
	
	
	
	
	
	
}
