package com.ant.util;

/**
 * 권한 관련 상수필드 정의
 * @author Hwick
 *
 */
public interface Constants {
	// interface의 변수는 모두 public static final
	
	/**
	 * 관리자 권한
	 */
	String ROLE_ADMIN = "ROLE_ADMIN";

	/**
	 * 사용자 권한 - 그냥 가입하면 주어지는 권한
	 */
	String ROLE_USER = "ROLE_USER";
	
	/**
	 * 조원 권환 - 프로젝트에 참여하면 생기는 권한
	 */
	String ROLE_TEAM_MEMBER = "ROLE_TEAM_MEMBER";
	
	/**
	 * 조장 권한 - 조장일때
	 */
	String ROLE_TEAM_LEADER = "ROLE_TEAM_LEADER";
}
