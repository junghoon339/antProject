package com.ant.todo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ant.todo.dto.TodoDTO;

@Repository
public class TodoDAOImpl implements TodoDAO {

	@Override
	public List<TodoDTO> todoSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int todoInsert(TodoDTO todoDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int todoUpdate(TodoDTO todoDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int todoDelete(int todoNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
