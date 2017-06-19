package com.ant.user.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.ant.user.dto.UserDTO;

/**
 * 요곤 로그인 성공했을 때
 */
@Component // id=memberAuthenticationFailureHandler
public class UserAuthenticationSuccessHandler implements AuthenticationSuccessHandler{
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {
		UserDTO userDTO = (UserDTO)auth.getPrincipal();
		req.getSession().setAttribute("userDTO", userDTO);
		
		//req.getRequestDispatcher("/user/main").forward(req, res); 
		redirectStrategy.sendRedirect(req,res,"/project/home");
	}
	
}
