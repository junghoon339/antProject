package com.ant.message.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ant.message.dto.MessageDTO;
import com.ant.message.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService service;
	
	@RequestMapping("/main")
	public ModelAndView message(@RequestParam(defaultValue="13")int userNo,String pageNumber, String searchText,@RequestParam(defaultValue="false")boolean flag, @RequestParam(defaultValue="-1") int categoryNo){
		System.out.println("dao searchText = "+searchText);
		System.out.println("dao categoryNo = "+categoryNo);
		if(pageNumber==null){
			pageNumber="1";
		}
		
		int curPage = Integer.parseInt(pageNumber);
		int rowCount = 7;
		int startRow = (curPage-1)*rowCount+1;
		int endRow = curPage*rowCount;


		List<MessageDTO> list=null;
		int totalRow = 0;
		if(categoryNo==-1){//�˻��� ���� ��
			if(flag){//����������
				list=service.sendMessageSelectAll(userNo,startRow,endRow);
				totalRow = service.countSendeMessageTotal(userNo);
			}else{//�޴�������
				list=service.receiveMessageSelectAll(userNo,startRow,endRow);
				totalRow = service.countReceiveMessageTotal(userNo);
			}
		}else{
			if(flag){// �˻�� ���� ����������
				list = service.sendMessageSelectAllBySearch(userNo, startRow, endRow, categoryNo, searchText);
				totalRow = service.countSendMessageTotalBySearch(userNo, categoryNo, searchText);
			}else{// �˻�� ���� ����������
				list = service.receiveMessageSelectAllBySearch(userNo, startRow, endRow, categoryNo, searchText);
				totalRow = service.countReceiveMessageTotalBySearch(userNo, categoryNo, searchText);
			}
		}
		int pageSu = 5;
		int startPage = ((curPage-1)/pageSu)*pageSu+1;
		int endPage = startPage+pageSu-1;
		
		boolean stopLastPage=false;//������ �������� �Ѿ�� ��ư ���ֱ�
		int lastPageNum=totalRow%rowCount==0 ? totalRow/rowCount : totalRow/rowCount+1;
		if(lastPageNum<=endPage){
			endPage=lastPageNum;
			stopLastPage=true;
		}
	
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("messageList",list);
		mv.addObject("flag",flag);
		mv.addObject("totalRow",totalRow);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageSu", pageSu);
		mv.addObject("curPage", curPage);
		mv.addObject("rowCount", rowCount);
		mv.addObject("stopLastPage", stopLastPage);
		
		mv.addObject("categoryNo",categoryNo);
		mv.addObject("searchText",searchText);
		
		mv.setViewName("message/message_ch");
		
		return mv;
	}
	
	@RequestMapping("/sendMain")
	public ModelAndView sendMessage(int userNo,String pageNumber){
		
		if(pageNumber==null){
			pageNumber="1";
		}
		
		int curpage = Integer.parseInt(pageNumber);
		int rowCount = 7;
		int startRow = (curpage-1)*rowCount+1;
		int endRow = curpage*rowCount;
		List<MessageDTO> list=service.sendMessageSelectAll(userNo,startRow,endRow);

		ModelAndView mv=new ModelAndView();
		
		mv.addObject("messageList",list);
		mv.setViewName("message/message_ch");
		return mv;
		
	}
	
	@RequestMapping("/messageInsert")
	public String messageInsert(MessageDTO messageDTO){
		
		service.messageInsert(messageDTO);
		
		return "redirect:/message/main";
	}
	
	@RequestMapping("/selectMessage")
	@ResponseBody
	public MessageDTO messageDetail(int messageNo,boolean flag){
		return service.messageDetail(messageNo,flag);
	}
	
	@RequestMapping("/messageDelete")
	public String messageDelete(String messageNos,boolean flag){
		System.out.println(messageNos);
		service.messageDelete(messageNos,flag);
		return "redirect:/message/main";
	}
	
	@RequestMapping("/sendCancel")
	public String messageSendCancel(int messageNo){
		service.messageSendCancel(messageNo);
		
		return "redirect:/message/main";
	}
}
