package cn.ermei.admui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.ermei.admui.entity.Employee;
import cn.ermei.admui.mapper.BaseMapper;
import cn.ermei.admui.mapper.EmployeeMapper;
import cn.ermei.admui.service.EmployeeService;
import cn.ermei.admui.vo.EmployeeVo;

/**
 * 员工Service实现
 * @author dk
 */

@Service
@Transactional
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements EmployeeService {

	@Autowired
	private EmployeeMapper mapper;
	
	@Override
	protected BaseMapper<Employee> getMapper() {
		return mapper;
	}

	@Override
	public Integer getTotal() {
		return mapper.getTotal();
	}

	@Override
	public List<Employee> query(EmployeeVo employee) {
		return mapper.query(employee);
	}

	@Override
	public Integer getCount(EmployeeVo employee) {
		return mapper.getCount(employee);
	}

}
