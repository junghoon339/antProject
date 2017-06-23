package com.ant.vote.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ant.message.dto.MessageDTO;
import com.ant.message.service.MessageService;
import com.ant.project.dto.ProjectDTO;
import com.ant.project.service.ProjectService;
import com.ant.survey.dto.SurveyUserDTO;
import com.ant.user.dto.UserDTO;
import com.ant.vote.dto.VoteDTO;
import com.ant.vote.dto.VoteDetailDTO;
import com.ant.vote.dto.VoteSelectorDTO;
import com.ant.vote.service.VoteService;

@Controller
@RequestMapping("/vote")
public class VoteController {

	@Autowired
	VoteService voteService;
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	MessageService messageService;
	
	@RequestMapping("/")
	public String mainForm(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		int userNo = user.getUserNo();
		int projectNo = (int) session.getAttribute("projectNo");
		
		voteService.voteDateUpdate();
		
		// 진행중인 투표목록 0, 종료된 투표목록 1으로 각각 받아옵니다.
		List<VoteDTO> doingList = voteService.selectVoteList(projectNo, 0);
		List<VoteDTO> doneList = voteService.selectVoteList(projectNo, 1);

		
		for(VoteDTO vote : doingList){
			
			boolean state = false;
			if(voteService.selectVoteDetail(userNo, vote.getVoteNo())==null) state = false;
			else state = true;
			
			int countAll = voteService.selectVoteDetailCall(vote.getVoteNo());
			vote.setUserCount(countAll);
			vote.setState(state);
		}
		for(VoteDTO vote : doneList){
			
			boolean state = false;
			if(voteService.selectVoteDetail(userNo, vote.getVoteNo())==null) state = false;
			else state = true;
			
			int countAll = voteService.selectVoteDetailCall(vote.getVoteNo());
			vote.setUserCount(countAll);
			vote.setState(state);
		}
		
		model.addAttribute("deleteResult", request.getAttribute("deleteResult"));
		model.addAttribute("doingList", doingList);
		model.addAttribute("doneList", doneList);
		return "vote/voteForm_ch";
	}
	
	@RequestMapping("/CreateForm")
	public String CreateForm() {
		return "vote/voteCreateForm_ch";
	}

	@RequestMapping("/Create")
	public String Create(HttpSession session, String voteTitle, String voteEndDate, String[] chk) {

		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		int userNo = user.getUserNo();
		int projectNo = (int) session.getAttribute("projectNo");
		
		SimpleDateFormat sd = new SimpleDateFormat("MM/dd/yyyy", Locale.KOREA);
		String nowDate = sd.format(new Date());

		int result = 0;
		int createVoteNo = 0;
		VoteDTO insertVoteDTO;
		
		if(voteEndDate==null){
			insertVoteDTO = new VoteDTO(0, userNo, projectNo, voteTitle, nowDate.toString(), null, 0);
		}else{
			insertVoteDTO = new VoteDTO(0, userNo, projectNo, voteTitle, nowDate.toString(), voteEndDate.toString(), 0);
		}
		result = voteService.insertVote(insertVoteDTO);
		createVoteNo = voteService.voteMaxNo();
		for (String column : chk) {
			if(column.trim().equals("")){
				
			} else {
				VoteDetailDTO insertVoteDetailDTO = new VoteDetailDTO(0, createVoteNo, column);
				result = voteService.insertVoteDetail(insertVoteDetailDTO);
			}
		}
		
		List<UserDTO> users = projectService.selectProjectUsers(projectNo);
		ProjectDTO pro = projectService.selectProject(projectNo);
		
		//투표등록시 투표등록 알림을 전송해주는 쪽
		for(UserDTO u : users){
			MessageDTO messageDTO = new MessageDTO();
			messageDTO.setUserNoMessageSender(0);
			messageDTO.setMessageReceiver(u.getUserId());
			messageDTO.setMessageContent("[알림] 조별과제 : "+pro.getProjectName()+"에서 새로운 '투표'가 등록되었습니다! 확인해주세요.  ");
			messageService.messageInsert(messageDTO);
		}

		return "redirect:/vote/";
	}

	@RequestMapping("/Detail")
	public String DetailForm(Model model, int voteNo, int userCount) {
		System.out.println("voteNo -----> " + voteNo);
		System.out.println("userCount--->"+userCount);
		VoteDTO dto = voteService.selectVoteListByVoteNo(voteNo);
		List<VoteDetailDTO> detailList = new ArrayList<VoteDetailDTO>();

		System.out.println("====================");
		System.out.println(dto);
		System.out.println(dto.getDetails());
		System.out.println(dto.getDetails().size());
		System.out.println("====================");

		for (VoteDetailDTO detail : dto.getDetails()) {
			detailList.add(detail);
		}

		model.addAttribute("voteNo", voteNo);
		model.addAttribute("voteTitle", dto.getVoteTitle());
		model.addAttribute("voteState", dto.getVoteState());
		model.addAttribute("voteEndDate", dto.getVoteEndDate());
		model.addAttribute("voteWriter", dto.getUserNo());
		model.addAttribute("voteDetail", detailList);
		model.addAttribute("userCount", userCount);
		return "vote/voteDetailForm_ch";
	}

