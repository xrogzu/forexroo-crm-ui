package cn.ermei.admui.mapper;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/** 
 * BaseMapper接口
 * @author wangdk
 */
public interface BaseMapper<T> {
	
	void save(T t);
	
	void delete(Serializable id);
	
	void update(T t);
	
	List<T> query(Map<String, Object> paraMap);
	
	int getCount(Map<String, Object> paraMap);
	
	T find(Serializable id);
	
	List<T> queryAll();
}
