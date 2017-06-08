package cn.ermei.admui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ermei.admui.entity.Log;
import cn.ermei.admui.entity.LogConfig;
import cn.ermei.admui.mapper.BaseMapper;
import cn.ermei.admui.mapper.LogMapper;
import cn.ermei.admui.service.LogService;
import cn.ermei.admui.vo.LogVo;

/**
 * 日志ServiceImpl
 * @author dk
 */

@Service
@Transactional
public class LogServiceImpl extends BaseServiceImpl<Log> implements LogService {

	@Autowired
	private LogMapper mapper;

	@Override
	protected BaseMapper<Log> getMapper() {
		return mapper;
	}

	@Override
	public void saveConfig(LogConfig logConfig) {
		if (logConfig != null) {
			if (logConfig.getConfigId() == null) {
				mapper.saveConfig(logConfig);
			} else {
				mapper.updateConfig(logConfig);
			}
		}
		
	}

	@Override
	@Transactional(readOnly = true)
	public List<LogConfig> queryAllConfig() {
		return mapper.queryAllConfig();
	}

	@Override
	@Transactional(readOnly = true)
	public List<Log> query(LogVo logVo) {
		return mapper.query(logVo);
	}

	@Override
	@Transactional(readOnly = true)
	public int getCount(LogVo logVo) {
		return mapper.getCount(logVo);
	}

	@Override
	public void deleteConfig(Long configId) {
		mapper.deleteConfig(configId);
	}
	
}
