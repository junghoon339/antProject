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
	public String join(UserDTO userDTO){
		service.insertUser(userDTO);
		
		return "user/joinOk";
	}
	
	@RequestMapping("/main")
	public String afterLogin(){
		return "user/chat";
	}
}
