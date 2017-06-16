package com.ant.user.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ant.user.dao.AuthorityDAO;
import com.ant.user.dao.UserDAO;
import com.ant.user.dto.AuthorityDTO;
import com.ant.user.dto.UserDTO;

@Service // id=userAuthenticationProvider
public class UserAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	private UserDAO userDAO;

	@Autowired
	private AuthorityDAO authorityDAO;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		if(!supports(auth.getClass())){
			System.out.println("!supports");
			return null;
		}
		
		// 1. �μ��� ���� user������ ������ DB�� ���� �ϴ��� üũ
		String userId = auth.getName();
		
		UserDTO userDTO = userDAO.selectUserById(userId);
		
		if (userDTO == null) { // ID�� ���°��
			throw new UsernameNotFoundException("���̵� �Ǵ� ��й�ȣ�� �ٽ� Ȯ���ϼ���. \n<br>��ϵ��� ���� ���̵��̰ų�, ���̵� �Ǵ� ��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.");
		}
		
		int userNo = userDTO.getUserNo();
		
		
		// 2. �����ϸ� ��й�ȣ ��
		String password = (String) auth.getCredentials();
		
		if (!passwordEncoder.matches(password, userDTO.getUserPassword())) {
			throw new BadCredentialsException("���̵� �Ǵ� ��й�ȣ�� �ٽ� Ȯ���ϼ���. \n<br>��ϵ��� ���� ���̵��̰ų�, ���̵� �Ǵ� ��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.");
		}
		
		
		// ������ ������ ����
		// 3. ��� ��ġ�ϸ� Authentication�� ���� ����
		List<AuthorityDTO> list = authorityDAO.selectAuthorityByUserNo(userNo);
		
		if (list.isEmpty()) {
			// �ƹ� ������ ������
			throw new UsernameNotFoundException(userId + "�� �ƹ� ������ �����ϴ�.");
		}
		
		// DB���� ������ �� ������ GrantedAuthority�� ��ȯ�ؾ� ��
		List<SimpleGrantedAuthority> authList = new ArrayList<>();

		for (AuthorityDTO authority : list) {
			authList.add(new SimpleGrantedAuthority(authority.getAuthority()));
		}
		
		return new UsernamePasswordAuthenticationToken(userDTO, null, authList);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// true = ����ó�� �����ϴ� false = ���� �� �� ����
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);	
	}
}
