package com.ant.user.service;

import com.ant.user.dto.UserDTO;

public interface UserService {
	
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
	 * 로그인
	 * @param id
	 * @param password
	 * @return
	 */
	public int login(String id, String password);
	
	/**
	 * ID 중복체크
	 * @param id
	 * @return
	 */
	public UserDTO selectUserById(String id);
	
}