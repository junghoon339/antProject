package com.ant.todo.dao;

import java.util.List;

import com.ant.todo.dto.TodoDTO;

public interface TodoDAO {
	/**
	 * to do ��ü �ҷ�����
	 * */
	public List<TodoDTO> todoSelectAll();
	
	/**
	 * to do �����ϱ�
	 * */	
	public int todoInsert(TodoDTO todoDTO);
	
	/**
	 * to do �����ϱ�(�̵��ϱ�, ��������ϱ�)
	 * */
	public int todoUpdate(TodoDTO todoDTO);
	
	/**
	 * to do �����ϱ�
	 * */
	public int todoDelete(int todoNo);
}
