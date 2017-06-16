package com.ant.message.dao;

import java.util.List;

import com.ant.message.dto.MessageDTO;

public interface MessageDAO {
	/**
	 * 받은쪽지 전체 가져오기
	 * */
	public List<MessageDTO> receiveMessageSelectAll(int userNoMessageSender);
	
	/**
	 * 보낸쪽지 전체 가져오기
	 * */
	public List<MessageDTO> sendMessageSelectAll(int userNoMessagereceiver);
	
	/**
	 *보낸쪽지,받은쪽지 상세 
	 * */
	public MessageDTO messageDetail(int messageNo);
	
	/**
	 * 메세지보내기 or 답장하기(message 레코드삽입)
	 * */
	public int messageInsert(MessageDTO messageDTO);
	
	/**
	 * 보낸쪽지,받은쪽지 삭제
	 * */
	public int messageDelete(int messageNo);
	
	/**
	 * 받은 시간 업데이트(받은쪽지함에서 내용클릭시)
	 * */
	public int receiveTimeUpdate(int messageNo);
	
}
