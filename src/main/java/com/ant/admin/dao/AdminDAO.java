package com.ant.admin.dao;

import java.util.List;

import com.ant.message.dto.MessageDTO;
import com.ant.project.dto.ProjectDTO;
import com.ant.user.dto.UserDTO;

public interface AdminDAO {
	/**
	 * 회원전체조회
	 * */
	public List<UserDTO> userSelectAll();
	
	/**
	 * 회원삭제
	 * */
	public int userDelete(int userNo);
	
	/**
	 * 팀플조회(진행중,완료)
	 * */
	public List<ProjectDTO> projectSelectAll(int projectState);
	
	/**
	 * 팀플삭제(진행중, 완료) 
	 * */
	public int projectDelete(int projectState, int projectNo);
	
	/**
	 * 받은쪽지 전체 가져오기
	 * */
	public List<MessageDTO> receiveMessageSelectAll();
	
	/**
	 * 보낸쪽지 전체 가져오기
	 * */
	public List<MessageDTO> sendMessageSelectAll();
	
	/**
	 *보낸쪽지,받은쪽지 상세 
	 * */
	public MessageDTO messageDetail(int messageNo);
	
	/**
	 * 답장하기(message 레코드삽입)
	 * */
	public int messageInsert(MessageDTO messageDTO);
	
	/**
	 * 보낸쪽지,받은쪽지 삭제
	 * */
	public int messageDelete(int messageNo);
	
}
