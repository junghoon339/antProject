package com.ant.message.service;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ant.message.dao.MessageDAO;
import com.ant.message.dto.MessageDTO;

@Service
@Transactional
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDAO messageDAO;
	
	@Override
	public List<MessageDTO> receiveMessageSelectAll(int userNoMessageSender, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return messageDAO.receiveMessageSelectAll(userNoMessageSender, startRow, endRow);
	}
	
	@Override
	public int countReceiveMessageTotal(int userNo) {
		// TODO Auto-generated method stub
		return messageDAO.countReceiveMessageTotal(userNo);
	}


	@Override
	public List<MessageDTO> sendMessageSelectAll(int userNoMessagereceiver, int startRow, int endRow) {
		
		return messageDAO.sendMessageSelectAll(userNoMessagereceiver,startRow,endRow);
	}
	

	@Override
	public int countSendeMessageTotal(int userNo) {
		// TODO Auto-generated method stub
		return messageDAO.countSendeMessageTotal(userNo);
	}

	@Override
	public MessageDTO messageDetail(int messageNo,boolean flag) {
		// TODO Auto-generated method stub
		if(flag==false){//받은쪽지함에서 내용확인할때 messageReceivetime 업뎃!
			int result=messageDAO.receiveTimeUpdate(messageNo);
			if(result==0){
				//에러발생
			}
		}
		
		return messageDAO.messageDetail(messageNo);
	}

	@Override
	public int messageInsert(MessageDTO messageDTO) {
		int result=0;
		String receivers=messageDTO.getMessageReceiver();
		
		if(receivers.indexOf(";")==-1){ //하나만들어온것
			result=messageDAO.messageInsert(messageDTO);
		}else{//여러개 들어온것
			String[] strArr=receivers.split(";");
			for(String str:strArr){
				messageDTO.setMessageReceiver(str);
				result=messageDAO.messageInsert(messageDTO);
				
				if(result==0){
					//에러발생
				}
			}
		}
		
		if(result==0){
			//에러발생
		}
		return result;
	}

	@Override
	public int messageDelete(String messageNos,boolean flag) {
		int result=0;
		StringTokenizer stk =new StringTokenizer(messageNos,";");
		while(stk.hasMoreTokens()){
			int messageNo=Integer.parseInt(stk.nextToken());
			
			int messageState=messageDAO.selectMessageState(messageNo);
			if(messageState==1||messageState==2){
				result=messageDAO.messageDelete(messageNo);
			}else{
				if(flag){ //보낸 메세지 삭제 => 2으로 바꿈
					result=messageDAO.messageDeleteUpdate(messageNo,2);
				}else{ //받은메세지 삭제=> 1로바꿀것
					result=messageDAO.messageDeleteUpdate(messageNo,1);
				}
			}
			
			if(result==0){
				//에러뷰
			}
		}
		return result;
	}

	@Override
	public int messageSendCancel(int messageNo) {
		int result=messageDAO.messageDelete(messageNo);
		if(result==0){
			//에러발생
		}
		return result;
	}

	@Override
	public List<MessageDTO> receiveMessageSelectAllBySearch(int userNoMessageSender, int startRow, int endRow,
			int categoryNo, String searchText) {
		List<MessageDTO> list = null;
		if(categoryNo==0){//이름검색
			list = messageDAO.receiveMessageSelectAllByName(userNoMessageSender, startRow, endRow, searchText);
		}else{//내용검색
			list = messageDAO.receiveMessageSelectAllByContent(userNoMessageSender, startRow, endRow, searchText);
		}
		return list;
	}

	@Override
	public int countReceiveMessageTotalBySearch(int userNo, int categoryNo, String searchText) {
		int result = 0;
		if(categoryNo==0){
			result = messageDAO.countReceiveMessageTotalByName(userNo, searchText);
		}else{
			result = messageDAO.countReceiveMessageTotalByContent(userNo, searchText);
		}
		return result;
	}

	@Override
	public List<MessageDTO> sendMessageSelectAllBySearch(int userNoMessagereceiver, int startRow, int endRow,
			int categoryNo, String searchText) {
		List<MessageDTO> list = null;
		if(categoryNo==0){//이름검색
			list = messageDAO.sendMessageSelectAllByName(userNoMessagereceiver, startRow, endRow, searchText);
		}else{//내용검색
			list = messageDAO.sendMessageSelectAllByContent(userNoMessagereceiver, startRow, endRow, searchText);
		}
		return list;
	}

	@Override
	public int countSendMessageTotalBySearch(int userNo, int categoryNo, String searchText) {
		int result = 0;
		if(categoryNo==0){
			result = messageDAO.countSendMessageTotalByName(userNo, searchText);
		}else{
			result = messageDAO.countSendMessageTotalByContent(userNo, searchText);
		}
		return result;
	}

	
}
