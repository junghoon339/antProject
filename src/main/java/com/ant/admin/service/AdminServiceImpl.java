package com.ant.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.admin.dao.AdminDAO;
import com.ant.admin.dto.NoticeDTO;
import com.ant.message.dto.MessageDTO;
import com.ant.project.dto.ProjectDTO;
import com.ant.storage.dto.StorageDTO;
import com.ant.user.dto.UserDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	public AdminDAO adminDAO;
	
	@Override
	public List<UserDTO> userSelectAll(int startRow,int endRow) {
		// TODO Auto-generated method stub
		return adminDAO.userSelectAll(startRow, endRow);
	}

	@Override
	public int userDelete(int userNo) throws Exception {
		
		int result=adminDAO.userDelete(userNo);
		if(result==0){
			throw new Exception("삭제실패");
		}
		return result;
	}

	@Override
	public List<ProjectDTO> projectSelectAll(int projectState,int startRow,int endRow) {
		// TODO Auto-generated method stub
		return adminDAO.projectSelectAll(projectState, startRow, endRow);
	}

	@Override
	public int projectDelete(int projectNo) throws Exception  {
		// TODO Auto-generated method stub
		int result=adminDAO.projectDelete(projectNo);
		if(result==0){
			throw new Exception("삭제실패");
		}
		return result;
	}

	@Override
	public int userTotalCount() {
		// TODO Auto-generated method stub
		return adminDAO.userTotalCount();
	}

	@Override
	public int projectTotalCount(int projectState) {
		// TODO Auto-generated method stub
		return adminDAO.projectTotalCount(projectState);
	}

	@Override
	public List<ProjectDTO> projectSelectAllBySearch(int projectState, int startRow, int endRow, int categoryNo,
			String searchText) {
		List<ProjectDTO> list=null;
		
		if(categoryNo==0){ //������Ʈ������ ã��
			list=adminDAO.projectSelectAllByProjectName(projectState, startRow, endRow, searchText);
		}else{ //��������� ã��
			list=adminDAO.projectSelectAllBySubject(projectState, startRow, endRow, searchText);
		}
		return list;
	}

	@Override
	public int projectTotalCountBySearch(int projectState, int categoryNo, String searchText) {
		int result=0;
		if(categoryNo==0){ //������Ʈ������ ã��
			result=adminDAO.projectTotalCountByProjectName(projectState, searchText);
		}else{ //��������� ã��
			result=adminDAO.projectTotalCountBySubject(projectState, searchText);
		}
		return result;
	}

	@Override
	public int insertNotice(NoticeDTO noticeDTO) throws Exception {
		int result = adminDAO.insertNotice(noticeDTO);
		if(result==0){
			throw new Exception("���� ����");
		}
		return result;
	}

	@Override
	public int updateNotice(NoticeDTO noticeDTO) throws Exception {
		int result = adminDAO.updateNotice(noticeDTO);
		if(result==0){
			throw new Exception("업데이트 실패");
		}
		return result;
	}

	@Override
	public int deleteNotice(int storageNo) throws Exception {
		int result = adminDAO.deleteNotice(storageNo);
		if(result==0){
			throw new Exception("삭제실패");
		}
		return result;
	}

	@Override
	public List<NoticeDTO> noticeSelectAll(int startRow, int endRow) {
		return adminDAO.noticeSelectAll(startRow, endRow);
	}

	@Override
	public int noticeTotalCount() {
		return adminDAO.noticeTotalCount();
	}

	@Override
	public List<NoticeDTO> noticeSelectBySearch(int startRow, int endRow, String searchText) {
		return adminDAO.noticeSelectBySearch(startRow, endRow, searchText);
	}

	@Override
	public int noticeTotalCountBySearch(String searchText) {
		return adminDAO.noticeTotalCountBySearch(searchText);
	}

	@Override
	public NoticeDTO selectByNoticeNum(int noticeNo) {
		adminDAO.readNumUpdate(noticeNo);
		return adminDAO.selectByNoticeNum(noticeNo);
	}

}
