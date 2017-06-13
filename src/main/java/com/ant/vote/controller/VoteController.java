package com.ant.vote.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ant.vote.dto.VoteDTO;
import com.ant.vote.dto.VoteDetailDTO;
import com.ant.vote.dto.VoteSelectorDTO;
import com.ant.vote.service.VoteService;

@Controller
@RequestMapping("/vote")
public class VoteController {
	
	@Autowired
	VoteService voteService;

	@RequestMapping("/")
	public String mainForm(Model model){
		
		System.out.println("voteForm...");
		
		//진행중인 투표목록 0, 종료된 투표목록 1으로 각각 받아옵니다.
		List<VoteDTO> doingList = voteService.selectVoteList(0);
		List<VoteDTO> doneList = voteService.selectVoteList(1);
		
		System.out.println("===========================");
		System.out.println("두잉 : "+doingList.size());
		System.out.println("던 : "+doneList.size());
		System.out.println("===========================");
		
		model.addAttribute("doingList", doingList);
		model.addAttribute("doneList", doneList);
		return "vote/voteForm";
	}
	
	@RequestMapping("/CreateForm")
	public String CreateForm(){
		System.out.println("voteCreateForm...");
		return "vote/voteCreateForm";
	}
	
	@RequestMapping("/Create")
	public String Create(String projectUserNo, String voteTitle, String voteEndDate, String[] chk){
		System.out.println("voteCreate...");
		System.out.println("===========================");
		System.out.println("projectUserNo ->"+projectUserNo);
		System.out.println("voteTitle ->"+voteTitle);
		System.out.println("voteEndDate ->"+voteEndDate);
		System.out.println("options ->"+chk.length);
		System.out.println("===========================");
		
		//투표 생성시 Date객체 생성.. --> 현재시간
		SimpleDateFormat sd = new SimpleDateFormat("MM/dd/yyyy", Locale.KOREA);
		String nowDate = sd.format( new Date() );
		System.out.println("->> 현재시간 : "+nowDate);
		
		//DTO생성..
		int result = 0;
		System.out.println("[ 컨트롤러 ] 접근 전..");
		int createVoteNo =0;

		VoteDTO insertVoteDTO = new VoteDTO(0, 1, 1, voteTitle, nowDate.toString(), voteEndDate.toString(), 0);
		result = voteService.insertVote(insertVoteDTO);
		createVoteNo = voteService.voteMaxNo();
		System.out.println("결과 : "+result);
		for(String column :chk){
			VoteDetailDTO insertVoteDetailDTO = new VoteDetailDTO(0, createVoteNo, column);
			result = voteService.insertVoteDetail(insertVoteDetailDTO);
			System.out.println("결과 : "+result);
		}
		
		System.out.println("컨트롤러 처리 끝.. 경로이동 -> vote/voteForm");
		return "redirect:/vote/";
	}
	
	@RequestMapping("/Detail")
	public String DetailForm(Model model, int voteNo){
		System.out.println("voteNo -----> "+voteNo);
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
		model.addAttribute("voteDetail", detailList);
		
		return "vote/voteDetailForm";
	}
	
	@RequestMapping("/Detail/Initialized")
	@ResponseBody
	public Map<String, Integer> DetailInitialized(int userNo, int voteNo){
		int participated = 0;
		int voteCreater = 0;
		int choiceCheck = 0;
		Map<String, Integer> map = new HashMap<>();
		
		System.out.println("핸들링 userNo : "+userNo+", voteNo : "+voteNo);
		System.out.println("디테일이니셜라이즈드, 컨트롤러 -> 서비스 접근 userNo : "+userNo+", voteNo : "+voteNo);
		VoteDTO vote = voteService.selectVoteListByVoteNo(voteNo);
		VoteDetailDTO detail = voteService.selectVoteDetail(userNo, voteNo);
		
		if(!(detail==null)){
			participated = 1;
			choiceCheck = detail.getSelectors().get(0).getVoteDetailNo();
		}
		
		if(vote.getUserNo()==userNo){
			voteCreater = 1;
		}

		System.out.println("유저가 투표에 참요하였는가? --->"+participated);
		System.out.println("유저가 글쓴이인가 ? --->"+voteCreater);
		map.put("choice", choiceCheck);
		map.put("participated", participated);
		map.put("voteCreater", voteCreater);
		return map;
	}
	
	@RequestMapping("/Detail/Handling")
	@ResponseBody
	public int DetailHandling(int userNo, int column){
		int participated = 0; 
		System.out.println("핸들링 userNo : "+userNo+", column : "+column);
		
		VoteSelectorDTO voteSelectorDTO = new VoteSelectorDTO(0, userNo, column);
		participated = voteService.voteSelectorInsert(voteSelectorDTO);
		
		return participated;
	}
}
