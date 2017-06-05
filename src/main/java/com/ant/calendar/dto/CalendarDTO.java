package com.ant.calendar.dto;

public class CalendarDTO {
	private int userNo; //ȸ����ȣ
	private int projectNo; //������Ʈ ��ȣ
	private String calendarStartdate; //������
	private String calendarEnddate; //������
	private String calendarTime; //�ð�
	private String calendarContent; //����

	public CalendarDTO(){}

	public CalendarDTO(int userNo, int projectNo, String calendarStartdate, String calendarEnddate, String calendarTime,
			String calendarContent) {
		super();
		this.userNo = userNo;
		this.projectNo = projectNo;
		this.calendarStartdate = calendarStartdate;
		this.calendarEnddate = calendarEnddate;
		this.calendarTime = calendarTime;
		this.calendarContent = calendarContent;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getCalendarStartdate() {
		return calendarStartdate;
	}

	public void setCalendarStartdate(String calendarStartdate) {
		this.calendarStartdate = calendarStartdate;
	}

	public String getCalendarEnddate() {
		return calendarEnddate;
	}

	public void setCalendarEnddate(String calendarEnddate) {
		this.calendarEnddate = calendarEnddate;
	}

	public String getCalendarTime() {
		return calendarTime;
	}

	public void setCalendarTime(String calendarTime) {
		this.calendarTime = calendarTime;
	}

	public String getCalendarContent() {
		return calendarContent;
	}

	public void setCalendarContent(String calendarContent) {
		this.calendarContent = calendarContent;
	}
	
	
}