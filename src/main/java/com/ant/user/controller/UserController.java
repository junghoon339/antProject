package com.ant.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ant.user.dto.UserDTO;
import com.ant.user.service.UserService;
import com.ant.util.Email;
import com.ant.util.EmailSender;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private EmailSender emailSender;

	@Autowired
	private Email email;
	
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
	public String timeUpdate() {
		return "timetable/timetable";
	}

	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheckn(String userId) {
		UserDTO userDTO = userService.selectUserById(userId);
		if (userDTO == null)
			return 0;

		return 1;
	}

	@RequestMapping(value = "/schoolCheck", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<String> schoolCheck(String school) {
		System.out.println(school);
		try {
			File file = new File("/chat/school.txt");
			if (!file.exists()) {
				file.createNewFile();
			}
			schoolList = FileUtils.readLines(file, "utf-8");

			return schoolList;
		} catch (IOException e) {
			e.printStackTrace();
		}

		return schoolList;
	}

	@RequestMapping("/forgotPassword")
	public String forgotPassword() {
		return "user/forgotPassword";
	}

	@RequestMapping("/sendEmail")
	public ModelAndView sendEmail(String emailAddr) throws Exception {
		// 임시비밀번호는 8자
		String pw=emailSender.temporaryPassword(8);
		
		ModelAndView mv = new ModelAndView("user/sendEmail");
		
		// id를 찾음 있나없나
		UserDTO dto = userService.selectUserById(emailAddr);
		if (dto == null) {
			mv.addObject("msg", "존재하지 않는 아이디입니다.");
			return mv;
		}

		email.setReceiver(emailAddr);
		email.setSubject("개미와 베짱이 비밀번호 찾기 메일입니다.");
		email.setContent("임시 비밀번호는 " + pw + " 입니다.");

		userService.updateTempPassword(dto.getUserNo(), pw);
		
		emailSender.SendEmail(email);
		
		return mv;
	}
}