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
	private CalendarDAO eventManagerDao;

	@Override
	public List<DHXEv> getEvent() {
		System.out.println("service");
		return eventManagerDao.getEvent();
	}

	@Override
	public void updateEvent(UserCalendarDTO schedule) {
		eventManagerDao.updateEvent(schedule);
	}

	@Override
	public void insertEvent(UserCalendarDTO schedule) {
		System.out.println("insertEvent 서비스->다오 접근"+schedule);
		eventManagerDao.insertEvent(schedule);
	}

	@Override
	public void deleteEvent(Integer id) {
		System.out.println("deleteEvnet 서비스->다오 접근"+id);
		eventManagerDao.deleteEvent(id);
	}

	@Override
	public void updateEvent(ProjectCalendarDTO schedule) {
	}

	@Override
	public void insertEvent(ProjectCalendarDTO schedule) {
	}
	

}