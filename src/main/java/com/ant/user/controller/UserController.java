package com.ant.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	private List<String> schoolList;

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
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheckn(String userId){
		System.out.println(userId);
		UserDTO userDTO = userService.selectUserById(userId);
		System.out.println(userDTO);
		if (userDTO == null)
			return 0;
		
		return 1;
	}
	
	@RequestMapping(value="/schoolCheck",  produces = "application/json; charset=utf8")
	@ResponseBody
	public List<String> schoolCheck(String school){
		System.out.println(school);
		try {
			File file = new File("/chat/school.txt");
			if (!file.exists()){
				file.createNewFile();
			}
			schoolList = FileUtils.readLines(file,"utf-8");
			
			return schoolList;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return schoolList;
	}
}
