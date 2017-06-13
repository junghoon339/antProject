package com.ant.calendar.service;

import java.util.List;

import com.ant.calendar.dto.ProjectCalendarDTO;
import com.ant.calendar.dto.UserCalendarDTO;
import com.dhtmlx.planner.DHXEv;

public interface CalendarService {
	List<DHXEv> getEvent();

	void updateEvent(UserCalendarDTO schedule);

	void insertEvent(UserCalendarDTO schedule);

	void deleteEvent(Integer id);
	
	void updateEvent(ProjectCalendarDTO schedule);

	void insertEvent(ProjectCalendarDTO schedule);

}
