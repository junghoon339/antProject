package com.ant.todo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.todo.dto.TodoDTO;

@Repository
public class TodoDAOImpl implements TodoDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<TodoDTO> todoSelectAll(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.todo.todoMapper.todoSelectAll",projectNo);
	}

	@Override
	public int todoInsert(TodoDTO todoDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.todo.todoMapper.todoInsert",todoDTO);
	}

	@Override
	public int todoUpdate(TodoDTO todoDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update("mapper.todo.todoMapper.todoUpdate",todoDTO);
	}

	@Override
	public int todoDelete(int todoNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("mapper.todo.todoMapper.todoDelete",todoNo);
	}

	@Override
	public TodoDTO selectByTodoNo(int todoNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.todo.todoMapper.selectByTodoNo",todoNo);
	}

	@Override
	public int todoUpdateText(TodoDTO todoDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update("mapper.todo.todoMapper.todoUpdateText",todoDTO);
	}

}
