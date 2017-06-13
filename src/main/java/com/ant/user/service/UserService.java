package com.ant.user.service;

import com.ant.user.dto.UserDTO;

public interface UserService {
	
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
	 * �α���
	 * @param id
	 * @param password
	 * @return
	 */
	public int login(String id, String password);
	
	/**
	 * ID �ߺ�üũ
	 * @param id
	 * @return
	 */
	public UserDTO selectUserById(String id);
	
}