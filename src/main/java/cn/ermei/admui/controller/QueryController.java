package cn.ermei.admui.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ermei.admui.util.IPUtils;

@Controller
@RequestMapping("/query")
public class QueryController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	@RequestMapping(value = "/ip", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> queryIp() {
		
		String ip = null;
		Enumeration<?> pNames = request.getParameterNames();
		while (pNames.hasMoreElements()){
		    ip = (String)pNames.nextElement();
		    if (StringUtils.isNotBlank(ip)) {
		    	break;
		    }
		}
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			String result = IPUtils.query(ip);
			jsonMap.put("success", true);
			jsonMap.put("message", result);
		} catch (Exception e) {
			logger.error("查询黑名单归属失败！", e);
		}
		return jsonMap;
	}
	
}
