package cn.ermei.admui.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.entity.UserRole;
import cn.ermei.admui.enums.UserState;
import cn.ermei.admui.exception.DuplicateLoginNameException;
import cn.ermei.admui.mapper.BaseMapper;
import cn.ermei.admui.mapper.UserMapper;
import cn.ermei.admui.service.MessageService;
import cn.ermei.admui.service.UserService;
import cn.ermei.admui.util.Md5Utils;

/**
 * 用户Service实现
 * @author dk
 */

@Service
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

	@Autowired
	MessageService messageService;
	@Autowired
	private UserMapper mapper;
	
	@Override
	protected BaseMapper<User> getMapper() {
		return mapper;
	}

	@Override
	public boolean login(User user) {
		
		if (user == null || StringUtils.isBlank(user.getLoginName()) || StringUtils.isEmpty(user.getPassword())) {
			return false;
		}
		
		User dbUser = mapper.findByLoginName(user.getLoginName());
		if (dbUser != null && user.getPassword().equals(dbUser.getPassword()) && UserState.NORMAL.equals(dbUser.getState())) {
			user.setUserId(dbUser.getUserId());
			user.setLoginCount(dbUser.getLoginCount() + 1);
			user.setLastLoginTime(dbUser.getLastLoginTime());
			user.setRoles(dbUser.getRoles());
			updateLoginInfo(user);
			return true;
		}
		
		return false;
	}
	
	@Override
	public boolean checkPassword(User user) {
		
		if (user == null || StringUtils.isBlank(user.getLoginName()) || StringUtils.isEmpty(user.getPassword())) {
			return false;
		}
		
		User dbUser = mapper.findByLoginName(user.getLoginName());
		if (dbUser != null && Md5Utils.hash(user.getPassword()).equals(dbUser.getPassword())) {
			return true;
		}
		
		return false;
	}
	
	/**
     * <p>更新用户登录信息</p>
     *
     * @param  user  待更新用户
     */
	@Transactional
	private void updateLoginInfo(User user) {
		mapper.updateLoginInfo(user);
	}

	@Override
	@Transactional(readOnly = true)
	public int getTotal() {
		return mapper.getTotal();
	}

	@Override
	public void saveUser(User user) throws DuplicateLoginNameException {
		if (user != null) {
			if (StringUtils.isNotBlank(user.getPassword())) {
				user.setPassword(Md5Utils.hash(user.getPassword()));
			}
			if (user.getState() == null) {
				user.setState(UserState.NORMAL);
			}
			
			if (user.getUserId() == null) {
				if (mapper.findByLoginName(user.getLoginName()) != null) {
					throw new DuplicateLoginNameException("用户名已存在！");
				}
				mapper.save(user);
			} else {
				mapper.update(user);
				mapper.deleteUserRole(user.getUserId());
			}
			saveUserRole(user);
		}
		
	}

	@Override
	public void saveUserRole(User user) {
		if (user.getRoleIds() != null && user.getRoleIds().length > 0) {
			UserRole userRole = new UserRole();
			for (Long roleId : user.getRoleIds()) {
				userRole.setUserId(user.getUserId());
				userRole.setRoleId(roleId);
				mapper.saveUserRole(userRole);
			}
		}
	}

	@Override
	@Transactional(readOnly = true)
	public List<Role> queryRole(Long userId) {
		return mapper.queryRole(userId);
	}

	@Override
	public void deleteUser(Long[] userId) {
		if (userId != null && userId.length > 0) {
			for (Long id : userId) {
				mapper.deleteUserRole(id);
				mapper.delete(id); // 逻辑删除
			}
		}
	}

	@Override
	public void forbid(Long[] userId) {
		if (userId != null && userId.length > 0) {
			for (Long id : userId) {
				mapper.forbid(id);
			}
		}
	}

}
