package com.ant.project.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ant.project.dto.ProjectDTO;
import com.ant.project.dto.ProjectUserDTO;
import com.ant.project.service.ProjectService;
import com.ant.user.dto.UserDTO;
import com.ant.user.service.UserService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * Ȩȭ��(�α��μ����ϸ� ������� ȭ��)
	 */
	@RequestMapping("/home")
	public void home(){}
	
	
	/**
	 * �������� ����
	 * @param:projectDTO
	 */
	@RequestMapping("/insertProject")
	public String insertProject(ProjectDTO projectDTO, String [] invitedUser, HttpServletRequest request){
		System.out.println("insertProject Controllerȣ���.............");
		
		//1.���������� ����
		int resultInsPro =  projectService.insertProject(projectDTO);
		
		//2.��� ���Ե� ���������� ��ȣ �˻�
		int projectNo = projectService.selectProjectNo();
		
		//3.���� ����
		//����ID(���ݷα��ε�ID)�� ���� user_no�˻�
		UserDTO userDTO = userService.selectUserById("tina818@naver.com");	//���߿��ٲܰ�!!�ڡڡڡڡڡڡڡڡ�
		int userNo=userDTO.getUserNo();
		
		//������ ���������濡 ����
		ProjectUserDTO projectUserDTO = new ProjectUserDTO(projectNo, userNo);
		System.out.println("������Ʈ��ȣ"+projectUserDTO.getProjectNo()+" / ����userNo : "+projectUserDTO.getUserNo());
		int resultInsLeader = projectService.insertProjectLeader(projectUserDTO);
		
		//4.�ʴ�� �������� ����������
		//�ʴ�� ������ id�� userNo�˻�
		System.out.println("\n form���� �Ѿ���� invitedUser�迭");
		for(String user : invitedUser){
			System.out.println("�ʴ�� ���� id : " + user);
		}
		//invitedUser�迭�� list�� ��ȯ
		ArrayList<String> invitedUserIdList = new ArrayList<>();
		Collections.addAll(invitedUserIdList, invitedUser);
		
		System.out.println("\n invitedUser�迭�� list�� ��ȯ��......");
		for(String userId : invitedUserIdList){
			System.out.println("�ʴ�� ���� id : " + userId);
		}
		
		
		List<Integer> invitedUserNolist=projectService.SelectUserNoById(invitedUserIdList);
		System.out.println("\n �ʴ�� ������ ��ȣ......!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		for(int userNo2 : invitedUserNolist){
			System.out.println("�ʴ�� ���� id : " + userNo2);
		}
		
		return "";
	}
	
	

	
	/**
	 * 4.����ID�� ���� userno �˻�
	 * @param: list(���濡 �ʴ�� userId��)
	 */
	
	
	
}
