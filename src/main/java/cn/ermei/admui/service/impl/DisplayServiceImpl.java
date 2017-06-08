package cn.ermei.admui.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ermei.admui.entity.Display;
import cn.ermei.admui.mapper.BaseMapper;
import cn.ermei.admui.mapper.DisplayMapper;
import cn.ermei.admui.service.DisplayService;

/**
 * 显示设置Service实现
 * @author dk
 */

@Service
@Transactional
public class DisplayServiceImpl extends BaseServiceImpl<Display> implements DisplayService {

	@Autowired
	private DisplayMapper mapper;

	@Override
	protected BaseMapper<Display> getMapper() {
		return mapper;
	}

	@Override
	@Transactional(readOnly = true)
	public Display queryDefault() {
		return mapper.queryDefault();
	}

	@Override
	@Transactional(readOnly = true)
	public Display queryGlobal() {
		return mapper.queryGlobal();
	}

	@Override
	public void save(Display display) {
		// 系统设置
		if (display.getUser() == null || display.getUser().getUserId() == null) {
			this.updateGlobal(display);
		} else { // 个人设置
			if (mapper.queryByUser(display.getUser().getUserId()) == null) {
				super.save(display);
			} else {
				mapper.update(display);
			}
		}
	}

	@Override
	@Transactional(readOnly = true)
	public Display queryByUser(Long userId) {
		Display display = mapper.queryByUser(userId);
		if (display == null) {
			display = mapper.queryGlobal();
		}
		return display;
	}

	@Override
	public void resetUserDisplay(Long userId) {
		mapper.delete(userId);
	}

	@Override
	public void updateGlobal(Display display) {
		mapper.updateGlobal(display);
	}
	
	@Override
	public void resetGlobal() {
		Display defaultDisplay = mapper.queryDefault();
		mapper.updateGlobal(defaultDisplay);
	}

}
