package com.ant.message.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.message.dto.MessageDTO;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MessageDTO> receiveMessageSelectAll(int userNoMessageSender) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.messageMapper.receiveMessageSelectAll",userNoMessageSender);
	}

	@Override
	public List<MessageDTO> sendMessageSelectAll(int userNoMessagereceiver) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.messageMapper.sendMessageSelectAll",userNoMessagereceiver);
	}

	@Override
	public MessageDTO messageDetail(int messageNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.messageMapper.messageDetail",messageNo);
	}

	@Override
	public int messageInsert(MessageDTO messageDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.messageMapper.messageInsert",messageDTO);
	}

	@Override
	public int messageDelete(int messageNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("mapper.messageMapper.messageDelete", messageNo);
	}

	@Override
	public int receiveTimeUpdate(int messageNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("mapper.messageMapper.receiveTimeUpdate",messageNo);
	}

}
