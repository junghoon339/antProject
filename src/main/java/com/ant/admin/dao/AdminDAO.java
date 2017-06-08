package com.ant.admin.dao;

import java.util.List;

import com.ant.message.dto.MessageDTO;
import com.ant.project.dto.ProjectDTO;
import com.ant.user.dto.UserDTO;

public interface AdminDAO {
	/**
	 * ȸ����ü��ȸ
	 * */
	public List<UserDTO> userSelectAll();
	
	/**
	 * ȸ������
	 * */
	public int userDelete(int userNo);
	
	/**
	 * ������ȸ(������,�Ϸ�)
	 * */
	public List<ProjectDTO> projectSelectAll(int projectState);
	
	/**
	 * ���û���(������, �Ϸ�) 
	 * */
	public int projectDelete(int projectState, int projectNo);
	
	/**
	 * �������� ��ü ��������
	 * */
	public List<MessageDTO> receiveMessageSelectAll();
	
	/**
	 * �������� ��ü ��������
	 * */
	public List<MessageDTO> sendMessageSelectAll();
	
	/**
	 *��������,�������� �� 
	 * */
	public MessageDTO messageDetail(int messageNo);
	
	/**
	 * �����ϱ�(message ���ڵ����)
	 * */
	public int messageInsert(MessageDTO messageDTO);
	
	/**
	 * ��������,�������� ����
	 * */
	public int messageDelete(int messageNo);
	
}
