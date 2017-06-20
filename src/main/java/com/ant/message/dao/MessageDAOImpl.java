package com.ant.message.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.message.dto.MessageDTO;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MessageDTO> receiveMessageSelectAll(int userNoMessageSender, int startRow, int endRow) {
		Map<String , Integer> map = new HashMap<>();
		map.put("userNoMessageSender", userNoMessageSender);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.messageMapper.receiveMessageSelectAll",map);
	}

	@Override
	public int countReceiveMessageTotal(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.messageMapper.countReveiveMessage", userNo);
	}

	@Override
	public List<MessageDTO> sendMessageSelectAll(int userNoMessagereceiver, int startRow, int endRow) {
		Map<String , Integer> map = new HashMap<>();
		map.put("userNoMessagereceiver", userNoMessagereceiver);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.messageMapper.sendMessageSelectAll",map);
	}
	
	@Override
	public int countSendeMessageTotal(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.messageMapper.countSendMessage", userNo);
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

	@Override
	public int messageDeleteUpdate(int messageNo, int messageState) {
		// TODO Auto-generated method stub
		Map<String,Integer> map=new HashMap<>();
		map.put("messageNo", messageNo);
		map.put("messageState", messageState);
		return sqlSession.update("mapper.messageMapper.messageDeleteUpdate",map);
	}

	@Override
	public int selectMessageState(int messageNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.messageMapper.selectMessageState",messageNo);
	}

	
	///////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<MessageDTO> receiveMessageSelectAllByName(int userNoMessageSender, int startRow, int endRow,
			String searchText) {
		System.out.println("re ByName");
		System.out.println(userNoMessageSender);
		System.out.println(startRow);
		System.out.println(endRow);
		System.out.println(searchText);
		Map<String, Object> map = new HashMap<>();
		map.put("userNoMessageSender", userNoMessageSender);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchText", searchText);
		List<MessageDTO> list = sqlSession.selectList("mapper.messageMapper.receiveMessageSelectAllByName", map);
		System.out.println(list.size());
		return list;
	}

	@Override
	public List<MessageDTO> receiveMessageSelectAllByContent(int userNoMessageSender, int startRow, int endRow,
			String searchText) {
		Map<String, Object> map = new HashMap<>();
		System.out.println("re ByContent");
		System.out.println(userNoMessageSender);
		System.out.println(startRow);
		System.out.println(endRow);
		System.out.println(searchText);
		map.put("userNoMessageSender", userNoMessageSender);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchText", searchText);
		return sqlSession.selectList("mapper.messageMapper.receiveMessageSelectAllByContent", map);
	}

	@Override
	public int countReceiveMessageTotalByName(int userNo, String searchText) {
		System.out.println("re TotalByName");
		System.out.println(userNo);
		System.out.println(searchText);
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("searchText", searchText);
		int result = sqlSession.selectOne("mapper.messageMapper.countReveiveMessageByName", map);
		System.out.println(result);
		return result;
	}

	@Override
	public int countReceiveMessageTotalByContent(int userNo, String searchText) {
		Map<String, Object> map = new HashMap<>();
		System.out.println("re TotalByContent");
		System.out.println(userNo);
		System.out.println(searchText);
		map.put("userNo", userNo);
		map.put("searchText", searchText);
		return sqlSession.selectOne("mapper.messageMapper.countReveiveMessageByContent", map);
	}

	@Override
	public List<MessageDTO> sendMessageSelectAllByName(int userNoMessagereceiver, int startRow, int endRow,
			String searchText) {
		System.out.println("se ByName");
		Map<String, Object> map = new HashMap<>();
		map.put("userNoMessagereceiver", userNoMessagereceiver);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchText", searchText);
		return sqlSession.selectList("mapper.messageMapper.sendMessageSelectAllByName", map);
	}

	@Override
	public List<MessageDTO> sendMessageSelectAllByContent(int userNoMessagereceiver, int startRow, int endRow,
			String searchText) {
		System.out.println("se ByContent");
		Map<String, Object> map = new HashMap<>();
		map.put("userNoMessagereceiver", userNoMessagereceiver);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchText", searchText);
		return sqlSession.selectList("mapper.messageMapper.sendMessageSelectAllByContent", map);
	}

	@Override
	public int countSendMessageTotalByName(int userNo, String searchText) {
		System.out.println("se TotalByName");
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("searchText", searchText);
		return sqlSession.selectOne("mapper.messageMapper.countSendMessageByName", map);
	}

	@Override
	public int countSendMessageTotalByContent(int userNo, String searchText) {
		System.out.println("se TotalByContent");
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("searchText", searchText);
		return sqlSession.selectOne("mapper.messageMapper.countSendMessageByContent", map);
	}

}
