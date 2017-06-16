package com.ant.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ant.chat.service.ChatService;
import com.ant.user.dto.UserDTO;
import com.ant.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private ChatService chatService;

	@RequestMapping("/join")
	public String join(UserDTO userDTO) {
		userService.insertUser(userDTO);
		return "user/joinOk";
	}

	@RequestMapping("/error")
	public String error() {
		return "user/error";
	}
	

	@RequestMapping("/logout")
	public String logout() {
		return "index";
	}


	// 우동이가 삭제하고 이부분을 이제 projectController에서 하도록 하겠습니다!
	/*
	 * @RequestMapping("/main") public String afterLogin() { return
	 * "project/home"; }
	 * 
	 * @RequestMapping("/teamMain") //user/teamMAIN public String teamMain() {
	 * 
	 * return "project/teamMain";///WEB-INF/views/project/teamMain.jsp }
	 */
	@RequestMapping("/timetable")
	public String timeUpdate(){
		return "timetable/timetable";
	}
}
