package com.ant.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import sun.print.resources.serviceui;

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
	public boolean idCheckn(String userId) {
		UserDTO userDTO = userService.selectUserById(userId);
		if (userDTO == null)
			return true;
		
		return false;
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
	
	@RequestMapping("/update")
	public String update() {
		
		return "user/update";
	}

	@RequestMapping("/updateInfo")
	public String updateInfo(HttpSession session, UserDTO userDTO) {
		userService.updateUser(userDTO);
		
		userDTO = userService.selectUserById(userDTO.getUserId());
		
		session.setAttribute("userDTO", userDTO);
		
		return "redirect:/user/update";
	}

	@RequestMapping("/sendEmail")
	public ModelAndView sendEmail(String emailAddr) throws Exception {
		// �ӽú�й�ȣ�� 8��
		String pw=emailSender.temporaryPassword(8);
		
		ModelAndView mv = new ModelAndView("user/sendEmail");
		
		UserDTO dto = userService.selectUserById(emailAddr);
		if (dto == null) {
			mv.addObject("msg", "존재하지 않는 이메일 주소입니다.");
			return mv;
		}

		email.setReceiver(emailAddr);
		email.setSubject("[Ants and Grasshopper] 개미와 베짱이 계정 비밀번호가 재설정 되었습니다.");
		email.setContent("임시 비밀번호는 [ " + pw + " ] 입니다. <br>마이 페이지에서 비밀번호를 변경해주세요.");

		userService.updateTempPassword(dto.getUserNo(), pw);
		
		emailSender.SendEmail(email);
		
		return mv;
	}
}