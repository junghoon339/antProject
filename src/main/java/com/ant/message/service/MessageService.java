package com.ant.message.service;

import java.util.List;

import com.ant.message.dto.MessageDTO;

public interface MessageService {
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
	public MessageDTO messageDetail(int messageNo,boolean flag);
	
	/**
	 * 답장하기(message 레코드삽입)
	 * */
	public int messageInsert(MessageDTO messageDTO);
	
	/**
	 * 보낸쪽지,받은쪽지 삭제
	 * */
	public int messageDelete(String messageNos,boolean flag);
	
	/**
	 * 발송취소
	 * */
	public int messageSendCancel(int messageNo);
}
