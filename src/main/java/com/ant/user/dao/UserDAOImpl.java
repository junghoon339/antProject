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
		System.out.println("DAO");
		System.out.println(userDTO.getUserId());
		System.out.println(userDTO.getUserName());
		return sqlSession.update("UserMapper.updateUser", userDTO);
	}
	
	@Override
	public UserDTO selectUserById(String id) {
		return sqlSession.selectOne("UserMapper.selectUserById", id);
	}
	
	@Override
	public UserDTO selectUserByNo(int userNo) {
		return sqlSession.selectOne("UserMapper.selectUserByNo", userNo);
	}

	@Override
	public int updateTempPassword(int userNo, String pw) {
		UserDTO userDTO = new UserDTO(userNo, null, null, pw, null, null);
		return sqlSession.update("UserMapper.updateTempPassword", userDTO);
	}
}