	@RequestMapping("/Detail/Initialized")
	@ResponseBody
	public Map<String, Object> DetailInitialized(HttpSession session, int voteNo, int[] columns) {
		int participated = 0;
		int voteCreater = 0;
		int choiceCheck = 0;
		Map<String, Object> map = new HashMap<>();
		Map<Integer, Integer> gauge = new TreeMap<>();
		int count = 0;
		int countAll = voteService.selectVoteDetailCall(voteNo);

		UserDTO user =	(UserDTO) session.getAttribute("userDTO"); 
		int userNo = user.getUserNo();
		
		VoteDTO vote = voteService.selectVoteListByVoteNo(voteNo);
		VoteDetailDTO detail = voteService.selectVoteDetail(userNo, voteNo);
		List<VoteDetailDTO> detail2;

		// 투표를 참여했었는지..?
		if (!(detail == null)) {
			participated = 1;
			choiceCheck = detail.getSelectors().get(0).getVoteDetailNo();
		}

		// 해당 항목에 몇명이 참여했었는지..?
		for (int i = 0; i < columns.length; i++) {
			detail2 = voteService.selectVoteDetailCall(voteNo, columns[i]);
			if (detail2 == null) {
				count = 0;
			} else {
				count = 0;
				for(VoteDetailDTO d : detail2){
					for(VoteSelectorDTO s : d.getSelectors()){
						count = d.getSelectors().size();
					}
				}
			}

			if(countAll==0){}
			else{
				gauge.put(columns[i], (count*100) / countAll);
			}
		}

		// 글쓴이인지..?
		if (vote.getUserNo() == userNo) {
			voteCreater = 1;
		}
		
		map.put("userCount", voteService.selectVoteDetailCall(voteNo));
		map.put("choice", choiceCheck);
		map.put("participated", participated);
		map.put("voteCreater", voteCreater);
		map.put("gauge", gauge);

		return map;
	}

	@RequestMapping("/Detail/Handling")
	@ResponseBody
	public int DetailHandling(HttpSession session, int voteNo, int column) {
		
		int participated = 0;
		int getSelectorNovote = 0;
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		int userNo = user.getUserNo();
		

		VoteDetailDTO voteDetailDTO = voteService.selectVoteDetail(userNo, voteNo);
		if (voteDetailDTO != null) {
			getSelectorNovote = voteDetailDTO.getSelectors().get(0).getVoteSelectorNo();
		}
		VoteSelectorDTO voteSelectorDTO;

		if (voteDetailDTO != null) {
			voteSelectorDTO = new VoteSelectorDTO(getSelectorNovote, userNo, column);
			participated = voteService.voteSelectorUpdate(voteSelectorDTO);
		} else {
			voteSelectorDTO = new VoteSelectorDTO(0, userNo, column);
			participated = voteService.voteSelectorInsert(voteSelectorDTO);
		}
		
		return participated;
	}
	
	@RequestMapping("/Detail/endVote")
	@ResponseBody
	public int DetailHandling(HttpSession session, int voteNo) {
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		int userNo = user.getUserNo();
		int projectNo = (int) session.getAttribute("projectNo");
		
		List<UserDTO> users = projectService.selectProjectUsers(projectNo);
		ProjectDTO pro = projectService.selectProject(projectNo);
		VoteDTO vote = voteService.selectVote(voteNo);
		
		//투표마감시 투표등록마감 알림을 전송해주는 쪽
		for(UserDTO u : users){
			MessageDTO messageDTO = new MessageDTO();
			messageDTO.setUserNoMessageSender(0);
			messageDTO.setMessageReceiver(u.getUserId());
			messageDTO.setMessageContent("[알림] 조별과제 : "+pro.getProjectName()+"에 "+vote.getVoteTitle()+"'투표'가 투표마감되었습니다! 확인해주세요.  ");
			messageService.messageInsert(messageDTO);
		}
		
		System.out.println("userNo-->"+userNo+", voteNo-->"+voteNo);
		return voteService.updateVote(userNo, voteNo);
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, int voteNo) {
		int result = voteService.deleteVote(voteNo);

		request.setAttribute("deleteResult", result);
		return "forward:/vote/";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(HttpSession session, Model model, int voteNo) {
		VoteDTO vote = voteService.selectVoteListByVoteNo(voteNo);
		List<VoteDetailDTO> voteDetailList = new ArrayList<>();
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		int userNo = user.getUserNo();
		
		for(VoteDetailDTO voteDetail : vote.getDetails()){
			voteDetailList.add(voteDetail);
		}
		
		System.out.println(vote.getVoteTitle());
		model.addAttribute("vote", vote);
		model.addAttribute("voteDetailList", voteDetailList);
		return "vote/voteUpdateForm_ch";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request, HttpSession session, int projectNo , int voteNo, String[] chk) {
		
		UserDTO user = (UserDTO) session.getAttribute("userDTO");
		int userNo = user.getUserNo();
		
		for(String s : chk){
			if(!s.trim().equals("")){
				voteService.insertVoteDetail(new VoteDetailDTO(0, voteNo, s));
			}
		}
		
//		request.setAttribute("voteNo", voteNo);
//		request.setAttribute("userCount", voteService.selectVoteDetailCall(voteNo));
		return "redirect:/vote/";
	}
}
