package cn.ermei.admui.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/** 
 * BaseService
 * @author dk
 */
public interface BaseService<T> {
	
	/**
     * <p>保存</p>
     *
     * @param   t  要保存的对象
     */
	void save(T t);
	
	/**
     * <p>根据ids删除</p>
     *
     * @param   ids  要删除的对象ids
     */
	void delete(Serializable... ids);
	
	/**
     * <p>更新</p>
     *
     * @param   t  要更新的对象
     */
	void update(T t);
	
	/**
     * <p>根据map参数查询</p>
     *
     * @param   paraMap  查询参数map
     * @return  符合条件的对象集合
     */
	List<T> query(Map<String, Object> paraMap);

	/**
     * <p>根据map参数查询数量</p>
     *
     * @param   paraMap  查询参数map
     * @return  符合条件的对象数量
     */
	int getCount(Map<String, Object> paraMap);
	
	/**
     * <p>根据id查询</p>
     *
     * @param   id  对象id
     * @return  符合条件的对象
     */
	public T find(Serializable id);
	
	/**
     * <p>查询全部</p>
     *
     * @return  对象集合
     */
	List<T> queryAll();
}
