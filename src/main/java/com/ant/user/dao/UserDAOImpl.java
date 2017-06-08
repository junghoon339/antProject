package com.ant.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.user.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertUser(UserDTO userDTO) {
		int result = sqlSession.insert("UserMapper.insertUser",userDTO);

		return result;
	}

	@Override
	public int deleteUser(String id, String password) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public UserDTO selectUserById(String id) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("UserMapper.selectUserById", id);
	}
}