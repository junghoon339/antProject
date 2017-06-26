package com.ant.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.calendar.dao.ProjectCalendarDAO;
import com.ant.calendar.dto.ProjectCalendarDTO;
import com.dhtmlx.planner.DHXEv;

@Service
public class ProjectCalendarServiceImpl implements ProjectCalendarService {

	@Autowired
	private ProjectCalendarDAO calendarDAO;
	
	@Override
	public List<DHXEv> getEvent(int projectNo) {
		System.out.println("ProjectCalendar select ����->�ٿ� ���� "+projectNo);
		return calendarDAO.getEvent(projectNo);
	}

	@Override
	public void updateEvent(ProjectCalendarDTO schedule) {
		System.out.println("ProjectCalendar updateEvent ����->�ٿ� ���� "+schedule);
		calendarDAO.updateEvent(schedule);
	}

	@Override
	public void insertEvent(ProjectCalendarDTO schedule) {
		System.out.println("ProjectCalendar insertEvent ����->�ٿ� ����"+schedule);
		calendarDAO.insertEvent(schedule);
	}

	@Override
	public void deleteEvent(Integer id) {
		System.out.println("deleteEvent ����->�ٿ� ����"+id);
		calendarDAO.deleteEvent(id);
	}

	@Override
	public List<ProjectCalendarDTO> selectNowCalVal(int projectNo) {
		return calendarDAO.selectNowCalVal(projectNo);
	}

}
