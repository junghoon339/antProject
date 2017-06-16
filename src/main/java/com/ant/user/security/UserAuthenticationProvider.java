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
		
		// 1. 인수로 받은 user정보를 가지고 DB에 존재 하는지 체크
		String userId = auth.getName();
		
		UserDTO userDTO = userDAO.selectUserById(userId);
		
		if (userDTO == null) { // ID가 없는경우
			throw new UsernameNotFoundException("아이디 또는 비밀번호를 다시 확인하세요. \n<br>등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
		}
		
		int userNo = userDTO.getUserNo();
		
		
		// 2. 존재하면 비밀번호 비교
		String password = (String) auth.getCredentials();
		
		if (!passwordEncoder.matches(password, userDTO.getUserPassword())) {
			throw new BadCredentialsException("아이디 또는 비밀번호를 다시 확인하세요. \n<br>등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
		}
		
		
		// 인증에 성공한 이후
		// 3. 모두 일치하면 Authentication을 만들어서 리턴
		List<AuthorityDTO> list = authorityDAO.selectAuthorityByUserNo(userNo);
		
		if (list.isEmpty()) {
			// 아무 권한이 없으면
			throw new UsernameNotFoundException(userId + "는 아무 권한이 없습니다.");
		}
		
		// DB에서 가지고 온 권한을 GrantedAuthority로 변환해야 함
		List<SimpleGrantedAuthority> authList = new ArrayList<>();

		for (AuthorityDTO authority : list) {
			authList.add(new SimpleGrantedAuthority(authority.getAuthority()));
		}
		
		return new UsernamePasswordAuthenticationToken(userDTO, null, authList);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// true = 인증처리 가능하다 false = 인증 할 수 없다
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);	
	}
}
