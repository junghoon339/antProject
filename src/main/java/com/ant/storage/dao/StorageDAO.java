package com.ant.storage.dao;

import java.util.List;

import com.ant.storage.dto.StorageDTO;
import com.ant.user.dto.UserDTO;

public interface StorageDAO {
	
	// �̸����� �ڷ� �˻�
	public List<StorageDTO> selectByNameSearch(int projectNo, int startRow, int endRow, int categoryNo, String searchText);
	
	// �̸����� �ڷ� �˻�
	public List<StorageDTO> selectByTitleSearch(int projectNo, int startRow, int endRow, int categoryNo, String searchText);
	
	// ��ü �ڷ� �ѷ��ֱ�
	public List<StorageDTO> selectAll(int projectNo, int startRow, int endRow);
	
	// �Խñ� ��ȣ�� ���� �󼼺���
	public StorageDTO selectByStorageNum(int strageNo);
	
	// ��ȸ�� 1++
	public int readNumUpdate(int storageNo);
	
	// �ڷ�ǿ� �ڷ� �ø���
	public int insert(StorageDTO storageDTO);
	
	//�ڷ�ǿ� �ø������ �ڷ� �����
	public int delete(int storageNo,int userNo);
	
	//�ڷ�ǿ� �ڷ� �ø������ �ڷ����
	public int update(StorageDTO storageDTO);
	
	//�̸� ��������
	public UserDTO selectUserByUserNo(int userNo);
	
	//�� row ����
	public int totalCount(int projectNo);
	
	//�� row ���� by Name
	public int totalCountByName(String searchText, int projectNo);
	
	//�� row ���� by Title
	public int totalCountByTitle(String searchText, int projectNo);
	
	public int selectFileSizeAll(int projectNo);
}
