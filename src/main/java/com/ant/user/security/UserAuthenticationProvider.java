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
		
		System.out.println(1);
		// 1. �μ��� ���� user������ ������ DB�� ���� �ϴ��� üũ
		String userId = auth.getName();
		
		UserDTO userDTO = userDAO.selectUserById(userId);
		
		if (userDTO == null) { // ID�� ���°��
			throw new UsernameNotFoundException(userId + "�� ���� ȸ���Դϴ�.");
		}
		System.out.println(2);
		// 2. �����ϸ� ��й�ȣ ��
		String password = (String) auth.getCredentials();

		if (!passwordEncoder.matches(password, userDTO.getUserPassword())) {
			throw new BadCredentialsException("�н����� ���� �Դϴ�.");
		}
		System.out.println(3);
		// ������ ������ ����
		// 3. ��� ��ġ�ϸ� Authentication�� ���� ����
		List<AuthorityDTO> list = authorityDAO.selectAuthorityByUserName(userId);
		
		if (list.isEmpty()) {
			// �ƹ� ������ ������
			throw new UsernameNotFoundException(userId + "�� �ƹ� ������ �����ϴ�.");
		}
		
		System.out.println(4);
		// DB���� ������ �� ������ GrantedAuthority�� ��ȯ�ؾ� ��
		List<SimpleGrantedAuthority> authList = new ArrayList<>();

		for (AuthorityDTO authority : list) {
			authList.add(new SimpleGrantedAuthority(authority.getAuthority()));
		}
		System.out.println(5);
		return new UsernamePasswordAuthenticationToken(userDTO, null, authList);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// true = ����ó�� �����ϴ� false = ���� �� �� ����
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);	
	}
	
	
	/*@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private AuthoritiesDAO authoritiesDAO;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		if(!supports(auth.getClass())){
			return null;
		}
		
		// 1. �μ��� ���� user������ ������ DB�� ���� �ϴ��� üũ
		String id = auth.getName();
		Member member = memberDAO.selectMemberById(id);

		if (member == null) { // ID�� ���°��
			throw new UsernameNotFoundException(id + "�� ���� ȸ���Դϴ�.");
		}

		// 2. �����ϸ� ��й�ȣ ��
		String password = (String) auth.getCredentials();

		if (!passwordEncoder.matches(password, member.getPassword())) {
			throw new BadCredentialsException("�н����� ���� �Դϴ�.");
		}

		// ������ ������ ����
		// 3. ��� ��ġ�ϸ� Authentication�� ���� ����
		List<Authority> list = authoritiesDAO.selectAuthorityByUserName(id);

		if (list.isEmpty()) {
			// �ƹ� ������ ������
			throw new UsernameNotFoundException(id + "�� �ƹ� ������ �����ϴ�.");
		}

		// DB���� ������ �� ������ GrantedAuthority�� ��ȯ�ؾ� ��
		List<SimpleGrantedAuthority> authList = new ArrayList<>();

		for (Authority authority : list) {
			authList.add(new SimpleGrantedAuthority(authority.getRole()));
		}

		return new UsernamePasswordAuthenticationToken(member, null, authList);
	}

	*//**
	 * �ش� Ÿ���� Authentication ��ü�� �̿��ؼ� ���� ó���� �� �� �ִ��� ���θ� �������ִ� �޼ҵ�
	 *//*
	@Override
	public boolean supports(Class<?> authentication) {
		// true = ����ó�� �����ϴ� false = ���� �� �� ����
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);	
	}
*/
}
