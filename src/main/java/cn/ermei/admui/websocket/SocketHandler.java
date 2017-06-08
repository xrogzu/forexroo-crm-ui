package cn.ermei.admui.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {

	Logger logger = Logger.getLogger(this.getClass());
	private static final Map<Long, WebSocketSession> userSocketSessionMap;
	 
    static {
        userSocketSessionMap = new HashMap<Long, WebSocketSession>();
    }
	
    /**
     * 建立连接后
     */
    @Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Long userId = (Long)session.getAttributes().get("userId");
        if (userSocketSessionMap.get(userId) == null) {
            userSocketSessionMap.put(userId, session);
        }
	}
    
    
    /**
     * 消息传输错误处理
     */
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		if (session.isOpen()) {
	        session.close();
	    }
	    Iterator<Entry<Long, WebSocketSession>> it = userSocketSessionMap.entrySet().iterator();
	    // 移除Socket会话
	    while (it.hasNext()) {
	        Entry<Long, WebSocketSession> entry = it.next();
	        if (entry.getValue().getId().equals(session.getId())) {
	            userSocketSessionMap.remove(entry.getKey());
	            logger.debug("WebSocket会话已经移除:用户ID " + entry.getKey());
	            break;
	        }
	    }
	}

	/**
     * 关闭连接后
     */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("WebSocket: " + session.getId() + "已经关闭");
	    Iterator<Entry<Long, WebSocketSession>> it = userSocketSessionMap.entrySet().iterator();
	    // 移除Socket会话
	    while (it.hasNext()) {
	        Entry<Long, WebSocketSession> entry = it.next();
	        if (entry.getValue().getId().equals(session.getId())) {
	            userSocketSessionMap.remove(entry.getKey());
	            logger.debug("WebSocket会话已经移除:用户ID " + entry.getKey());
	            break;
	        }
	    }
	}

	/**
	 * 不支持PartialMessages
	 */
	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

	/**
	 * 给单个用户发送消息
	 */
	public void sendMsg(long userId, TextMessage msg) throws IOException {
		WebSocketSession session = userSocketSessionMap.get(userId);
        if (session != null && session.isOpen()) {
            session.sendMessage(msg);
        }
	}
}