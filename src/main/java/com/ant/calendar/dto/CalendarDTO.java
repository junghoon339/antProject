package com.ant.calendar.dto;

public class CalendarDTO {
	private int userNo; //회원번호
	private String userCalendarStartdate; //시작일
	private String userCalendarEnddate; //종료일
	private String userCalendarTime; //시간
	private String userCalendarContent; //내용
	
	public CalendarDTO(){}
	public CalendarDTO(int userNo, String userCalendarStartdate, String userCalendarEnddate, String userCalendarTime,
			String userCalendarContent) {
		super();
		this.userNo = userNo;
		this.userCalendarStartdate = userCalendarStartdate;
		this.userCalendarEnddate = userCalendarEnddate;
		this.userCalendarTime = userCalendarTime;
		this.userCalendarContent = userCalendarContent;
	}

	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserCalendarStartdate() {
		return userCalendarStartdate;
	}
	public void setUserCalendarStartdate(String userCalendarStartdate) {
		this.userCalendarStartdate = userCalendarStartdate;
	}
	public String getUserCalendarEnddate() {
		return userCalendarEnddate;
	}
	public void setUserCalendarEnddate(String userCalendarEnddate) {
		this.userCalendarEnddate = userCalendarEnddate;
	}
	public String getUserCalendarTime() {
		return userCalendarTime;
	}
	public void setUserCalendarTime(String userCalendarTime) {
		this.userCalendarTime = userCalendarTime;
	}
	public String getUserCalendarContent() {
		return userCalendarContent;
	}
	public void setUserCalendarContent(String userCalendarContent) {
		this.userCalendarContent = userCalendarContent;
	}
	
	
}
