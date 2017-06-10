package com.ant.vote.service;

import java.util.List;

import com.ant.vote.dto.VoteDTO;
import com.ant.vote.dto.VoteDetailDTO;

public interface VoteService {

	/**
	 * 진행/종료된 투표목록 출력(SELECT)
	 * 0 : 진행중인 투표 / 1 : 종료된 투표
	 * select * from vote where vote_state = #{_parameter}
	 * */
	public List<VoteDTO> selectVoteList(int voteState);
	
	/**
	 * 투표번호에 해당하는 투표목록 출력
	 * */
	public List<VoteDTO> selectVoteListByVoteNo(int voteNo);
	
	/**
	 * 투표 등록하기(INSERT)
	 * insert into vote values( #{voteNo}, #{userNo}, #{projectUserNo}, #{voteTitle}, sysdate, #{voteEndDate}, 0 )
	 * */
	public int insertVote(VoteDTO voteDTO);
	
	/**
	 * 투표 마감하기(UPDATE)
	 * update vote set voteState=1 where vote_no = #{_parameter}
	 * */
	public int updateVote(int voteNo);
	
	/**
	 * 투표 삭제하기(DELETE)
	 * delete from vote where vote_no = #{_parameter}
	 * */
	public int deleteVote(int voteNo);
	
	/**
	 * 투표 참여하기(INSERT)
	 * */
	public int insertVoteDetail(VoteDetailDTO voteDetailDTO);
	
	/**
	 * 투표 참여수정하기[=재투표하기](UPDATE)
	 * */
	public int updateVoteDetail(int voteDetailNo);
	
	/**
	 * 투표 참여취소하기(DELETE)
	 * */
	public int deleteVoteDetail(int voteDetailNo);
	
	/**
	 * 투표 참여자 검색하기(INSERT)
	 * */
	public List<VoteDetailDTO> selectVoteDetail();
	
	/**
	 * 투표 참여인원 검색하기
	 * */
	public int selectVoteUserCount(int voteNo);
	
	/**
	 * 투표 참여여부 검색하기
	 * */
	public int selectVoteState(int userNo);
	
}
