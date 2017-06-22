package com.ant.timetable.dao;

import java.util.List;

import com.ant.timetable.dto.TimetableDTO;
import com.ant.user.dto.UserDTO;

public interface TimetableDAO {
	/**
	 * 데이터등록하기
	 * */
	public int timetableInsert(TimetableDTO timetableDTO);
	
	/**
	 * 시간표 삭제하기
	 * */
	public int timetableDelete(int timetableNo);
	
	/**
	 * 시간표 색상변경하기
	 * */
	public int changeColor(int timetableNo,String timetableColor);
	
	/**
	 * 시간표 불러오기
	 * */
	List<TimetableDTO> selectAll(int userNo);
	
	/**
	 * projectNo에 맞는 userNo와 이름 가져오기
	 * */
	List<UserDTO> selectUserNos(int projectNo);
	
	/**
	 * projectNo에 맞는 userNo가져오기
	 * */
	List<Integer> selectUserNoList(int projectNo);
}
