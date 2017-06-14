package com.ant.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ant.user.dto.UserDTO;
import com.ant.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService service;

	@RequestMapping("/join")
	public String join(UserDTO userDTO) {
		service.insertUser(userDTO); 
		return "user/joinOk";
	}

	//우동이가 삭제하고 이부분을 이제 projectController에서 하도록 하겠습니다!
	/*
	@RequestMapping("/main")
	public String afterLogin() {
		return "project/home";
	}	
	
	@RequestMapping("/teamMain") //user/teamMAIN
	public String teamMain() {

		return "project/teamMain";///WEB-INF/views/project/teamMain.jsp
	}*/
	
	@RequestMapping("/chat")
	public String chat(){
		return "user/chat";
	}
}
