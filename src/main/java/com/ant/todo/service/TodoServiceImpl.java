package com.ant.todo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ant.todo.dao.TodoDAO;
import com.ant.todo.dto.TodoDTO;

@Service
public class TodoServiceImpl implements TodoService {
	@Autowired
	private TodoDAO todoDAO;
	
	@Override
	public List<TodoDTO> todoSelectAll(int projectNo) {
		// TODO Auto-generated method stub
		return todoDAO.todoSelectAll(projectNo);
	}

	@Override
	public int todoInsert(TodoDTO todoDTO) {
		// TODO Auto-generated method stub
		return todoDAO.todoInsert(todoDTO);
	}

	@Override
	public int todoUpdate(TodoDTO todoDTO) {
		int result=0;
		System.out.println("위치여..:"+todoDTO.getTodoLocation());
		System.out.println("내용이여..:"+todoDTO.getTodoContent());
		if(todoDTO.getTodoLocation()==-1){
			System.out.println("안안 내용이여..:"+todoDTO.getTodoContent());
			result=todoDAO.todoUpdateText(todoDTO);
		}else{
			// ��ġ�̵� ������Ʈ
			result=todoDAO.todoUpdate(todoDTO);
		}
		
		
		
		 
		return result;
	}

	@Override
	public int todoDelete(int todoNo) {
		// TODO Auto-generated method stub
		return todoDAO.todoDelete(todoNo);
	}

	@Override
	public TodoDTO selectByTodoNo(int todoNo) {
		// TODO Auto-generated method stub
		return todoDAO.selectByTodoNo(todoNo);
	}

}
