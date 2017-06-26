package com.ant.calendar.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.calendar.dto.ProjectCalendarDTO;
import com.ant.project.dto.ProjectDTO;
import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;

@Repository
public class ProjectCalendarDAOImpl implements ProjectCalendarDAO {

	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public List<DHXEv> getEvent(int projectNo) {
		DHXEventsManager.date_format = "yyyy-MM-dd HH:mm:ss";
		List evs = new ArrayList();
		
		List<ProjectCalendarDTO> resultset = sqlSession.selectList("projectCalendarMapper.getEvent", projectNo);
		
		for(int i = 0; i < resultset.size(); i++){
			DHXEvent e = new DHXEvent();
			e.setId(resultset.get(i).getEvent_id());
			e.setText(resultset.get(i).getEvent_name());
			e.setStart_date(resultset.get(i).getStart_date());
			e.setEnd_date(resultset.get(i).getEnd_date());
			
			evs.add(e);
		}
		
		DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";
		System.out.println("projectCalendar select 다오->세션 접근");
		return evs;
	}

	@Override
	public void insertEvent(ProjectCalendarDTO schedule) {
		sqlSession.insert("projectCalendarMapper.insertEvent", schedule);
	}
	
	@Override
	public void updateEvent(ProjectCalendarDTO schedule) {
		sqlSession.update("projectCalendarMapper.updateEvent", schedule);
		System.out.println("updateEvent �ٿ�->���� ����");
	}

	@Override
	public void deleteEvent(Integer id) {
		sqlSession.delete("projectCalendarMapper.deleteEvent", id);
	}

	@Override
	public List<ProjectCalendarDTO> selectNowCalVal(int projectNo) {
		return sqlSession.selectList("projectCalendarMapper.selectNowCalVal", projectNo);
	}

}
