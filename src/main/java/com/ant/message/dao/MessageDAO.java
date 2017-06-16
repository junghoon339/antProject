package com.ant.message.dao;

import java.util.List;

import com.ant.message.dto.MessageDTO;

public interface MessageDAO {
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
	public MessageDTO messageDetail(int messageNo);
	
	/**
	 * �޼��������� or �����ϱ�(message ���ڵ����)
	 * */
	public int messageInsert(MessageDTO messageDTO);
	
	/**
	 * ��������,�������� ����
	 * */
	public int messageDelete(int messageNo);
	
	/**
	 * ���� �ð� ������Ʈ(���������Կ��� ����Ŭ����)
	 * */
	public int receiveTimeUpdate(int messageNo);
	
}
