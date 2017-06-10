package com.ant.vote.controller;

import java.util.ArrayList;
import java.util.List;

import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ant.vote.dto.VoteDTO;
import com.ant.vote.dto.VoteDetailDTO;
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
		int userCount = voteService.selectVoteUserCount(1);
		int state = voteService.selectVoteState(1);
		
		System.out.println("두잉 : "+doingList.size());
		System.out.println("던 : "+doneList.size());
		System.out.println("참여수 : "+userCount);
		System.out.println("미참여0 참여1 : "+state);
		
		model.addAttribute("doingList", doingList);
		model.addAttribute("doneList", doneList);
		model.addAttribute("userCount", userCount);
		model.addAttribute("state", state);
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
		return "vote/voteForm";
	}
	
	@RequestMapping("/Detail")
	public String DetailForm(Model model, int voteNo){
		
		List<VoteDTO> list = voteService.selectVoteListByVoteNo(voteNo);
		List<VoteDetailDTO> detailList = new ArrayList<VoteDetailDTO>();
		
		for(VoteDTO dto : list){
			for(VoteDetailDTO detail : dto.getDetails()){
				detailList.add(detail);
			}
		}
		model.addAttribute("voteTitle", list.get(0).getVoteTitle());
		model.addAttribute("voteList", list);
		model.addAttribute("voteDetail", detailList);
		
		return "vote/voteDetailForm";
	}
}
