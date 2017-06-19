package com.ant.admin.service;

import java.util.List;

import com.ant.admin.dto.NoticeDTO;
import com.ant.message.dto.MessageDTO;
import com.ant.project.dto.ProjectDTO;
import com.ant.storage.dto.StorageDTO;
import com.ant.user.dto.UserDTO;

public interface AdminService {
	/**
	 * 회원전체조회
	 * */
	public List<UserDTO> userSelectAll(int startRow,int endRow);
	
	/**
	 * 회원전체수
	 * */
	public int userTotalCount();
	
	/**
	 * 회원삭제
	 * */
	public int userDelete(int userNo);
	
	/**
	 * 팀플조회(진행중,완료)
	 * */
	public List<ProjectDTO> projectSelectAll(int projectState,int startRow,int endRow);
	
	/**
	 * 팀플전체개수(진행중,완료)
	 * */
	public int projectTotalCount(int projectState);
	
	/**
	 * 팀플검색한전체조회
	 * */
	public List<ProjectDTO> projectSelectAllBySearch(int projectState,int startRow,int endRow,int categoryNo,String searchText);
	
	/**
	 * 팀플검색한전체개수
	 * */
	public int projectTotalCountBySearch(int projectState,int categoryNo,String searchText);
	
	/**
	 * 팀플삭제(진행중, 완료) 
	 * */
	public int projectDelete(int projectNo);
	
	/**
	 * 받은쪽지 전체 가져오기
	 * */
	public List<MessageDTO> receiveMessageSelectAll();
	
	/**
	 * 보낸쪽지 전체 가져오기
	 * */
	public List<MessageDTO> sendMessageSelectAll();
	
	/**
	 *보낸쪽지,받은쪽지 상세 
	 * */
	public MessageDTO messageDetail(int messageNo);
	
	/**
	 * 답장하기(message 레코드삽입)
	 * */
	public int messageInsert(MessageDTO messageDTO);
	
	/**
	 * 보낸쪽지,받은쪽지 삭제
	 * */
	public int messageDelete(int messageNo);
	
	/**
	 * 	공지사항 등록
	 * */
	public int insertNotice(NoticeDTO noticeDTO) throws Exception;
	
	/**
	 * 	공지사항 수정
	 * */
	public int updateNotice(NoticeDTO noticeDTO) throws Exception;
	
	/**
	 * 	공지사항 삭제
	 * */
	public int deleteNotice(int noticeNo,int userNo) throws Exception;
	
	/**
	 * 	공지 사항 전체 
	 * */
	public List<NoticeDTO> noticeSelectAll(int startRow, int endRow);
	
	/**
	 * 	공지사항 전체 리스트 갯수
	 * */
	public int noticeTotalCount();
	
	/**
	 * 	공지 사항 검색  
	 * */
	public List<NoticeDTO> noticeSelectBySearch(int startRow, int endRow, String searchText);
	
	/**
	 * 	공지사항 검색된 리스트 갯수
	 * */
	public int noticeTotalCountBySearch(String searchText);
}
