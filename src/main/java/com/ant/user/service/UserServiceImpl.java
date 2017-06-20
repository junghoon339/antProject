package com.ant.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ant.user.dao.AuthorityDAO;
import com.ant.user.dao.UserDAO;
import com.ant.user.dto.AuthorityDTO;
import com.ant.user.dto.UserDTO;
import com.ant.util.Constants;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private AuthorityDAO authorityDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	@Transactional
	public int insertUser(UserDTO userDTO) {
		String encodedPassword = passwordEncoder.encode(userDTO.getUserPassword());
		userDTO.setUserPassword(encodedPassword);
		userDAO.insertUser(userDTO);

		UserDTO dbDTO = userDAO.selectUserById(userDTO.getUserId());
		
		// ���ѵ��
		authorityDAO.insertAuthority(new AuthorityDTO(dbDTO.getUserNo(), Constants.ROLE_USER));
		
		return 1;
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
	
	public int updateTempPassword(int userNo, String pw){
		String encodedPassword = passwordEncoder.encode(pw);
		int result = userDAO.updateTempPassword(userNo, encodedPassword);
		
		return result;
	}
	
	@Override
	public int login(String id, String password) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO selectUserById(String id) {
		UserDTO userDTO = userDAO.selectUserById(id);
		return userDTO;
	}
	
	@Override
	public UserDTO selectUserByNo(int userNo) {
		UserDTO userDTO = userDAO.selectUserByNo(userNo);
		return userDTO;
	}
}