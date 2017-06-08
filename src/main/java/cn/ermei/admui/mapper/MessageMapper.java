package cn.ermei.admui.mapper;

import java.util.List;

import cn.ermei.admui.entity.Message;
import cn.ermei.admui.vo.MessageVo;

/** 
 * MessageMapper
 * @author dk
 */
public interface MessageMapper extends BaseMapper<Message> {

	void updateById(Long messageId);
	
	List<Message> queryByUser(MessageVo msgVo);
	
	int getCountByUser(MessageVo msgVo);
}
