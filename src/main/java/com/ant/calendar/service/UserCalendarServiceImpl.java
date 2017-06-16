package com.ant.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.calendar.dao.UserCalendarDAO;
import com.ant.calendar.dto.ProjectCalendarDTO;
import com.ant.calendar.dto.UserCalendarDTO;
import com.dhtmlx.planner.DHXEv;

@Service
public class UserCalendarServiceImpl implements UserCalendarService{
	
	@Autowired
	private UserCalendarDAO calendarDAO;

	@Override
	public List<DHXEv> getEvent(int userNo) {
		System.out.println("userCalendar select 서비스->다오 접근 "+userNo);
		return calendarDAO.getEvent(userNo);
	}

	@Override
	public void updateEvent(UserCalendarDTO schedule) {
		System.out.println("userCalendar updateEvent 서비스->다오 접근"+schedule);
		calendarDAO.updateEvent(schedule);
	}

	@Override
	public void insertEvent(UserCalendarDTO schedule) {
		System.out.println("userCalendar insertEvent 서비스->다오 접근"+schedule);
		calendarDAO.insertEvent(schedule);
	}

	@Override
	public void deleteEvent(Integer id) {
		System.out.println("userCalendar deleteEvnet 서비스->다오 접근"+id);
		calendarDAO.deleteEvent(id);
	}
	

}