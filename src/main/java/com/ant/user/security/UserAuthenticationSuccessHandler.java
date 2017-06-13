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
 * ������ ��ť��Ƽ���� �α��� ���н� ȣ��Ǵ� �̺�Ʈ �ڵ鷯��
 * 
 * springBean ���� �������� <security:form-login �±׿� authentication-failure-ref �߰��ϸ�
 * �α��� ���н� onAuthentiationFailure �޼ҵ尡 �ڵ� ȣ���
 * @author Hwick
 *
 */
@Component // id=memberAuthenticationFailureHandler
public class UserAuthenticationSuccessHandler implements AuthenticationSuccessHandler{
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {
		UserDTO userDTO = (UserDTO)auth.getPrincipal();
		//������(�α��ε�) ȸ�� userDTO Session�� ����!
		req.getSession().setAttribute("userDTO", userDTO);
		req.getSession().setAttribute("projectNo", 1);
		//req.getRequestDispatcher("/user/main").forward(req, res); //�쵿�̰� ����� ����!
		req.getRequestDispatcher("/project/home").forward(req, res); 
	}
}
