package com.ant.user.dao;

import java.util.List;

import com.ant.user.dto.AuthorityDTO;

public interface AuthorityDAO {
	/**
	 * 사용자 권한 등록
	 * (한 USER(아이디)가 여러개의 권한을 가질 수 있다)
	 */
	int insertAuthority(AuthorityDTO authority);
	
	/**
	 * id에 해당하는 권한 검색
	 * 권한은 0개 이상을 가질 수 있다
	 */
	List<AuthorityDTO> selectAuthorityByUserName(String userName);
}
