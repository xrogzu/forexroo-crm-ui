package cn.ermei.admui.service;

import java.util.List;

import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.exception.DuplicateLoginNameException;

/** 
 * 用户Service
 * @author dk
 */
public interface UserService extends BaseService<User> {
	
	/**
     * <p>用户名密码登录认证</p>
     *
     * @param   user  待认证用户
     * @return  认证结果
     */
	boolean login(User user);
	
	/**
     * <p>校验用户对应密码</p>
     *
     * @param   user  待校验用户
     * @return  校验结果
     */
	boolean checkPassword(User user);
	
	/**
     * <p>查询用户总数（未删除的）</p>
     *
     * @return  用户总数
     */
	int getTotal();
	
	/**
     * <p>保存用户</p>
     *
     * @param   user  要保存的用户
     * @throws  DuplicateLoginNameException  用户名重复
     */
	void saveUser(User user) throws DuplicateLoginNameException;
	
	/**
     * <p>保存用户角色授权</p>
     *
     * @param   user  要保存角色授权的用户
     */
	void saveUserRole(User user);
	
	/**
     * <p>根据用户id查询角色授权</p>
     *
     * @param   userId  要查询角色授权的用户
     * @return  角色集合
     */
	List<Role> queryRole(Long userId);
	
	/**
     * <p>根据用户id删除，逻辑删除</p>
     *
     * @param   userId  要删除的用户id
     */
	void deleteUser(Long[] userId);
	
	/**
     * <p>根据用户id禁用</p>
     *
     * @param   userId  要禁用的用户id
     */
	void forbid(Long[] userId);
}
