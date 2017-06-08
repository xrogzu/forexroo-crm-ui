package cn.ermei.admui.mapper;

import cn.ermei.admui.entity.Display;

/** 
 * DisplayMapper
 * @author dk
 */
public interface DisplayMapper extends BaseMapper<Display> {

	Display queryDefault();
	
	Display queryGlobal();
	
	Display queryByUser(Long userId);
	
	void updateGlobal(Display display);
	
}
