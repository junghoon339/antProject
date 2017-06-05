package com.ant.project.dto;

public class ProjectDTO {
	private int projectNo; //프로젝트번호
	private String projectName; //프로젝트명
	private String projectStartdate; //시작날짜
	private String projectEnddate; //종료날짜
	private String projectSubject; //과목명
	private String projectTeacher; //교수명
	private int projectState; //프로젝트상태(0-진행중, 1-마감투표중, 2-완료)

	public ProjectDTO() {}

	public ProjectDTO(int projectNo, String projectName, String projectStartdate, String projectEnddate,
			String projectSubject, String projectTeacher, int projectState) {
		super();
		this.projectNo = projectNo;
		this.projectName = projectName;
		this.projectStartdate = projectStartdate;
		this.projectEnddate = projectEnddate;
		this.projectSubject = projectSubject;
		this.projectTeacher = projectTeacher;
		this.projectState = projectState;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectStartdate() {
		return projectStartdate;
	}

	public void setProjectStartdate(String projectStartdate) {
		this.projectStartdate = projectStartdate;
	}

	public String getProjectEnddate() {
		return projectEnddate;
	}

	public void setProjectEnddate(String projectEnddate) {
		this.projectEnddate = projectEnddate;
	}

	public String getProjectSubject() {
		return projectSubject;
	}

	public void setProjectSubject(String projectSubject) {
		this.projectSubject = projectSubject;
	}

	public String getProjectTeacher() {
		return projectTeacher;
	}

	public void setProjectTeacher(String projectTeacher) {
		this.projectTeacher = projectTeacher;
	}

	public int getProjectState() {
		return projectState;
	}

	public void setProjectState(int projectState) {
		this.projectState = projectState;
	}

	
	
}
