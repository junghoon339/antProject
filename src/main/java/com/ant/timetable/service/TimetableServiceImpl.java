package com.ant.timetable.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.timetable.dao.TimetableDAO;
import com.ant.timetable.dto.TimetableDTO;
import com.ant.user.dto.UserDTO;

@Service
public class TimetableServiceImpl implements TimetableService {
	@Autowired
	private TimetableDAO timetableDAO;
	
	@Override
	public int timetableInsert(TimetableDTO timetableDTO) {
		// TODO Auto-generated method stub
		return timetableDAO.timetableInsert(timetableDTO);
	}

	@Override
	public int timetableDelete(int timetableNo) {
		// TODO Auto-generated method stub
		return timetableDAO.timetableDelete(timetableNo);
	}

	@Override
	public List<TimetableDTO> selectAll(int userNo) {
		// TODO Auto-generated method stub
		return timetableDAO.selectAll(userNo);
	}

	@Override
	public int changeColor(int timetableNo, String timetableColor) {
		// TODO Auto-generated method stub
		return timetableDAO.changeColor(timetableNo, timetableColor);
	}

	@Override
	public Map<Integer, List<TimetableDTO>> teamSelectAll(int projectNo) {
		Map<Integer,List<TimetableDTO>> map=new HashMap<Integer, List<TimetableDTO>>();
		List<Integer> userNoList=timetableDAO.selectUserNoList(projectNo);
		
		for(int userNo:userNoList){
			List<TimetableDTO> list=timetableDAO.selectAll(userNo);
			map.put(userNo, list);
		}
		
		return map;
	}

	@Override
	public List<UserDTO> selectUserNos(int projectNo) {
		// TODO Auto-generated method stub
		return timetableDAO.selectUserNos(projectNo);
	}

}
