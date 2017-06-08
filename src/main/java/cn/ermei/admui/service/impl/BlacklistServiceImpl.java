package cn.ermei.admui.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ermei.admui.entity.Blacklist;
import cn.ermei.admui.mapper.BaseMapper;
import cn.ermei.admui.mapper.BlacklistMapper;
import cn.ermei.admui.service.BlacklistService;

/**
 * 黑名单Service实现
 * @author dk
 */

@Service
@Transactional
public class BlacklistServiceImpl extends BaseServiceImpl<Blacklist> implements BlacklistService {

	@Autowired
	private BlacklistMapper mapper;

	@Override
	protected BaseMapper<Blacklist> getMapper() {
		return mapper;
	}

	@Override
	public Blacklist queryByIp(String ip) {
		return mapper.queryByIp(ip);
	}

}
