package cn.ermei.admui.service;

import java.util.List;
import java.util.Map;

import cn.ermei.admui.entity.Menu;
import cn.ermei.admui.entity.Role;
import cn.ermei.admui.entity.User;
import cn.ermei.admui.exception.InitMenuException;

/**
 * 菜单Service
 * @author dk
 */
public interface MenuService extends BaseService<Menu> {

	/**
     * <p>获取用户所有菜单，菜单有层级关系(menu may has menus)</p>
     *
     * @param   user  要获取菜单的用户
     * @return  菜单集合
     * @throws  InitMenuException  用户未授权任何菜单
     */
	List<Menu> queryHierarchical(User user) throws InitMenuException;
	
	/**
     * <p>获取角色所有菜单，菜单有层级关系(menu may has menus)</p>
     *
     * @param   role  要获取菜单的用户
     * @return  菜单集合
     * @throws  InitMenuException  角色未授权任何菜单
     */
	List<Menu> queryHierarchical(Role role) throws InitMenuException;
	
	/**
     * <p>获取用户所有菜单，菜单没有层级关系(menu does not has menus)</p>
     *
     * @param   user  要获取菜单的用户
     * @return  菜单集合
     * @throws  InitMenuException  用户未授权任何菜单或菜单layer不符合规则
     * 		   
     */
	List<Menu> query(User user) throws InitMenuException;
	
	/**
     * <p>批量保存菜单</p>
     *
     * @param   menuList  有层级关系的菜单集合
     * @param   user      操作用户		   
     */
	void saveAll(List<Menu> menuList, User user);
	
	/**
     * <p>生成顶部菜单的layer</p>
     * 
     * @return  layer str
     */
	String generateFirstLayer();
	
	/**
     * <p>组装url为key，menu为value的map</p>
     *
     * @param   menuList  待组装的菜单集合
     * @return  组装后的map
     * 		   
     */
	Map<String, Menu> buildMenuMap(List<Menu> menuList);
	
	/**
     * <p>删除顶部菜单</p>
     *
     * @param   menu  要删除的菜单
     * 		   
     */
	void deleteMenu(Menu menu);
	
	/**
     * <p>更改顶部菜单顺序</p>
     *
     * @param   topMenus  顶部菜单集合
     * 		   
     */
	void updateTopOrder(List<Menu> topMenus);
	
	/**
     * <p>查询所有顶部菜单</p>
     *
     * @return  顶部菜单集合
     * 		   
     */
	List<Menu> queryTop();
	
	/**
     * <p>根据顶部菜单查询它及其所有子菜单id集合</p>
     *
     * @param   topMenu  待查询顶部菜单
     * @return  顶部菜单及其子菜单id集合
     * 		   
     */
	List<Long> queryTopChildrenIds(Menu topMenu);
}
