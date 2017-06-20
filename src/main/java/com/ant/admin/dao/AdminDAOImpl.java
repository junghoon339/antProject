package com.ant.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.admin.dto.NoticeDTO;
import com.ant.message.dto.MessageDTO;
import com.ant.project.dto.ProjectDTO;
import com.ant.storage.dto.StorageDTO;
import com.ant.user.dto.UserDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<UserDTO> userSelectAll(int startRow,int endRow) {
		Map<String,Integer> map=new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("mapper.admin.adminMapper.userSelectAll",map);
	}

	@Override
	public int userDelete(int userNo) {
		// TODO Auto-generated method stub
		return session.delete("mapper.admin.adminMapper.userDelete", userNo);
	}

	@Override
	public List<ProjectDTO> projectSelectAll(int projectState,int startRow,int endRow) {
		Map<String,Integer> map=new HashMap<>();
		map.put("projectState", projectState);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		return session.selectList("mapper.admin.adminMapper.projectSelectAll",map);
	}

	@Override
	public int projectDelete(int projectNo) {
		return session.delete("mapper.admin.adminMapper.projectDelete",projectNo);
	}

	@Override
	public List<MessageDTO> receiveMessageSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MessageDTO> sendMessageSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MessageDTO messageDetail(int messageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int messageInsert(MessageDTO messageDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int messageDelete(int messageNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int userTotalCount() {
		return session.selectOne("mapper.admin.adminMapper.userTotalCount");
	}

	@Override
	public int projectTotalCount(int projectState) {
		return session.selectOne("mapper.admin.adminMapper.projectTotalCount",projectState);
	}

	@Override
	public List<ProjectDTO> projectSelectAllByProjectName(int projectState, int startRow, int endRow,
			String searchText) {
		Map<String,Object> map=new HashMap<>();
		map.put("projectState", projectState);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchText", searchText);
		return session.selectList("mapper.admin.adminMapper.projectSelectAllByProjectName",map);
	}

	@Override
	public List<ProjectDTO> projectSelectAllBySubject(int projectState, int startRow, int endRow, String searchText) {
		Map<String,Object> map=new HashMap<>();
		map.put("projectState", projectState);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchText", searchText);
		
		return session.selectList("mapper.admin.adminMapper.projectSelectAllBySubject",map);
	}

	@Override
	public int projectTotalCountByProjectName(int projectState, String projectName) {
		Map<String,Object> map=new HashMap<>();
		map.put("projectState", projectState);
		map.put("projectName", projectName);
		
		return session.selectOne("mapper.admin.adminMapper.projectTotalCountByProjectName",map);
	}

	@Override
	public int projectTotalCountBySubject(int projectState, String projectSubject) {
		Map<String,Object> map=new HashMap<>();
		map.put("projectState", projectState);
		map.put("projectSubject", projectSubject);
		return session.selectOne("mapper.admin.adminMapper.projectTotalCountBySubject",map);
	}

	@Override
	public int insertNotice(NoticeDTO noticeDTO) throws Exception {
		return session.insert("mapper.admin.adminMapper.insertNotice", noticeDTO);
	}

	@Override
	public int updateNotice(NoticeDTO noticeDTO) throws Exception {
		return session.update("mapper.admin.adminMapper.updateNotice", noticeDTO);
	}

	@Override
	public int deleteNotice(int storageNo) throws Exception {
		return session.delete("mapper.admin.adminMapper.deleteNotice", storageNo);
	}

	@Override
	public List<NoticeDTO> noticeSelectAll(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("mapper.admin.adminMapper.noticeSelectAll", map);
	}

	@Override
	public int noticeTotalCount() {
		return session.selectOne("mapper.admin.adminMapper.noticeTotalCount");
	}

	@Override
	public List<NoticeDTO> noticeSelectBySearch(int startRow, int endRow, String searchText) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int noticeTotalCountBySearch(String searchText, int noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeDTO selectByNoticeNum(int noticeNo) {
		return session.selectOne("mapper.admin.adminMapper.noticeDetail", noticeNo);
	}

	@Override
	public int readNumUpdate(int noticeNo) {
		return session.update("mapper.admin.adminMapper.readNumUpdate", noticeNo);
	}

}
