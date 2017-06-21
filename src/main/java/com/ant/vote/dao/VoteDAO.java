package com.ant.vote.dao;

import java.util.List;

import com.ant.vote.dto.VoteDTO;
import com.ant.vote.dto.VoteDetailDTO;
import com.ant.vote.dto.VoteSelectorDTO;

public interface VoteDAO {
	
	/**
	 * 진행/종료된 투표목록 출력(SELECT)
	 * 0 : 진행중인 투표 / 1 : 종료된 투표
	 * select * from vote where vote_state = #{_parameter}
	 * */
	public List<VoteDTO> selectVoteList(int projectNo, int voteState);
	
	/**
	 * 마감시간이 되면 vote_state를 1로 변경 처리하는 메서드
	 * */
	public int voteDateUpdate();
	
	/**
	 * 투표번호에 해당하는 투표목록 출력
	 * */
	public VoteDTO selectVoteListByVoteNo(int voteNo);
	
	/**
	 * 투표 등록하기(INSERT)
	 * insert into vote values( #{voteNo}, #{userNo}, #{projectUserNo}, #{voteTitle}, sysdate, #{voteEndDate}, 0 )
	 * */
	public int insertVote(VoteDTO voteDTO);
	
	/**
	 * 투표 마감하기(UPDATE)
	 * update vote set voteState=1 where vote_no = #{_parameter}
	 * */
	public int updateVote(int userNo, int voteNo);
	
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
	 * 투표 참여자 검색하기(SELECT) : 조건
	 * */
	public int selectVoteDetailCall(int voteNo);
	
	/**
	 * 투표 참여자 검색하기(SELECT) : 조건
	 * */
	public List<VoteDetailDTO> selectVoteDetailCall(int voteNo,int voteDetailColumn);
	
	/**
	 * 투표 참여자 검색하기(SELECT) : 조건
	 * */
	public VoteDetailDTO selectVoteDetail(int userNo, int voteNo);
	
	/**
	 * vote에 등록된 최대 숫자 값 가져오기..시퀀스넘버 맥이기용
	 */
	public int voteMaxNo();
	
	/**
	 * voteSelector 검색하기
	 */
	public VoteSelectorDTO voteSelectorInsert(int user_no);
	
	/**
	 * voteSelector 생성하기
	 */
	public int voteSelectorInsert(VoteSelectorDTO voteSelectorDTO);
	
	/**
	 * voteSelector 업데이트하기
	 */
	public int voteSelectorUpdate(VoteSelectorDTO voteSelectorDTO);
	
	/**
	 * voteSelector 삭제하기
	 */
	public int voteSelectorDelete(int voteSelectNo);
	
}
