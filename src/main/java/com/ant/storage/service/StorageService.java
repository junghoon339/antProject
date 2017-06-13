package com.ant.storage.service;

import java.util.List;


import com.ant.storage.dto.StorageDTO;
import com.ant.user.dto.UserDTO;

public interface StorageService{
		// ��ü �ڷ� �ѷ��ֱ�
		public List<StorageDTO> selectAll(int projectNo);
		
		// �Խñ� ��ȣ�� ���� �󼼺���
		public StorageDTO selectByStorageNum(int storageNo, boolean state) throws Exception;
		
		// ��ȸ�� 1++
		/*public int readNumUpdate(int storageNo);*/
		
		// �ڷ�ǿ� �ڷ� �ø���
		public int insert(StorageDTO storageDTO) throws Exception;
		
		//�ڷ�ǿ� �ø������ �ڷ� �����
		public int delete(int storageNo,int userNo) throws Exception;
		
		//�ڷ�ǿ� �ڷ� �ø������ �ڷ����
		public int update(StorageDTO storageDTO) throws Exception;
		
		//�̸� ��������
		public UserDTO selectUserByUserNo(int userNo);
}
