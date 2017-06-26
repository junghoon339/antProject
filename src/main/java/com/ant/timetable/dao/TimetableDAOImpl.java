package com.ant.timetable.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.timetable.dto.TimetableDTO;
import com.ant.user.dto.UserDTO;

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
		return session.delete("timetableMapper.timetableDelete",timetableNo);
	}

	@Override
	public List<TimetableDTO> selectAll(int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("timetableMapper.selectAll",userNo);
	}

	@Override
	public int changeColor(int timetableNo, String timetableColor) {
		// TODO Auto-generated method stub
		Map<String,Object> map=new HashMap<>();
		map.put("timetableNo", timetableNo);
		map.put("timetableColor", timetableColor);
		return session.update("timetableMapper.changeColor",map);
	}

	@Override
	public List<UserDTO> selectUserNos(int projectNo) {
		// TODO Auto-generated method stub
		return session.selectList("timetableMapper.selectUserNos",projectNo);
	}

	@Override
	public List<Integer> selectUserNoList(int projectNo) {
		// TODO Auto-generated method stub
		return session.selectList("timetableMapper.selectUserNoList",projectNo);
	}

}
