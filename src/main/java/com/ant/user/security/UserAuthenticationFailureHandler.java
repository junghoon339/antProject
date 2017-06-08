package com.ant.user.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

/**
 * ������ ��ť��Ƽ���� �α��� ���н� ȣ��Ǵ� �̺�Ʈ �ڵ鷯��
 * 
 * springBean ���� �������� <security:form-login �±׿� authentication-failure-ref �߰��ϸ�
 * �α��� ���н� onAuthentiationFailure �޼ҵ尡 �ڵ� ȣ���
 * @author Hwick
 *
 */
@Component // id=memberAuthenticationFailureHandler
public class UserAuthenticationFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res, AuthenticationException e)
			throws IOException, ServletException {
		req.setAttribute("errorMessage", e.getMessage());
		req.getRequestDispatcher("/WEB-INF/views/member/loginForm.jsp").forward(req, res);
	}

}
