package com.ant.vote.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String mainForm(Model model, int userNo) {

		voteService.voteDateUpdate();
		
		// 진행중인 투표목록 0, 종료된 투표목록 1으로 각각 받아옵니다.
		List<VoteDTO> doingList = voteService.selectVoteList(0);
		List<VoteDTO> doneList = voteService.selectVoteList(1);

		
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
		
		model.addAttribute("doingList", doingList);
		model.addAttribute("doneList", doneList);
		return "vote/voteForm";
	}
	
	@RequestMapping("/CreateForm")
	public String CreateForm() {
		return "vote/voteCreateForm";
	}

	@RequestMapping("/Create")
	public String Create(String projectUserNo, String voteTitle, String voteEndDate, String[] chk) {

		// 투표 생성시 Date객체 생성.. --> 현재시간
		SimpleDateFormat sd = new SimpleDateFormat("MM/dd/yyyy", Locale.KOREA);
		String nowDate = sd.format(new Date());

		// DTO생성..
		int result = 0;
		int createVoteNo = 0;

		VoteDTO insertVoteDTO;
		
		if(voteEndDate==null){
			insertVoteDTO = new VoteDTO(0, 1, 1, voteTitle, nowDate.toString(), null, 0);
		}else{
			insertVoteDTO = new VoteDTO(0, 1, 1, voteTitle, nowDate.toString(), voteEndDate.toString(), 0);
		}
		result = voteService.insertVote(insertVoteDTO);
		createVoteNo = voteService.voteMaxNo();
		for (String column : chk) {
			VoteDetailDTO insertVoteDetailDTO = new VoteDetailDTO(0, createVoteNo, column);
			result = voteService.insertVoteDetail(insertVoteDetailDTO);
		}

		return "redirect:/vote/?userNo=1";
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
		model.addAttribute("voteDetail", detailList);
		model.addAttribute("userCount", userCount);
		return "vote/voteDetailForm";
	}

	@RequestMapping("/Detail/Initialized")
	@ResponseBody
	public Map<String, Object> DetailInitialized(int userNo, int voteNo, int[] columns) {
		int participated = 0;
		int voteCreater = 0;
		int choiceCheck = 0;
		Map<String, Object> map = new HashMap<>();
		Map<Integer, Integer> gauge = new TreeMap<>();
		int count = 0;
		int countAll = voteService.selectVoteDetailCall(voteNo);

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

		map.put("choice", choiceCheck);
		map.put("participated", participated);
		map.put("voteCreater", voteCreater);
		map.put("gauge", gauge);

		return map;
	}

	@RequestMapping("/Detail/Handling")
	@ResponseBody
	public int DetailHandling(int userNo, int voteNo, int column) {
		int participated = 0;
		int getSelectorNovote = 0;

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
	public int DetailHandling(int userNo, int voteNo) {
		System.out.println("userNo-->"+userNo+", voteNo-->"+voteNo);
		return voteService.updateVote(userNo, voteNo);
	}
}
