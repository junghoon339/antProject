package com.ant.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ant.admin.dto.NoticeDTO;
import com.ant.admin.service.AdminService;
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
	private AdminService adminService;

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
	
	@RequestMapping("/adminNotice")
	public ModelAndView NoticeMain(String pageNumber, String searchText){
		if(pageNumber==null){
			pageNumber = "1";
		}
		
		int curPage = Integer.parseInt(pageNumber);
		int rowCount = 7;
		int startRow = (curPage-1)*rowCount+1;
		int endRow = curPage*rowCount;
		List<NoticeDTO> list = null;
		int totalRow = 0;
		if(searchText==null){
			list = adminService.noticeSelectAll(startRow, endRow);
			totalRow = adminService.noticeTotalCount();
		}else{
			list = adminService.noticeSelectBySearch(startRow, endRow, searchText);
			totalRow = adminService.noticeTotalCountBySearch(searchText); 
		}
		int pageSu = 5;
		int startPage = ((curPage-1)/pageSu)*pageSu+1;
		int endPage = startPage+pageSu-1;
		
		boolean flag = false;
		int lastPageNum = totalRow%rowCount==0 ? totalRow/rowCount : totalRow/rowCount+1;
		if(lastPageNum<=endPage){
			endPage=lastPageNum;
			flag=true;
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("totalRow",totalRow);
		mv.addObject("startPage",startPage);
		mv.addObject("endPage",endPage);
		mv.addObject("flag",flag);
		mv.addObject("pageSu",pageSu);
		mv.addObject("curPage",curPage);
		mv.addObject("rowCount",rowCount);
		mv.addObject("searchText",searchText);
		
		mv.setViewName("admin/adminNotice");
		return mv;
	}
	

	@RequestMapping("/noticeInsert")
	public String noticeInsert(NoticeDTO noticeDTO) throws Exception{
		System.out.println("noticeDTO.getNoticeContent"+noticeDTO.getNoticeContent());
		adminService.insertNotice(noticeDTO);
		return "redirect:/user/adminNotice";
	}
	
	@RequestMapping("/noticeDetail/{noticeNo}")
	public ModelAndView noticeDetail(@PathVariable int noticeNo){
		ModelAndView mv = new ModelAndView();
		NoticeDTO dto = adminService.selectByNoticeNum(noticeNo);
		mv.addObject("noticeDTO", dto);
		mv.setViewName("admin/noticeDetailNew");
		return mv;
	}
	
	@RequestMapping("/delete/{noticeNo}")
	public String noticeDelete(@PathVariable int noticaeNo) throws Exception{
		adminService.deleteNotice(noticaeNo);
		return "redirect:/user/adminNotice";
	}
	
	@RequestMapping("/noticeUpdate")
	public String noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		System.out.println("여기오긴하냐");
		System.out.println("update = "+noticeDTO.getNoticeNo());
		int result = adminService.updateNotice(noticeDTO);
		System.out.println("result = "+result);
		return "redirect:/user/adminNotice";
	}
}