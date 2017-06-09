package com.ant.user.dao;

import com.ant.user.dto.UserDTO;

public interface UserDAO {
	/**
	 * ȸ�� ����
	 * @param userDTO
	 * @return
	 */
	public int insertUser(UserDTO userDTO);
	
	/**
	 * ȸ�� Ż��
	 * @param userDTO
	 * @return
	 */
	public int deleteUser(String id, String password);
	
	/**
	 * ȸ������ ����
	 * @param userDTO
	 * @return
	 */
	public int updateUser(UserDTO userDTO);
	
	/**
	 * ID ���� ���� üũ
	 * @param id
	 * @return
	 */
	public UserDTO selectUserById(String id);
}