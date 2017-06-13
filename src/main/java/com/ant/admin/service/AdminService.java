package com.ant.admin.service;

import java.util.List;

import com.ant.message.dto.MessageDTO;
import com.ant.project.dto.ProjectDTO;
import com.ant.user.dto.UserDTO;

public interface AdminService {
	/**
	 * ȸ����ü��ȸ
	 * */
	public List<UserDTO> userSelectAll(int startRow,int endRow);
	
	/**
	 * ȸ����ü��
	 * */
	public int userTotalCount();
	
	/**
	 * ȸ������
	 * */
	public int userDelete(int userNo);
	
	/**
	 * ������ȸ(������,�Ϸ�)
	 * */
	public List<ProjectDTO> projectSelectAll(int projectState,int startRow,int endRow);
	
	/**
	 * ������ü����(������,�Ϸ�)
	 * */
	public int projectTotalCount(int projectState);
	
	/**
	 * ���ð˻�����ü��ȸ
	 * */
	public List<ProjectDTO> projectSelectAllBySearch(int projectState,int startRow,int endRow,int categoryNo,String searchText);
	
	/**
	 * ���ð˻�����ü����
	 * */
	public int projectTotalCountBySearch(int projectState,int categoryNo,String searchText);
	
	/**
	 * ���û���(������, �Ϸ�) 
	 * */
	public int projectDelete(int projectNo);
	
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
