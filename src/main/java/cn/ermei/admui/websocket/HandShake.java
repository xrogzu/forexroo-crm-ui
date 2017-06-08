package cn.ermei.admui.websocket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import cn.ermei.admui.entity.User;

/**
 * Socket握手和断开
 * @author dk
 */
public class HandShake implements HandshakeInterceptor {

	Logger logger = Logger.getLogger(this.getClass());
	
	public boolean beforeHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		
		if (request instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
			HttpSession session = servletRequest.getServletRequest().getSession(false);
			
			logger.debug("WebSocket:用户[" 
					+ (User)session.getAttribute("loginUser")
					+ "]已经建立连接");
			
			// 标记用户
			Long userId = ((User)session.getAttribute("loginUser")).getUserId();
			if (userId != null) {
				attributes.put("userId", userId);
			} else {
				return false;
			}
		}
		return true;
	}

	public void afterHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
	}

}