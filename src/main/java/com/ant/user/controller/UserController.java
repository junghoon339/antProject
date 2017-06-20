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

	// �쵿�̰� �����ϰ� �̺κ��� ���� projectController���� �ϵ��� �ϰڽ��ϴ�!
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
		return "timetable/userTimetable"; 
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
		// �ӽú�й�ȣ�� 8��
		String pw=emailSender.temporaryPassword(8);
		
		ModelAndView mv = new ModelAndView("user/sendEmail");
		
		// id�� ã�� �ֳ�����
		UserDTO dto = userService.selectUserById(emailAddr);
		if (dto == null) {
			mv.addObject("msg", "�������� �ʴ� ���̵��Դϴ�.");
			return mv;
		}

		email.setReceiver(emailAddr);
		email.setSubject("���̿� ��¯�� ��й�ȣ ã�� �����Դϴ�.");
		email.setContent("�ӽ� ��й�ȣ�� " + pw + " �Դϴ�.");

		userService.updateTempPassword(dto.getUserNo(), pw);
		
		emailSender.SendEmail(email);
		
		return mv;
	}
}