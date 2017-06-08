package cn.ermei.admui.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ermei.admui.entity.Employee;
import cn.ermei.admui.service.EmployeeService;
import cn.ermei.admui.vo.EmployeeVo;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/employee")
public class EmployeeController extends BaseController {

	Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/all", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String all(EmployeeVo employeeVo) {
		
		warpEmployeeVo(employeeVo);
		
		// custom-vars 自定义http变量
		System.out.println(request.getParameter("myKey"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Integer total = employeeService.getTotal();
		Integer count = employeeService.getCount(employeeVo);
		List<Employee> employeeList = employeeService.query(employeeVo);
		List<List<String>> dataList = new ArrayList<List<String>>();
		List<String> itemList = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		
		for (Employee employee : employeeList) {
			itemList = new ArrayList<String>();
			itemList.add(employee.getName());
			itemList.add(employee.getTitle());
			itemList.add(employee.getBase());
			itemList.add(employee.getAge() + "");
			itemList.add(formatter.format(employee.getHireDate()));
			itemList.add("&yen;" + employee.getSalary());
			dataList.add(itemList);
		}
		
		resultMap.put("recordsTotal", total);
		resultMap.put("recordsFiltered", count);
		resultMap.put("data", dataList);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String str = null;
		try {
			str = objectMapper.writeValueAsString(resultMap);
		} catch (JsonProcessingException e) {
		}
		
		// jsonp
		if (StringUtils.isNotBlank(request.getParameter("callback"))) {
			str = request.getParameter("callback") + "(" + str + ");";
		}
		
		return str;
	}
	
	@RequestMapping(value = "/all/post", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> allPost(EmployeeVo employeeVo) {
		
		warpEmployeeVo(employeeVo);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		List<Employee> employeeList = employeeService.query(employeeVo);
		Integer total = employeeService.getTotal();
		Integer count = employeeService.getCount(employeeVo);
		
		jsonMap.put("recordsTotal", total);
		jsonMap.put("recordsFiltered", count);
		jsonMap.put("data", employeeList);
		
		return jsonMap;
	}
	
	@RequestMapping(value = "/all/get", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> allGet(EmployeeVo employeeVo) {
		
		warpEmployeeVo(employeeVo);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		List<Employee> employeeList = employeeService.query(employeeVo);
		Integer total = employeeService.getTotal();
		Integer count = employeeService.getCount(employeeVo);
		
		jsonMap.put("draw", 0);
		jsonMap.put("recordsTotal", total);
		jsonMap.put("recordsFiltered", count);
		jsonMap.put("data", employeeList);
		
		return jsonMap;
	}
	
	@RequestMapping(value = "/query", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> query(EmployeeVo employeeVo) {
		
		warpEmployeeVo(employeeVo);
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		List<Employee> employeeList = employeeService.query(employeeVo);
		Integer total = employeeService.getTotal();
		Integer count = employeeService.getCount(employeeVo);
		
		jsonMap.put("recordsTotal", total);
		jsonMap.put("recordsFiltered", count);
		jsonMap.put("data", employeeList);
		
		return jsonMap;
	}
	
	private void warpEmployeeVo(EmployeeVo employeeVo) {
		
		if (StringUtils.isNotEmpty(request.getParameter("search[value]"))) {
			employeeVo.setSearchValue("%" + request.getParameter("search[value]") + "%");
		}
		
		String orderColumnNum = request.getParameter("order[0][column]");
		if (StringUtils.isNotBlank(orderColumnNum)) {
			switch (Integer.parseInt(orderColumnNum)) {
				case 0:
					employeeVo.setOrderColumn("name");
					break;
				case 1:
					employeeVo.setOrderColumn("title");
					break;
				case 2:
					employeeVo.setOrderColumn("base");
					break;
				case 3:
					employeeVo.setOrderColumn("age");
					break;
				case 4:
					employeeVo.setOrderColumn("hire_date");
					break;
				case 5: 
					employeeVo.setOrderColumn("salary");
					break;
				default:
					employeeVo.setOrderColumn("name");
					break;
			}
		} else {
			employeeVo.setOrderColumn("name");
		}
		
		if (StringUtils.isNotBlank(request.getParameter("order[0][dir]"))) {
			employeeVo.setOrderDir(request.getParameter("order[0][dir]"));
		}
	}
}
