package com.ant.timetable.service;

import java.util.List;

import com.ant.timetable.dto.TimetableDTO;

public interface TimetableService {
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
	
	
	/**
	 * 시간표 불러오기
	 * */
	List<TimetableDTO> selectAll(int userNo);
}
