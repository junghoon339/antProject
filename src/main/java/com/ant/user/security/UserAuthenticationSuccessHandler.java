package com.ant.user.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.ant.user.dto.UserDTO;

/**
 * 스프링 시큐리티에서 로그인 실패시 호출되는 이벤트 핸들러임
 * 
 * springBean 설정 문서에서 <security:form-login 태그에 authentication-failure-ref 추가하면
 * 로그인 실패시 onAuthentiationFailure 메소드가 자동 호출됨
 * @author Hwick
 *
 */
@Component // id=memberAuthenticationFailureHandler
public class UserAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {
		UserDTO userDTO = (UserDTO)auth.getPrincipal();
		req.getSession().setAttribute("userDTO", userDTO);
		req.getRequestDispatcher("/user/main").forward(req, res);
	}

}
