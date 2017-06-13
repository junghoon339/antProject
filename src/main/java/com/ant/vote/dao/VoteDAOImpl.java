package com.ant.vote.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.vote.dto.VoteDTO;
import com.ant.vote.dto.VoteDetailDTO;
import com.ant.vote.dto.VoteSelectorDTO;

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
	public VoteDTO selectVoteListByVoteNo(int voteNo) {
		VoteDTO dto = session.selectOne("voteMapper.voteSelectByVoteNo", voteNo);
		return dto;
	}

	@Override
	public int insertVote(VoteDTO voteDTO) {
		System.out.println("[ 다오 ] 접근 전..");
		return session.insert("voteMapper.voteInsert", voteDTO);
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
		System.out.println("[ 다오 ] 접근 전..");
		return session.insert("voteMapper.voteDetailInsert", voteDetailDTO);
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
	public VoteDetailDTO selectVoteDetail(int userNo, int voteNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("voteNo", voteNo);
		System.out.println("디테일이니셜라이즈드, 다오 -> 마이바티스 접근 userNo : "+userNo+", voteNo : "+voteNo);
		VoteDetailDTO dto = session.selectOne("voteMapper.voteSelectCheck", map);
		System.out.println("마이바티스 -> 다오로 가져온 리스트.. "+dto);
		return dto;
	}

	public int voteMaxNo() {
		int MaxNo = 0;
		if (session.selectOne("voteMapper.voteMaxNo") == null) {
			System.out.println("다오 맥스넘 트루");
			MaxNo = 1;
		} else {
			System.out.println("다오 맥스넘 펄스");
			MaxNo = session.selectOne("voteMapper.voteMaxNo");
		}
		return MaxNo;
	}

	@Override
	public int voteSelectorInsert(VoteSelectorDTO voteSelectorDTO) {
		return session.insert("voteMapper.voteSelectorInsert", voteSelectorDTO);
	}

	@Override
	public int voteSelectorUpdate(VoteSelectorDTO voteSelectorDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int voteSelectorDelete(int voteSelectNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
