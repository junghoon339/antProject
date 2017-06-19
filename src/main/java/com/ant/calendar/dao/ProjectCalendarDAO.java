package com.ant.calendar.dao;

import java.util.List;

import com.ant.calendar.dto.ProjectCalendarDTO;
import com.dhtmlx.planner.DHXEv;

public interface ProjectCalendarDAO {

	List<DHXEv> getEvent(int projectNo);

	void updateEvent(ProjectCalendarDTO schedule);

	void insertEvent(ProjectCalendarDTO schedule);

	void deleteEvent(Integer id);

}