package cn.ermei.admui.service;

import java.util.List;

import cn.ermei.admui.entity.Employee;
import cn.ermei.admui.vo.EmployeeVo;

/** 
 * 员工Service
 * @author dk
 */
public interface EmployeeService extends BaseService<Employee>{
	
	Integer getTotal();
	
	Integer getCount(EmployeeVo employee);
	
	List<Employee> query(EmployeeVo employee);
	
}
