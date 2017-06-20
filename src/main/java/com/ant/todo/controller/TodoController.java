package com.ant.todo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ant.todo.dto.TodoDTO;
import com.ant.todo.service.TodoService;

@Controller
@RequestMapping("/todo")
public class TodoController {
	@Autowired
	private TodoService service;
	
	@RequestMapping("/list")
	public ModelAndView todoList(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("todo/todo_ch");
		return mv;
	}
	
	@RequestMapping("/todoInsert")
	@ResponseBody
	public int todoInsert(TodoDTO todoDTO){
		System.out.println("11111111111111");
		System.out.println(todoDTO.getTodoLocation());
		return service.todoInsert(todoDTO);
	}
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public List<TodoDTO> selectAll(int projectNo){
		
		return service.todoSelectAll(projectNo);
	}
	
	@RequestMapping("/todoUpdate")
	@ResponseBody
	public int todoUpdate(TodoDTO todoDTO){
		
		return service.todoUpdate(todoDTO);
	}
	
	@RequestMapping("/selectText")
	@ResponseBody
	public TodoDTO selectText(int todoNo){
		
		return service.selectByTodoNo(todoNo);
	}

	@RequestMapping("/todoDelete")
	@ResponseBody
	public int todoDelete(int todoNo){
		return service.todoDelete(todoNo);
	}
}
