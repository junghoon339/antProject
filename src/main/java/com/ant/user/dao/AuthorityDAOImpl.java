package com.ant.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ant.user.dto.AuthorityDTO;

@Repository
public class AuthorityDAOImpl implements AuthorityDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertAuthority(AuthorityDTO authority) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AuthorityDTO> selectAuthorityByUserName(String userName) {
		
		
		return sqlSession.selectList("AuthorityMapper.selectAuthorityByUserName", userName);
	}
	

}
