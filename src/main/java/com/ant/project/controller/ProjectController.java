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
	 * Ȩȭ��(�α��μ����ϸ� ������� ȭ��)
	 */
	@RequestMapping("/home")
	public void home(){}
	
	
	/**
	 * 1.�������� ����
	 * @param:projectDTO
	 */
	@RequestMapping("/insertProject")
	public String insertProject(ProjectDTO projectDTO){
		System.out.println("insertProject Controllerȣ���.............");
		ProjectService.insertProject(projectDTO);
		return "";
	}
	
	/**
	 * 2.��� ���Ե� ���������� ��ȣ �˻�
	 * @param:����
	 */

	
	/**
	 * 3.���� ����
	 * @param: list(projectNso,loginId)
	 */
	
	/**
	 * 4.����ID�� ���� userno �˻�
	 * @param: list(���濡 �ʴ�� userId��)
	 */
	
	
	
}
