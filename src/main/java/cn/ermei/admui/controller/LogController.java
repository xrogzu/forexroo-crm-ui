package cn.ermei.admui.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ermei.admui.entity.Log;
import cn.ermei.admui.entity.LogConfig;
import cn.ermei.admui.service.LogService;
import cn.ermei.admui.vo.LogVo;

@Controller
@RequestMapping("/log")
public class LogController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private LogService logService;
	
	@RequestMapping(value = "/saveConfig", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveConfig(LogConfig config) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			boolean add = false;
			if (config.getConfigId() == null) {
				add = true;
			}
			config.setCreateUser(loginUser);
			logService.saveConfig(config);
			jsonMap.put("success", true);
			if (add) {
				config.setCreateTime(new Date());
			}
			jsonMap.put("config", config);
		} catch (Exception e) {
			logger.error("保存日志配置失败！", e);
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/deleteConfig", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteConfig(Long configId) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			logService.deleteConfig(configId);
			jsonMap.put("success", true);
		} catch (Exception e) {
			logger.error("删除日志配置失败！", e);
		}
		return jsonMap;
	}
	
	@RequestMapping(value = "/query", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> query(LogVo logVo) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			if (logVo.getColumn() != null) {
				switch (logVo.getColumn()) {
					case 0:
						logVo.setColumnName("url");
						break;
					case 1:
						logVo.setColumnName("type");
						break;
					case 3:
						logVo.setColumnName("login_name");
						break;
					case 4:
						logVo.setColumnName("user_ip");
						break;
					case 5: 
						logVo.setColumnName("log_time");
						break;
					default:
						logVo.setColumnName("log_time");
						break;
				}
			} else {
				logVo.setColumnName("log_time");
			}
			
			if (StringUtils.isBlank(logVo.getDir())) {
				logVo.setDir("desc");
			}
			
			List<Log> logList = logService.query(logVo);
			int total = logService.getCount(logVo);
			jsonMap.put("success", true);
			jsonMap.put("total", total);
			jsonMap.put("data", logList);
		} catch (Exception e) {
			logger.error("日志查询失败！", e);
		}
		
		return jsonMap;
	}
}
