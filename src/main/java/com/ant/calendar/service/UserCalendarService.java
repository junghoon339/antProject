package com.ant.calendar.service;

import java.util.List;

import com.ant.calendar.dto.ProjectCalendarDTO;
import com.ant.calendar.dto.UserCalendarDTO;
import com.dhtmlx.planner.DHXEv;

public interface UserCalendarService {
	List<DHXEv> getEvent(int userNo);

	void updateEvent(UserCalendarDTO schedule);

	void insertEvent(UserCalendarDTO schedule);

	void deleteEvent(Integer id);

}
