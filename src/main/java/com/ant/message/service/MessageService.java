package com.ant.message.service;

import java.util.List;

import com.ant.message.dto.MessageDTO;

public interface MessageService {
	/**
	 * �������� ��ü ��������
	 * */
	public List<MessageDTO> receiveMessageSelectAll(int userNoMessageSender, int startRow, int endRow);
	
	/**
	 * 	���� ���� ��ü ��
	 * */
	public int countReceiveMessageTotal(int userNo); 
	
	/**
	 * 	�˻�� ���� �������� ��ü ��������
	 * */
	public List<MessageDTO> receiveMessageSelectAllBySearch(int userNoMessageSender, int startRow, int endRow, int categoryNo, String searchText);
	
	/**
	 * 	�˻�� ���� �������� ���� ��������
	 * */
	public int countReceiveMessageTotalBySearch(int userNo, int categoryNo, String searchText);
	
	/**
	 * �������� ��ü ��������
	 * */
	public List<MessageDTO> sendMessageSelectAll(int userNoMessagereceiver, int startRow,int endRow);
	
	/**
	 * 	���� ���� ��ü ��
	 * */
	public int countSendeMessageTotal(int userNo); 
	
	/**
	 * 	�˻�� ���� �������� ��ü ��������
	 * */
	public List<MessageDTO> sendMessageSelectAllBySearch(int userNoMessagereceiver, int startRow,int endRow, int categoryNo, String searchText);
	
	/**
	 * 	�˻�� ���� �������� ���� ��������
	 * */
	public int countSendMessageTotalBySearch(int userNo, int categoryNo, String searchText);
	
	/**
	 *��������,�������� �� 
	 * */
	public MessageDTO messageDetail(int messageNo,boolean flag);
	
	/**
	 * �����ϱ�(message ���ڵ����)
	 * */
	public int messageInsert(MessageDTO messageDTO);
	
	/**
	 * ��������,�������� ����
	 * */
	public int messageDelete(String messageNos,boolean flag);
	
	/**
	 * �߼����
	 * */
	public int messageSendCancel(int messageNo);
}
