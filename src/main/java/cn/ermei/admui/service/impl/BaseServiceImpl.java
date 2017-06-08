package cn.ermei.admui.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ermei.admui.mapper.BaseMapper;
import cn.ermei.admui.service.BaseService;

/**
 * BaseService实现
 * @author dk
 */

@Service
@Transactional
public abstract class BaseServiceImpl<T> implements BaseService<T> {

	protected abstract BaseMapper<T> getMapper();

	@Override
	public void save(T t) {
		getMapper().save(t);
	}

	@Override
	public void delete(Serializable... ids) {
		for (Serializable id : ids) {
			getMapper().delete(id);
		}
	}

	@Override
	public void update(T t) {
		getMapper().update(t);
	}

	@Override
	@Transactional(readOnly = true)
	public List<T> query(Map<String, Object> paraMap) {
		return getMapper().query(paraMap);
	}

	@Override
	@Transactional(readOnly = true)
	public int getCount(Map<String, Object> paraMap) {
		return getMapper().getCount(paraMap);
	}

	@Override
	@Transactional(readOnly = true)
	public T find(Serializable id) {
		return getMapper().find(id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<T> queryAll() {
		return getMapper().queryAll();
	}

}
