package com.ant.timetable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.timetable.dao.TimetableDAO;
import com.ant.timetable.dto.TimetableDTO;

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
		return 0;
	}

	@Override
	public List<TimetableDTO> selectAll(int userNo) {
		// TODO Auto-generated method stub
		return timetableDAO.selectAll(userNo);
	}

}
