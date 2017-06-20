package com.ant.timetable.dto;

public class TimetableDTO {
	private int timetableNo;
	private int userNo; //ȸ����ȣ
	private String timetableSubject; //과목명
	/*private String timetableDay; //요일
	private String timetableClass; //시간*/
	private String timetableLocation; //위치
	private String timetableTeacher; //교수명
	private String timetableClassInfo; //뷰에서 controller로 넘길때 요일(시작-칸수),,요일.시간 로 받아주는 String
	private String timetableColor; //timetable색깔
	public int getTimetableNo() {
		return timetableNo;
	}
	public void setTimetableNo(int timetableNo) {
		this.timetableNo = timetableNo;
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
	public String getTimetableTeacher() {
		return timetableTeacher;
	}
	public void setTimetableTeacher(String timetableTeacher) {
		this.timetableTeacher = timetableTeacher;
	}
	public String getTimetableClassInfo() {
		return timetableClassInfo;
	}
	public void setTimetableClassInfo(String timetableClassInfo) {
		this.timetableClassInfo = timetableClassInfo;
	}
	public String getTimetableColor() {
		return timetableColor;
	}
	public void setTimetableColor(String timetableColor) {
		this.timetableColor = timetableColor;
	}
	public String getTimetableLocation() {
		return timetableLocation;
	}
	public void setTimetableLocation(String timetableLocation) {
		this.timetableLocation = timetableLocation;
	}
	
	
	
	
}
