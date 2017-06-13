package com.ant.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.calendar.dao.CalendarDAO;
import com.ant.calendar.dto.ProjectCalendarDTO;
import com.ant.calendar.dto.UserCalendarDTO;
import com.dhtmlx.planner.DHXEv;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private CalendarDAO calendarDAO;

	@Override
	public List<DHXEv> getEvent(int userNo) {
		System.out.println("service");
		return calendarDAO.getEvent(userNo);
	}

	@Override
	public void updateEvent(UserCalendarDTO schedule) {
		System.out.println("updateEvent ����->�ٿ� ����"+schedule);
		calendarDAO.updateEvent(schedule);
	}

	@Override
	public void insertEvent(UserCalendarDTO schedule) {
		System.out.println("insertEvent ����->�ٿ� ����"+schedule);
		calendarDAO.insertEvent(schedule);
	}

	@Override
	public void deleteEvent(Integer id) {
		System.out.println("deleteEvnet ����->�ٿ� ����"+id);
		calendarDAO.deleteEvent(id);
	}

	@Override
	public void updateEvent(ProjectCalendarDTO schedule) {
	}

	@Override
	public void insertEvent(ProjectCalendarDTO schedule) {
	}
	

}