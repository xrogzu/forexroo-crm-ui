package cn.ermei.admui.mapper;

import java.util.List;

import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.entity.UserRole;

/** 
 * UserMapper
 * @author dk
 */
public interface UserMapper extends BaseMapper<User> {

	User findByLoginName(String loginName);
	
	void updateLoginInfo(User user);
	
	int getTotal();
	
	void saveUserRole(UserRole userRole);
	
	void deleteUserRole(Long userId);
	
	List<Role> queryRole(Long userId);
	
	void forbid(Long userId);
}
