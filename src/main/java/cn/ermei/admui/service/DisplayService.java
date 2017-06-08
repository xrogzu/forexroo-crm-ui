package cn.ermei.admui.service;

import cn.ermei.admui.entity.Display;


/**
 * 显示设置Service
 * @author dk
 */
public interface DisplayService extends BaseService<Display> {

	/**
     * <p>查询默认显示设置</p>
     *
     * @return  默认显示设置
     */
	Display queryDefault();
	
	/**
     * <p>查询全局显示设置</p>
     *
     * @return  全局显示设置
     */
	Display queryGlobal();
	
	/**
     * <p>根据用户查询显示设置</p>
     *
     * @param   userId  用户id
     * @return  符合条件的显示设置
     */
	Display queryByUser(Long userId);
	
	/**
     * <p>重置用户的显示设置为默认值</p>
     *
     * @param   userId  用户id
     */
	void resetUserDisplay(Long userId);
	
	/**
     * <p>更新全局显示设置</p>
     *
     * @param   display  要更新的对象
     */
	void updateGlobal(Display display);
	
	/**
     * <p>重置全局显示设置为默认值</p>
     */
	void resetGlobal();

}
