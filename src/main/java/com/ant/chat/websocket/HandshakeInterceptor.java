package com.ant.chat.websocket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {

		// 세션에서 프로젝트 넘버를 가져오고, 그걸 웹소켓 attributes에 저장
		// System.out.println("Before Handshake");

		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		// System.out.println("URI:" + request.getURI());

		HttpServletRequest req = ssreq.getServletRequest();

		// 세션에서 프로젝트 넘버를 가져옴
		int projectNo = (int) req.getSession().getAttribute("projectNo");
		attributes.put("projectNo", projectNo);

		System.out.println("HttpSession에 저장된 pNo:" + projectNo);

		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		System.out.println("After Handshake");

		super.afterHandshake(request, response, wsHandler, ex);
	}

}
