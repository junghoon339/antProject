package com.ant.message.service;

import java.util.List;

import com.ant.message.dto.MessageDTO;

public interface MessageService {
	/**
	 * �������� ��ü ��������
	 * */
	public List<MessageDTO> receiveMessageSelectAll(int userNoMessageSender);
	
	/**
	 * �������� ��ü ��������
	 * */
	public List<MessageDTO> sendMessageSelectAll(int userNoMessagereceiver);
	
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
