package com.ant.todo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/todo")
public class TodoController {
	
	@RequestMapping("/list")
	public ModelAndView todoList(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("todo/todo");
		return mv;
	}
}
