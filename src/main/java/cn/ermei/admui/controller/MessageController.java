package cn.ermei.admui.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ermei.admui.entity.Message;
import cn.ermei.admui.service.MessageService;
import cn.ermei.admui.vo.MessageVo;

@Controller
@RequestMapping("/message")
public class MessageController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	private static final Integer pageSize = 10;
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(Long messageId) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			messageService.delete(messageId);
			jsonMap.put("success", true);
		} catch (Exception e) {
			logger.error("删除消息失败！", e);
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> read(Long messageId) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			messageService.read(messageId);
			jsonMap.put("success", true);
		} catch (Exception e) {
			logger.error("读取消息失败！", e);
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/query", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> query(MessageVo msgVo) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			msgVo.setUserId(loginUser.getUserId());
			msgVo.setStart(msgVo.getPage() == null ? 0 : (msgVo.getPage() - 1) * pageSize);
			msgVo.setLimit(pageSize);
			List<Message> msgList = messageService.queryByUser(msgVo);
			double count = messageService.getCountByUser(msgVo);
			int maxPage = (int)Math.ceil(count / pageSize);
			jsonMap.put("success", true);
			jsonMap.put("page", msgVo.getPage() == null ? 1 : msgVo.getPage());
			jsonMap.put("maxPage", maxPage);
			jsonMap.put("msgList", msgList);
		} catch (Exception e) {
			logger.error("查询消息失败！", e);
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/queryUnread", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> queryUnread(MessageVo msgVo) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			msgVo.setUserId(loginUser.getUserId());
			msgVo.setReadFlag(false);
			msgVo.setStart(0);
			msgVo.setLimit(pageSize / 2);
			List<Message> msgList = messageService.queryByUser(msgVo);
			jsonMap.put("success", true);
			jsonMap.put("msgList", msgList);
		} catch (Exception e) {
			logger.error("查询未读消息失败！", e);
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/queryUnreadCount", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> queryUnreadCount(MessageVo msgVo) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			msgVo.setUserId(loginUser.getUserId());
			msgVo.setReadFlag(false);
			int count = messageService.getCountByUser(msgVo);
			jsonMap.put("success", true);
			jsonMap.put("count", count);
		} catch (Exception e) {
			logger.error("查询未读消息数量失败！", e);
		}
		return jsonMap;
	}
}
