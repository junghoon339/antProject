/**
 * 
 */
package com.ant.storage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.storage.dao.StorageDAO;
import com.ant.storage.dto.StorageDTO;
import com.ant.user.dto.UserDTO;

/**
 * @author KOSTA
 *
 */
@Service
public class StorageServiceImpl implements StorageService {
	@Autowired
	private StorageDAO dao;
	
	@Override
	public List<StorageDTO> selectAll(int projectNo) {
		return dao.selectAll(projectNo);
	}

	@Override
	public StorageDTO selectByStorageNum(int storageNo,boolean state) throws Exception{
		if(state){
			int result = dao.readNumUpdate(storageNo);
			if(result==0){
				throw new Exception("조회수 오류입니다.");
			}
		}
		StorageDTO dto = dao.selectByStorageNum(storageNo);
		return dto;
	}

	@Override
	public int insert(StorageDTO storageDTO) throws Exception{
		int result = dao.insert(storageDTO);
		if(result==0){
			throw new Exception("입력되지 않았습니다.");
		}
		return result;
	}

	@Override
	public int delete(int storageNo, int userNo) throws Exception{
		int result = dao.delete(storageNo, userNo);
		if(result==0){
			throw new Exception("삭제되지 않았습니다.");
		}
		return result;
	}

	

	@Override
	public UserDTO selectUserByUserNo(int userNo) {
		return dao.selectUserByUserNo(userNo);
	}

	@Override
	public int update(StorageDTO storageDTO) throws Exception {
			int result = dao.update(storageDTO);
			if(result==0){
				throw new Exception("수정되지 않았습니다.");
			}
		return 0;
	}

}
