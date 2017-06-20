package com.ant.message.service;

import java.util.List;

import com.ant.message.dto.MessageDTO;

public interface MessageService {
	/**
	 * 받은쪽지 전체 가져오기
	 * */
	public List<MessageDTO> receiveMessageSelectAll(int userNoMessageSender, int startRow, int endRow);
	
	/**
	 * 	받은 쪽지 전체 수
	 * */
	public int countReceiveMessageTotal(int userNo); 
	
	/**
	 * 	검색어에 따른 받은쪽지 전체 가져오기
	 * */
	public List<MessageDTO> receiveMessageSelectAllBySearch(int userNoMessageSender, int startRow, int endRow, int categoryNo, String searchText);
	
	/**
	 * 	검색어에 따른 받은쪽지 갯수 가져오기
	 * */
	public int countReceiveMessageTotalBySearch(int userNo, int categoryNo, String searchText);
	
	/**
	 * 보낸쪽지 전체 가져오기
	 * */
	public List<MessageDTO> sendMessageSelectAll(int userNoMessagereceiver, int startRow,int endRow);
	
	/**
	 * 	보낸 쪽지 전체 수
	 * */
	public int countSendeMessageTotal(int userNo); 
	
	/**
	 * 	검색어에 따른 보낸쪽지 전체 가져오기
	 * */
	public List<MessageDTO> sendMessageSelectAllBySearch(int userNoMessagereceiver, int startRow,int endRow, int categoryNo, String searchText);
	
	/**
	 * 	검색어에 따른 보낸쪽지 갯수 가져오기
	 * */
	public int countSendMessageTotalBySearch(int userNo, int categoryNo, String searchText);
	
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
