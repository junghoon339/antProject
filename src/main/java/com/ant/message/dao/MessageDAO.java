package com.ant.message.dao;

import java.util.List;

import org.aspectj.bridge.Message;

import com.ant.message.dto.MessageDTO;

public interface MessageDAO {
	/**
	 * 받은쪽지 전체 가져오기
	 * */
	public List<MessageDTO> receiveMessageSelectAll(int userNoMessageSender, int startRow, int endRow);
	
	/**
	 * 	검색한 이름에 따른 받은 쪽지 전체 가져오기
	 * */
	public List<MessageDTO> receiveMessageSelectAllByName(int userNoMessageSender,int startRow, int endRow,String searchText);
	
	/**
	 * 	검색한 쪽지 내용에 따른 받은 쪽지 전체 가져오기
	 * */
	public List<MessageDTO> receiveMessageSelectAllByContent(int userNoMessageSender,int startRow, int endRow,String searchText);
	
	/**
	 * 	검색한 이름에 따른 받은 쪽지 갯수 
	 * */
	public int countReceiveMessageTotalByName(int userNo, String searchText);
	
	/**
	 * 	검색한 쪽지 내용에 따른 받은 쪽지 갯수 
	 * */
	public int countReceiveMessageTotalByContent(int userNo, String searchText);
	
	/**
	 * 	받은 쪽지 전체 수
	 * */
	public int countReceiveMessageTotal(int userNo); 
	
	/**
	 * 보낸쪽지 전체 가져오기
	 * */
	public List<MessageDTO> sendMessageSelectAll(int userNoMessagereceiver, int startRow, int endRow);
	
	/**
	 * 	검색한 이름에 따른 보낸 쪽지 전체 가져오기
	 * */
	public List<MessageDTO> sendMessageSelectAllByName(int userNoMessagereceiver,int startRow, int endRow,String searchText);
	
	/**
	 * 	검색한 쪽지 내용에 따른 보낸 쪽지 전체 가져오기
	 * */
	public List<MessageDTO> sendMessageSelectAllByContent(int userNoMessagereceiver,int startRow, int endRow,String searchText);
	
	/**
	 * 	검색한 이름에 따른 보낸 쪽지 갯수 
	 * */
	public int countSendMessageTotalByName(int userNo, String searchText);
	/**
	 * 	검색한 쪽지 내용에 보낸 받은 쪽지 갯수 
	 * */
	public int countSendMessageTotalByContent(int userNo, String searchText);
	/**
	 * 	보낸 쪽지 전체 수
	 * */
	public int countSendeMessageTotal(int userNo); 
	
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
	
	/**
	 * 쪽지 삭제(받은사람 or 보낸사람 한쪽만)
	 * */
	public int messageDeleteUpdate(int messageNo,int messageState);
	
	/**
	 * messageState 가져오기
	 * */
	public int selectMessageState(int messageNo);
	
}
