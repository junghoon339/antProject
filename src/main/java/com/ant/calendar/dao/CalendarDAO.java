package com.ant.calendar.dao;

import java.util.List;

import com.ant.calendar.dto.ProjectCalendarDTO;
import com.ant.calendar.dto.UserCalendarDTO;
import com.dhtmlx.planner.DHXEv;

public interface CalendarDAO {

	List<DHXEv> getEvent();

	void updateEvent(UserCalendarDTO schedule);

	void insertEvent(UserCalendarDTO schedule);

	void updateEvent(ProjectCalendarDTO schedule);

	void insertEvent(ProjectCalendarDTO schedule);

	void deleteEvent(Integer id);
}