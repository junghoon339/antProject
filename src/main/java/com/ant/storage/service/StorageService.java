package com.ant.storage.service;

import java.util.List;


import com.ant.storage.dto.StorageDTO;
import com.ant.user.dto.UserDTO;

public interface StorageService{
		// 전체 자료 뿌려주기
		public List<StorageDTO> selectAll(int projectNo);
		
		// 게시글 번호에 따른 상세보기
		public StorageDTO selectByStorageNum(int storageNo, boolean state) throws Exception;
		
		// 조회수 1++
		/*public int readNumUpdate(int storageNo);*/
		
		// 자료실에 자료 올리기
		public int insert(StorageDTO storageDTO) throws Exception;
		
		//자료실에 올린사람만 자료 지우기
		public int delete(int storageNo,int userNo) throws Exception;
		
		//자료실에 자료 올린사람만 자료수정
		public int update(StorageDTO storageDTO) throws Exception;
		
		//이름 가져오기
		public UserDTO selectUserByUserNo(int userNo);
}
