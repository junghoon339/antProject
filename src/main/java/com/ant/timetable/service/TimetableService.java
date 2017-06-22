package com.ant.timetable.service;

import java.util.List;
import java.util.Map;

import com.ant.timetable.dto.TimetableDTO;
import com.ant.user.dto.UserDTO;

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
	public int changeColor(int timetableNo,String timetableColor);
	
	/**
	 * 시간표 불러오기
	 * */
	List<TimetableDTO> selectAll(int userNo);
	
	/**
	 * 팀시간표 가져오기
	 * 프로젝트 넘버로 userNo를 구하고 그에 해당하는 시간표를 불러온다. 그리고 map에 담는다.
	 * */
	Map<Integer,List<TimetableDTO>> teamSelectAll(int projectNo);
	
	/**
	 * projectNo에 해당하는 userNo와 이름 가져오기
	 * */
	List<UserDTO> selectUserNos(int projectNo);
}
