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
		return session.selectList("voteMapper.select", voteState);
	}
	
	@Override
	public int insertVote(VoteDTO voteDTO){
		return session.insert("voteMapper.insert", voteDTO);
	}
	
	@Override
	public int updateVote(int voteNo) {
		return session.update("voteMapper.update", voteNo);
	}
	
	@Override
	public int deleteVote(int voteNo){
		return session.delete("voteMapper.delete", voteNo);
	}

	@Override
	public int insertVoteDetail(VoteDetailDTO voteDetailDTO) {
		return session.insert("voteDetailMapper.insert", voteDetailDTO);
	}

	@Override
	public int updateVoteDetail(int voteDetailNo) {
		return session.update("voteDetailMapper.update", voteDetailNo);
	}

	@Override
	public int deleteVoteDetail(int voteDetailNo) {
		return session.delete("voteDetailMapper.delete", voteDetailNo);
	}

	@Override
	public List<VoteDetailDTO> selectVoteDetail() {
		return session.selectList("voteDetailMapper.select");
	}

}
