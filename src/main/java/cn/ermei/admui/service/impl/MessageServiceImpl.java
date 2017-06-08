package cn.ermei.admui.service.impl;

import java.io.IOException;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.TextMessage;

import cn.ermei.admui.entity.Message;
import cn.ermei.admui.mapper.BaseMapper;
import cn.ermei.admui.mapper.MessageMapper;
import cn.ermei.admui.service.MessageService;
import cn.ermei.admui.vo.MessageVo;
import cn.ermei.admui.websocket.SocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 消息Service实现
 * @author dk
 */

@Service
@Transactional
public class MessageServiceImpl extends BaseServiceImpl<Message> implements MessageService {

	Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private MessageMapper mapper;
	@Autowired
	private SocketHandler handler;

	@Override
	protected BaseMapper<Message> getMapper() {
		return mapper;
	}

	@Override
	public void sendMsg(Message msg) {
		if (msg != null && msg.getUserId() != 0 && StringUtils.isNotBlank(msg.getTitle())) {
			// 保存入库
			mapper.save(msg);
			// websocket发送消息
			try {
				ObjectMapper mapper = new ObjectMapper();  
		        String json =  mapper.writeValueAsString(msg);  
				handler.sendMsg(msg.getUserId(), new TextMessage(json));
			} catch (IOException e) {
				logger.error("系统消息发送失败！", e);
			}
		}
	}

	@Override
	public void read(Long messageId) {
		mapper.updateById(messageId);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Message> queryByUser(MessageVo msgVo) {
		return mapper.queryByUser(msgVo);
	}
	
	@Override
	@Transactional(readOnly = true)
	public int getCountByUser(MessageVo msgVo) {
		return mapper.getCountByUser(msgVo);
	}
	
}
