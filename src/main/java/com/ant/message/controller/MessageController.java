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
	public ModelAndView message(int userNo,String pageNumber,@RequestParam(defaultValue="false")boolean flag){
		
		List<MessageDTO> list=null;
		if(flag){//보낸쪽지함
			list=service.sendMessageSelectAll(userNo);
		}else{//받는쪽지함
			list=service.receiveMessageSelectAll(userNo);
		}
	
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("messageList",list);
		mv.addObject("flag",flag);
		mv.setViewName("message/message");
		
		return mv;
	}
	
	@RequestMapping("/sendMain")
	public ModelAndView sendMessage(int userNo,String pageNumber){
		List<MessageDTO> list=service.sendMessageSelectAll(userNo);
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("messageList",list);
		mv.setViewName("message/message");
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
