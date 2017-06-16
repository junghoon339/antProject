package com.ant.vote.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.vote.dao.VoteDAO;
import com.ant.vote.dto.VoteDTO;
import com.ant.vote.dto.VoteDetailDTO;
import com.ant.vote.dto.VoteSelectorDTO;

@Service
public class VoteServiceImpl implements VoteService {
	
	@Autowired
	private VoteDAO voteDAO;

	@Override
	public List<VoteDTO> selectVoteList(int voteState) {
		return voteDAO.selectVoteList(voteState);
	}

	@Override
	public int voteDateUpdate() {
		return voteDAO.voteDateUpdate();
	}

	@Override
	public VoteDTO selectVoteListByVoteNo(int voteNo) {
		return voteDAO.selectVoteListByVoteNo(voteNo);
	}

	@Override
	public int insertVote(VoteDTO voteDTO) {
		System.out.println("[ 서비스 ] 접근 전..");
		return voteDAO.insertVote(voteDTO);
	}

	@Override
	public int updateVote(int userNo, int voteNo) {
		
		return voteDAO.updateVote(userNo, voteNo);
	}

	@Override
	public int deleteVote(int voteNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertVoteDetail(VoteDetailDTO voteDetailDTO) {
		System.out.println("[ 서비스 ] 접근 전..");
		return voteDAO.insertVoteDetail(voteDetailDTO);
	}

	@Override
	public int updateVoteDetail(int voteDetailNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteVoteDetail(int voteDetailNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<VoteDetailDTO> selectVoteDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectVoteDetailCall(int voteNo) {
		return voteDAO.selectVoteDetailCall(voteNo);
	}

	@Override
	public List<VoteDetailDTO> selectVoteDetailCall(int voteNo,int voteDetailColumn) {
		return voteDAO.selectVoteDetailCall(voteNo, voteDetailColumn);
	}

	@Override
	public VoteDetailDTO selectVoteDetail(int userNo, int voteNo) {
		System.out.println("디테일이니셜라이즈드, 서비스 -> 다오 접근 userNo : "+userNo+", voteNo : "+voteNo);
		return voteDAO.selectVoteDetail(userNo, voteNo);
	}
	
	@Override
	public int voteMaxNo(){
		return voteDAO.voteMaxNo();
	}

	@Override
	public int voteSelectorInsert(VoteSelectorDTO voteSelectorDTO) {
		return voteDAO.voteSelectorInsert(voteSelectorDTO);
	}

	@Override
	public int voteSelectorUpdate(VoteSelectorDTO voteSelectorDTO) {
		return voteDAO.voteSelectorUpdate(voteSelectorDTO);
	}

	@Override
	public int voteSelectorDelete(int voteSelectNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
