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
	public List<StorageDTO> selectAll(int projectNo, int startRow, int endRow) {
		Map<String,Integer> map=new HashMap<>();
		map.put("projectNo", projectNo);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<StorageDTO> list = session.selectList("mapper.storage.storageMapper.selectAllpaging", map);
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
		System.out.println("title = "+storageDTO.getStorageTitle());
		System.out.println("title = "+storageDTO.getStorageContent());
		System.out.println("storageNo = "+storageDTO.getStorageNo());
		return session.update("mapper.storage.storageMapper.update", storageDTO);
	}

	@Override
	public UserDTO selectUserByUserNo(int userNo) {
		return session.selectOne("mapper.storage.storageMapper.selectUserByUserNo",userNo);
	}

	@Override
	public int totalCount(int projectNo) {
		
		return session.selectOne("mapper.storage.storageMapper.totalCount",projectNo);
	}

	@Override
	public int totalCountByName(String searchText,int projectNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchText", searchText);
		map.put("projectNo", projectNo);
		int result = session.selectOne("mapper.storage.storageMapper.totalCountByName", map);
		return result;
	}

	@Override
	public int totalCountByTitle(String searchText,int projectNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchText", searchText);
		map.put("projectNo", projectNo);
		int result = session.selectOne("mapper.storage.storageMapper.totalCountByTitle", map);
		return result;
	}

	@Override
	public List<StorageDTO> selectByNameSearch(int projectNo, int startRow, int endRow, int categoryNo,
			String searchText) {
		Map<String, Object> map = new HashMap<>();
		map.put("projectNo", projectNo);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchText", searchText);
		List<StorageDTO> list = session.selectList("mapper.storage.storageMapper.selectAllByName",map);
		return list;
	}

	@Override
	public List<StorageDTO> selectByTitleSearch(int projectNo, int startRow, int endRow, int categoryNo,
			String searchText) {
		Map<String, Object> map = new HashMap<>();
		map.put("projectNo", projectNo);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchText", searchText);
		List<StorageDTO> list = session.selectList("mapper.storage.storageMapper.selectAllByTitle",map);
		return list;
	}
	
}
