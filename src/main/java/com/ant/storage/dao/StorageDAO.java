package com.ant.storage.dao;

import java.util.List;

import com.ant.storage.dto.StorageDTO;
import com.ant.user.dto.UserDTO;

public interface StorageDAO {
	
	// ��ü �ڷ� �ѷ��ֱ�
	public List<StorageDTO> selectAll(int projectNo);
	
	// �Խñ� ��ȣ�� ���� �󼼺���
	public StorageDTO selectByStorageNum(int strageNo);
	
	// ��ȸ�� 1++
	public int readNumUpdate(int storageNo);
	
	// �ڷ�ǿ� �ڷ� �ø���
	public int insert(StorageDTO storageDTO);
	
	//�ڷ�ǿ� �ø������ �ڷ� �����
	public int delete(int storageNo,int userNo);
	
	//�ڷ�ǿ� �ڷ� �ø������ �ڷ����
	public int update(int storageNo,int userNo, StorageDTO storageDTO);
	
	//�̸� ��������
	public UserDTO selectUserByUserNo(int userNo);
}
