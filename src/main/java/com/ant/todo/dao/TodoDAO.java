package com.ant.todo.dao;

import java.util.List;

import com.ant.todo.dto.TodoDTO;

public interface TodoDAO {
	/**
	 * to do 전체 불러오기
	 * */
	public List<TodoDTO> todoSelectAll(int projectNo);
	
	/**
	 * to do 삽입하기
	 * */	
	public int todoInsert(TodoDTO todoDTO);
	
	/**
	 * to do 수정하기(이동하기)
	 * */
	public int todoUpdate(TodoDTO todoDTO);
	
	/**
	 * to do 삭제하기
	 * */
	public int todoDelete(int todoNo);
	
	/**
	 * to do 하나 불러오기
	 * */
	public TodoDTO selectByTodoNo(int todoNo);
	
	/**
	 * to do 수정하기(내용수정)
	 * */
	public int todoUpdateText(TodoDTO todoDTO);
}
