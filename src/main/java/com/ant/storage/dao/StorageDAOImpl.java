package com.ant.storage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.storage.dto.StorageDTO;
import com.ant.user.dto.UserDTO;

@Repository
public class StorageDAOImpl implements StorageDAO {
	@Autowired
	private SqlSession session;

	@Override
	public List<StorageDTO> selectAll(int projectNo) {
		List<StorageDTO> list = session.selectList("mapper.storage.storageMapper.selectAll", projectNo);
		return list;
	}

	@Override
	public StorageDTO selectByStorageNum(int storageNo) {
		return session.selectOne("mapper.storage.storageMapper.selectByStorageNum",storageNo);
	}

	@Override
	public int readNumUpdate(int storageNo) {
		return session.update("mapper.storage.storageMapper.readNumUpdate", storageNo);
	}

	@Override
	public int insert(StorageDTO storageDTO) {
		return session.insert("mapper.storage.storageMapper.insert",storageDTO);
	}

	@Override
	public int delete(int storageNo, int userNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("storageNo", storageNo);
		map.put("userNo", userNo);
		return session.delete("mapper.storage.storageMapper.deleteByStorageNum", map);
	}

	@Override
	public int update(StorageDTO storageDTO) {
		return session.update("mapper.storage.storageMapper.update", storageDTO);
	}

	@Override
	public UserDTO selectUserByUserNo(int userNo) {
		return session.selectOne("mapper.storage.storageMapper.selectUserByUserNo",userNo);
	}
	
}
