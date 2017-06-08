package cn.ermei.admui.service;

import java.util.List;

import cn.ermei.admui.entity.Log;
import cn.ermei.admui.entity.LogConfig;
import cn.ermei.admui.vo.LogVo;

/**
 * 日志Service
 * @author dk
 */
public interface LogService extends BaseService<Log> {

	/**
     * <p>保存日志配置</p>
     *
     * @param   logConfig  要保存的日志配置
     */
	void saveConfig(LogConfig logConfig);
	
	/**
     * <p>根据id删除日志配置</p>
     *
     * @param   configId  要删除的日志配置id
     */
	void deleteConfig(Long configId);
	
	/**
     * <p>查询全部日志配置</p>
     *
     * @return  日志配置集合
     */
	List<LogConfig> queryAllConfig();
	
	/**
     * <p>根据vo参数查询日志</p>
     *
     * @param   logVo  vo参数
     * @return  符合条件的日志集合
     */
	List<Log> query(LogVo logVo);
	
	/**
     * <p>根据vo参数查询日志数量</p>
     *
     * @param   logVo  vo参数
     * @return  符合条件的日志数量
     */
	int getCount(LogVo logVo);
	
}
