package com.ant.timetable.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.timetable.dto.TimetableDTO;

@Repository
public class TimetableDAOImpl implements TimetableDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public int timetableInsert(TimetableDTO timetableDTO) {
		// TODO Auto-generated method stub
		return session.insert("timetableMapper.timetableInsert",timetableDTO);
	}

	@Override
	public int timetableDelete(int timetableNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TimetableDTO> selectAll(int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("timetableMapper.selectAll",userNo);
	}

}
