package com.ant.storage.dto;

import org.springframework.web.multipart.MultipartFile;

import com.ant.calendar.dto.ProjectCalendarDTO;
import com.ant.user.dto.UserDTO;

public class StorageDTO {
	private int storageNo;
	private int userNo;
	private int projectNo;
	private String fileName;
	private String filePath;
	private String storageTitle;
	private String storageContent;
	private int fileSize;
	private int readNum;
	private String writeDay;
	
	private UserDTO userDTO;
	
	private MultipartFile file;
	
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public StorageDTO(){
		
	}

	public UserDTO getUserDTO() {
		return userDTO;
	}

	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}

	public int getStorageNo() {
		return storageNo;
	}

	public void setStorageNo(int storageNo) {
		this.storageNo = storageNo;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getStorageTitle() {
		return storageTitle;
	}

	public void setStorageTitle(String storageTitle) {
		this.storageTitle = storageTitle;
	}

	public String getStorageContent() {
		return storageContent;
	}

	public void setStorageContent(String storageContent) {
		this.storageContent = storageContent;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public int getReadNum() {
		return readNum;
	}

	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}

	public String getWriteDay() {
		return writeDay;
	}

	public void setWriteDay(String writeDay) {
		this.writeDay = writeDay;
	}
	
}
