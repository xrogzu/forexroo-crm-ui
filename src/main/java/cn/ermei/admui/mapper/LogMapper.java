package cn.ermei.admui.mapper;

import java.util.List;

import cn.ermei.admui.entity.Log;
import cn.ermei.admui.entity.LogConfig;
import cn.ermei.admui.vo.LogVo;

/** 
 * LogMapper
 * @author dk
 */
public interface LogMapper extends BaseMapper<Log> {

	void saveConfig(LogConfig logConfig);
	
	void deleteConfig(Long configId);
	
	void updateConfig(LogConfig logConfig);
	
	List<LogConfig> queryAllConfig();
	
	List<Log> query(LogVo logVo);
	
	int getCount(LogVo logVo);
}
