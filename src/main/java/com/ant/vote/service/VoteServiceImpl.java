package com.ant.vote.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.vote.dao.VoteDAO;
import com.ant.vote.dto.VoteDTO;
import com.ant.vote.dto.VoteDetailDTO;

@Service
public class VoteServiceImpl implements VoteService {
	
	@Autowired
	private VoteDAO voteDAO;

	@Override
	public List<VoteDTO> selectVoteList(int voteState) {
		return voteDAO.selectVoteList(voteState);
	}
	
	@Override
	public List<VoteDTO> selectVoteListByVoteNo(int voteNo) {
		return voteDAO.selectVoteListByVoteNo(voteNo);
	}

	@Override
	public int insertVote(VoteDTO voteDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateVote(int voteNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteVote(int voteNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertVoteDetail(VoteDetailDTO voteDetailDTO) {
		// TODO Auto-generated method stub
		return 0;
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
	public int selectVoteUserCount(int voteNo) {
		return voteDAO.selectVoteUserCount(voteNo);
	}

	@Override
	public int selectVoteState(int userNo) {
		return voteDAO.selectVoteState(userNo);
	}

}
