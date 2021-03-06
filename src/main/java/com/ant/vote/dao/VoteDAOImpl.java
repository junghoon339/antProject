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
	public int voteDateUpdate() {
		return session.update("voteMapper.voteDateUpdate");
	}

	@Override
	public VoteDTO selectVoteListByVoteNo(int voteNo) {
		VoteDTO dto = session.selectOne("voteMapper.voteSelectByVoteNo", voteNo);
		return dto;
	}

	@Override
	public int insertVote(VoteDTO voteDTO) {
		System.out.println("[ �떎�삤 ] �젒洹� �쟾..");
		return session.insert("voteMapper.voteInsert", voteDTO);
	}

	@Override
	public int updateVote(int userNo, int voteNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("userNo", userNo);
		map.put("voteNo", voteNo);
		int result = session.update("voteMapper.voteEndUpdate", map);
		System.out.println("결과값...>"+result);
		return result;
	}

	@Override
	public int deleteVote(int voteNo) {
		return session.delete("voteMapper.voteDelete", voteNo);
	}

	@Override
	public int insertVoteDetail(VoteDetailDTO voteDetailDTO) {
		System.out.println("[ �떎�삤 ] �젒洹� �쟾..");
		return session.insert("voteMapper.voteDetailInsert", voteDetailDTO);
	}

	@Override
	public int updateVoteDetail(int voteDetailNo) {
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
		return session.selectOne("voteMapper.voteAllCount", voteNo);
	}
	
	@Override
	public List<VoteDetailDTO> selectVoteDetailCall(int voteNo,int voteDetailColumn) {
		Map<String, Integer> map = new HashMap<>();
		map.put("voteDetailNo", voteDetailColumn);
		map.put("voteNo", voteNo);
		System.out.println("voteDetailColumn"+voteDetailColumn+", voteNo"+voteNo);
		List<VoteDetailDTO> list = session.selectList("voteMapper.voteDetailSelect", map);
		return list;
	}

	@Override
	public VoteDetailDTO selectVoteDetail(int userNo, int voteNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("voteNo", voteNo);
		System.out.println("�뵒�뀒�씪�씠�땲�뀥�씪�씠利덈뱶, �떎�삤 -> 留덉씠諛뷀떚�뒪 �젒洹� userNo : "+userNo+", voteNo : "+voteNo);
		VoteDetailDTO dto = session.selectOne("voteMapper.voteSelectCheck", map);
		System.out.println("留덉씠諛뷀떚�뒪 -> �떎�삤濡� 媛��졇�삩 由ъ뒪�듃.. "+dto);
		return dto;
	}

	public int voteMaxNo() {
		int MaxNo = 0;
		if (session.selectOne("voteMapper.voteMaxNo") == null) {
			System.out.println("�떎�삤 留μ뒪�꽆 �듃猷�");
			MaxNo = 1;
		} else {
			System.out.println("�떎�삤 留μ뒪�꽆 �럡�뒪");
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
		return session.update("voteMapper.voteSelectorUpdate", voteSelectorDTO);
	}

	@Override
	public int voteSelectorDelete(int voteSelectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public VoteSelectorDTO voteSelectorInsert(int user_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
