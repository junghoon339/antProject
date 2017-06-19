package com.ant.message.dao;

import java.util.List;

import org.aspectj.bridge.Message;

import com.ant.message.dto.MessageDTO;

public interface MessageDAO {
	/**
	 * �������� ��ü ��������
	 * */
	public List<MessageDTO> receiveMessageSelectAll(int userNoMessageSender, int startRow, int endRow);
	
	/**
	 * 	�˻��� �̸��� ���� ���� ���� ��ü ��������
	 * */
	public List<MessageDTO> receiveMessageSelectAllByName(int userNoMessageSender,int startRow, int endRow,String searchText);
	
	/**
	 * 	�˻��� ���� ���뿡 ���� ���� ���� ��ü ��������
	 * */
	public List<MessageDTO> receiveMessageSelectAllByContent(int userNoMessageSender,int startRow, int endRow,String searchText);
	
	/**
	 * 	�˻��� �̸��� ���� ���� ���� ���� 
	 * */
	public int countReceiveMessageTotalByName(int userNo, String searchText);
	
	/**
	 * 	�˻��� ���� ���뿡 ���� ���� ���� ���� 
	 * */
	public int countReceiveMessageTotalByContent(int userNo, String searchText);
	
	/**
	 * 	���� ���� ��ü ��
	 * */
	public int countReceiveMessageTotal(int userNo); 
	
	/**
	 * �������� ��ü ��������
	 * */
	public List<MessageDTO> sendMessageSelectAll(int userNoMessagereceiver, int startRow, int endRow);
	
	/**
	 * 	�˻��� �̸��� ���� ���� ���� ��ü ��������
	 * */
	public List<MessageDTO> sendMessageSelectAllByName(int userNoMessagereceiver,int startRow, int endRow,String searchText);
	
	/**
	 * 	�˻��� ���� ���뿡 ���� ���� ���� ��ü ��������
	 * */
	public List<MessageDTO> sendMessageSelectAllByContent(int userNoMessagereceiver,int startRow, int endRow,String searchText);
	
	/**
	 * 	�˻��� �̸��� ���� ���� ���� ���� 
	 * */
	public int countSendMessageTotalByName(int userNo, String searchText);
	/**
	 * 	�˻��� ���� ���뿡 ���� ���� ���� ���� 
	 * */
	public int countSendMessageTotalByContent(int userNo, String searchText);
	/**
	 * 	���� ���� ��ü ��
	 * */
	public int countSendeMessageTotal(int userNo); 
	
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
	
	/**
	 * ���� ����(������� or ������� ���ʸ�)
	 * */
	public int messageDeleteUpdate(int messageNo,int messageState);
	
	/**
	 * messageState ��������
	 * */
	public int selectMessageState(int messageNo);
	
}
