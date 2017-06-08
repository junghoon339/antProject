package com.ant.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ant.message.dto.MessageDTO;
import com.ant.project.dto.ProjectDTO;
import com.ant.user.dto.UserDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Override
	public List<UserDTO> userSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int userDelete(int userNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProjectDTO> projectSelectAll(int projectState) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int projectDelete(int projectState, int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MessageDTO> receiveMessageSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MessageDTO> sendMessageSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MessageDTO messageDetail(int messageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int messageInsert(MessageDTO messageDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int messageDelete(int messageNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
