package cn.ermei.admui.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ermei.admui.entity.Blacklist;
import cn.ermei.admui.service.BlacklistService;

@Controller
@RequestMapping("/blacklist")
public class BlacklistController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private BlacklistService blacklistService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save(Blacklist blacklist) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			blacklist.setCreateUser(loginUser);
			blacklistService.save(blacklist);
			
			blacklist.setCreateTime(new Date());
			jsonMap.put("success", true);
			jsonMap.put("blacklist", blacklist);
		} catch(DuplicateKeyException e) {
			jsonMap.put("msg", "ip地址已存在，不能重复添加！");
			logger.error("保存黑名单失败！", e);
		} catch (Exception e) {
			jsonMap.put("msg", "出错了，请重试！");
			logger.error("保存黑名单失败！", e);
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(Long blId) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			blacklistService.delete(blId);
			jsonMap.put("success", true);
		} catch (Exception e) {
			logger.error("删除黑名单失败！", e);
		}
		return jsonMap;
	}
	
}
