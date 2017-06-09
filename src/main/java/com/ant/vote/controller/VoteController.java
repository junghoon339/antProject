package com.ant.vote.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ant.vote.dto.VoteDTO;
import com.ant.vote.service.VoteService;

@Controller
@RequestMapping("/vote")
public class VoteController {
	
	@Autowired
	VoteService voteService;

	@RequestMapping("/")
	public String mainForm(Model model){
		
		System.out.println("voteForm접근..");
		
		//진행중인 투표목록 0, 종료된 투표목록 1으로 각각 받아옵니다.
		List<VoteDTO> doingList = voteService.selectVoteList(0);
		List<VoteDTO> doneList = voteService.selectVoteList(1);
		
		model.addAttribute("doingList", doingList);
		model.addAttribute("doneList", doneList);
		
		return "vote/voteForm";
	}
	
	@RequestMapping("/Create")
	public String CreateForm(){
		return "";
	}
	
	@RequestMapping("/Detail")
	public String DetailForm(){
		return "";
	}
}
