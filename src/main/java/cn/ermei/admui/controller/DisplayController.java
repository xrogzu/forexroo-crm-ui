package cn.ermei.admui.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ermei.admui.entity.Display;
import cn.ermei.admui.service.DisplayService;

@Controller
@RequestMapping("/display")
public class DisplayController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private DisplayService displayService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save(Display display) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			displayService.save(display);
			jsonMap.put("success", true);
		} catch (Exception e) {
			logger.error("保存显示设置失败！", e);
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reset(Display display) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			if (display.getUser() == null || display.getUser().getUserId() == null) {
				displayService.resetGlobal();
			} else {
				displayService.resetUserDisplay(display.getUser().getUserId());
			}
			jsonMap.put("success", true);
		} catch (Exception e) {
			logger.error("重置显示设置失败！", e);
		}
		return jsonMap;
	}
	
}
