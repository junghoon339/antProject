package com.ant.timetable.dto;

public class TimetableDTO {
	private int userNo;
	private String timetableSubject;
	private String timetableDay;
	private String timetableClass;
	private String timetableLocation;
	private String timetableTeacher;
	
	public TimetableDTO(){}
	public TimetableDTO(int userNo, String timetableSubject, String timetableDay, String timetableClass,
			String timetableLocation, String timetableTeacher) {
		super();
		this.userNo = userNo;
		this.timetableSubject = timetableSubject;
		this.timetableDay = timetableDay;
		this.timetableClass = timetableClass;
		this.timetableLocation = timetableLocation;
		this.timetableTeacher = timetableTeacher;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getTimetableSubject() {
		return timetableSubject;
	}
	public void setTimetableSubject(String timetableSubject) {
		this.timetableSubject = timetableSubject;
	}
	public String getTimetableDay() {
		return timetableDay;
	}
	public void setTimetableDay(String timetableDay) {
		this.timetableDay = timetableDay;
	}
	public String getTimetableClass() {
		return timetableClass;
	}
	public void setTimetableClass(String timetableClass) {
		this.timetableClass = timetableClass;
	}
	public String getTimetableLocation() {
		return timetableLocation;
	}
	public void setTimetableLocation(String timetableLocation) {
		this.timetableLocation = timetableLocation;
	}
	public String getTimetableTeacher() {
		return timetableTeacher;
	}
	public void setTimetableTeacher(String timetableTeacher) {
		this.timetableTeacher = timetableTeacher;
	}
	
	
}
