package com.ant.user.dao;

import com.ant.user.dto.UserDTO;

public interface UserDAO {
	/**
	 * 회원 가입
	 * @param userDTO
	 * @return
	 */
	public int insertUser(UserDTO userDTO);
	
	/**
	 * 회원 탈퇴
	 * @param userDTO
	 * @return
	 */
	public int deleteUser(String id, String password);
	
	/**
	 * 회원정보 수정
	 * @param userDTO
	 * @return
	 */
	public int updateUser(UserDTO userDTO);
	
	/**
	 * ID 존재 유무 체크
	 * @param id
	 * @return
	 */
	public UserDTO selectUserById(String id);
}