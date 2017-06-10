package com.ant.storage.dao;

import java.util.List;

import com.ant.storage.dto.StorageDTO;
import com.ant.user.dto.UserDTO;

public interface StorageDAO {
	
	// 전체 자료 뿌려주기
	public List<StorageDTO> selectAll(int projectNo);
	
	// 게시글 번호에 따른 상세보기
	public StorageDTO selectByStorageNum(int strageNo);
	
	// 조회수 1++
	public int readNumUpdate(int storageNo);
	
	// 자료실에 자료 올리기
	public int insert(StorageDTO storageDTO);
	
	//자료실에 올린사람만 자료 지우기
	public int delete(int storageNo,int userNo);
	
	//자료실에 자료 올린사람만 자료수정
	public int update(int storageNo,int userNo, StorageDTO storageDTO);
	
	//이름 가져오기
	public UserDTO selectUserByUserNo(int userNo);
}
