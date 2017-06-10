package com.ant.vote.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.vote.dto.VoteDTO;
import com.ant.vote.dto.VoteDetailDTO;

@Repository
public class VoteDAOImpl implements VoteDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public List<VoteDTO> selectVoteList(int voteState) {
		List<VoteDTO> list = session.selectList("voteMapper.voteSelect", voteState);
		return list;
		
	}
	
	@Override
	public List<VoteDTO> selectVoteListByVoteNo(int voteNo) {
		List<VoteDTO> list = session.selectList("voteMapper.voteSelectByVoteNo", voteNo);
		return list;
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
		return session.selectOne("voteMapper.voteDetailUserCount", voteNo);
	}

	@Override
	public int selectVoteState(int userNo) {
		return session.selectOne("voteMapper.voteDetailState", userNo);
	}
	
}
