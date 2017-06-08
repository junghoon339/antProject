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
		// 1. 인수로 받은 user정보를 가지고 DB에 존재 하는지 체크
		String userId = auth.getName();
		
		UserDTO userDTO = userDAO.selectUserById(userId);
		
		if (userDTO == null) { // ID가 없는경우
			throw new UsernameNotFoundException(userId + "는 없는 회원입니다.");
		}
		System.out.println(2);
		// 2. 존재하면 비밀번호 비교
		String password = (String) auth.getCredentials();

		if (!passwordEncoder.matches(password, userDTO.getUserPassword())) {
			throw new BadCredentialsException("패스워드 오류 입니다.");
		}
		System.out.println(3);
		// 인증에 성공한 이후
		// 3. 모두 일치하면 Authentication을 만들어서 리턴
		List<AuthorityDTO> list = authorityDAO.selectAuthorityByUserName(userId);
		
		if (list.isEmpty()) {
			// 아무 권한이 없으면
			throw new UsernameNotFoundException(userId + "는 아무 권한이 없습니다.");
		}
		
		System.out.println(4);
		// DB에서 가지고 온 권한을 GrantedAuthority로 변환해야 함
		List<SimpleGrantedAuthority> authList = new ArrayList<>();

		for (AuthorityDTO authority : list) {
			authList.add(new SimpleGrantedAuthority(authority.getAuthority()));
		}
		System.out.println(5);
		return new UsernamePasswordAuthenticationToken(userDTO, null, authList);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// true = 인증처리 가능하다 false = 인증 할 수 없다
		
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
		
		// 1. 인수로 받은 user정보를 가지고 DB에 존재 하는지 체크
		String id = auth.getName();
		Member member = memberDAO.selectMemberById(id);

		if (member == null) { // ID가 없는경우
			throw new UsernameNotFoundException(id + "는 없는 회원입니다.");
		}

		// 2. 존재하면 비밀번호 비교
		String password = (String) auth.getCredentials();

		if (!passwordEncoder.matches(password, member.getPassword())) {
			throw new BadCredentialsException("패스워드 오류 입니다.");
		}

		// 인증에 성공한 이후
		// 3. 모두 일치하면 Authentication을 만들어서 리턴
		List<Authority> list = authoritiesDAO.selectAuthorityByUserName(id);

		if (list.isEmpty()) {
			// 아무 권한이 없으면
			throw new UsernameNotFoundException(id + "는 아무 권한이 없습니다.");
		}

		// DB에서 가지고 온 권한을 GrantedAuthority로 변환해야 함
		List<SimpleGrantedAuthority> authList = new ArrayList<>();

		for (Authority authority : list) {
			authList.add(new SimpleGrantedAuthority(authority.getRole()));
		}

		return new UsernamePasswordAuthenticationToken(member, null, authList);
	}

	*//**
	 * 해당 타입의 Authentication 객체를 이용해서 인증 처리를 할 수 있는지 여부를 리턴해주는 메소드
	 *//*
	@Override
	public boolean supports(Class<?> authentication) {
		// true = 인증처리 가능하다 false = 인증 할 수 없다
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);	
	}
*/
}
