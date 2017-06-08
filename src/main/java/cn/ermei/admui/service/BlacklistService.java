package cn.ermei.admui.service;

import cn.ermei.admui.entity.Blacklist;


/**
 * 黑名单Service
 * @author dk
 */
public interface BlacklistService extends BaseService<Blacklist> {

	Blacklist queryByIp(String ip);
	
}
