package com.ant.calendar.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.calendar.dto.ProjectCalendarDTO;
import com.ant.calendar.dto.UserCalendarDTO;
import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;

@Repository
public class UserCalendarDAOImpl implements UserCalendarDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DHXEv> getEvent(int userNo) {
		DHXEventsManager.date_format = "yyyy-MM-dd HH:mm:ss";
		List evs = new ArrayList();
		
		List<UserCalendarDTO> resultset = sqlSession.selectList("userCalendarMapper.getEvent", userNo);
		
		for(int i = 0; i < resultset.size(); i++){
			DHXEvent e = new DHXEvent();
			e.setId(resultset.get(i).getEvent_id());
			e.setText(resultset.get(i).getEvent_name());
			e.setStart_date(resultset.get(i).getStart_date());
			e.setEnd_date(resultset.get(i).getEnd_date());
			
			evs.add(e);
		}
		DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";
		System.out.println("select 促坷->技记 立辟");
		return evs;
		
	}

	@Override
	public void updateEvent(UserCalendarDTO schedule) {
		//System.out.println("userCalendar update 促坷->技记 立辟");
		sqlSession.update("userCalendarMapper.updateEvent", schedule);
	}

	@Override
	public void insertEvent(UserCalendarDTO schedule) {
		//System.out.println("userCalendar insert 促坷->技记 立辟");
		sqlSession.insert("userCalendarMapper.insertEvent", schedule);
	}

	@Override
	public void deleteEvent(Integer id) {
		sqlSession.delete("userCalendarMapper.deleteEvent",id);
	}

}