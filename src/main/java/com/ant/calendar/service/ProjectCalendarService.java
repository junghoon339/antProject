package com.ant.calendar.service;

import java.util.List;

import com.ant.calendar.dto.ProjectCalendarDTO;
import com.dhtmlx.planner.DHXEv;

public interface ProjectCalendarService {
	List<DHXEv> getEvent(int projectNo);
	
	void updateEvent(ProjectCalendarDTO schedule);

	void insertEvent(ProjectCalendarDTO schedule);

	void deleteEvent(Integer id);
	
	public List<ProjectCalendarDTO> selectNowCalVal(int projectNo);
}
