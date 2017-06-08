package cn.ermei.admui.service;

import java.util.List;

import cn.ermei.admui.entity.Message;
import cn.ermei.admui.vo.MessageVo;

/**
 * 消息Service
 * @author dk
 */
public interface MessageService extends BaseService<Message> {

	/**
     * <p>发送消息</p>
     *
     * @param   msg  要发送的消息
     */
	void sendMsg(Message msg);
	
	/**
     * <p>标记消息为已读</p>
     *
     * @param   messageId  要标记的消息id
     */
	void read(Long messageId);
	
	/**
     * <p>根据vo参数查询消息</p>
     *
     * @param   msgVo  vo参数
     * @return  符合条件的消息集合
     */
	List<Message> queryByUser(MessageVo msgVo);
	
	/**
     * <p>根据vo参数查询消息数量</p>
     *
     * @param   msgVo  vo参数
     * @return  符合条件的消息集合数量
     */
	int getCountByUser(MessageVo msgVo);
}
