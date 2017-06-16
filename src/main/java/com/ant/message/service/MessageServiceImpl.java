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
	public List<MessageDTO> receiveMessageSelectAll(int userNoMessageSender) {
		// TODO Auto-generated method stub
		return messageDAO.receiveMessageSelectAll(userNoMessageSender);
	}

	@Override
	public List<MessageDTO> sendMessageSelectAll(int userNoMessagereceiver) {
		
		return messageDAO.sendMessageSelectAll(userNoMessagereceiver);
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
	public int messageDelete(String messageNos) {
		int result=0;
		StringTokenizer stk =new StringTokenizer(messageNos,";");
		while(stk.hasMoreTokens()){
			int messageNo=Integer.parseInt(stk.nextToken());
			result=messageDAO.messageDelete(messageNo);
			if(result==0){
				//에러뷰
			}
		}
		return result;
	}

}
