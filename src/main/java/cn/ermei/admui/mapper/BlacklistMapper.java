package cn.ermei.admui.mapper;

import cn.ermei.admui.entity.Blacklist;

/** 
 * BlacklistMapper
 * @author dk
 */
public interface BlacklistMapper extends BaseMapper<Blacklist> {

	Blacklist queryByIp(String ip);
	
}
