package com.ant.user.controller;

import java.io.Serializable;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ant.user.dto.UserDTO;
import com.ant.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController implements Serializable {
	@Autowired
	private UserService service;

	@RequestMapping("/join")
	public String join(UserDTO userDTO) {
		service.insertUser(userDTO);
		return "user/joinOk";
	}

	@RequestMapping("/main")
	public String afterLogin() {


		return "project/home";
	}
	
	@RequestMapping("/teamMain")
	public String teamMain() {

		return "project/teamMain";
	}
	
	@RequestMapping("/chat")
	public String chat(){
		return "user/chat";
	}
}
