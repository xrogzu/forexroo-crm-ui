package cn.ermei.admui.mapper;

import java.util.List;

import cn.ermei.admui.entity.Employee;
import cn.ermei.admui.vo.EmployeeVo;

/** 
 * EmployeeMapper
 * @author dk
 */
public interface EmployeeMapper extends BaseMapper<Employee> {

	Integer getTotal();
	
	Integer getCount(EmployeeVo employee);
	
	List<Employee> query(EmployeeVo employee);
}
