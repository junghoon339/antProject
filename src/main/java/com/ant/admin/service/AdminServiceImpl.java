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
	public int userDelete(int userNo) {
		
		int result=adminDAO.userDelete(userNo);
		if(result==0){
			//에러발생!! 오류페이지!
		}
		return result;
	}

	@Override
	public List<ProjectDTO> projectSelectAll(int projectState,int startRow,int endRow) {
		// TODO Auto-generated method stub
		return adminDAO.projectSelectAll(projectState, startRow, endRow);
	}

	@Override
	public int projectDelete(int projectNo) {
		// TODO Auto-generated method stub
		int result=adminDAO.projectDelete(projectNo);
		if(result==0){
			//에러발생! 오류페이지!
		}
		return result;
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
		
		if(categoryNo==0){ //프로젝트명으로 찾기
			list=adminDAO.projectSelectAllByProjectName(projectState, startRow, endRow, searchText);
		}else{ //과목명으로 찾기
			list=adminDAO.projectSelectAllBySubject(projectState, startRow, endRow, searchText);
		}
		return list;
	}

	@Override
	public int projectTotalCountBySearch(int projectState, int categoryNo, String searchText) {
		int result=0;
		if(categoryNo==0){ //프로젝트명으로 찾기
			result=adminDAO.projectTotalCountByProjectName(projectState, searchText);
		}else{ //과목명으로 찾기
			result=adminDAO.projectTotalCountBySubject(projectState, searchText);
		}
		return result;
	}

	@Override
	public int insertNotice(NoticeDTO noticeDTO) throws Exception {
		int result = adminDAO.insertNotice(noticeDTO);
		if(result==0){
			throw new Exception("삽입 오류");
		}
		return result;
	}

	@Override
	public int updateNotice(NoticeDTO noticeDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int storageNo, int userNo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeDTO> noticeSelectAll(int startRow, int endRow) {
		// TODO Auto-generated method stub
		return adminDAO.noticeSelectAll(startRow, endRow);
	}

	@Override
	public int noticeTotalCount() {
		// TODO Auto-generated method stub
		return adminDAO.noticeTotalCount();
	}

	@Override
	public List<NoticeDTO> noticeSelectBySearch(int startRow, int endRow, String searchText) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int noticeTotalCountBySearch(String searchText) {
		// TODO Auto-generated method stub
		return 0;
	}

}
