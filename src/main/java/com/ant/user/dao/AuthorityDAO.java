package com.ant.user.dao;

import java.util.List;

import com.ant.user.dto.AuthorityDTO;

public interface AuthorityDAO {
	/**
	 * ����� ���� ���
	 * (�� USER(���̵�)�� �������� ������ ���� �� �ִ�)
	 */
	int insertAuthority(AuthorityDTO authority);
	
	/**
	 * id�� �ش��ϴ� ���� �˻�
	 * ������ 0�� �̻��� ���� �� �ִ�
	 */
	List<AuthorityDTO> selectAuthorityByUserName(String userName);
}
