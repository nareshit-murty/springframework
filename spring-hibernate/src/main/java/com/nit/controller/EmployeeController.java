package com.nit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nit.dao.EmployeeDao;
import com.nit.entity.Employee;

import javax.servlet.http.HttpServletRequest;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeDao employeeDao;
	
	@RequestMapping("/getAllEmployees")
	public String getAllEmployees(Model model){
		List<Employee> emps = employeeDao.getAllEmployees();
		model.addAttribute("emps", emps);
		return "show_employees";
	}
	
	@RequestMapping("/saveEmployee")
	public String saveEmployee(@Validated Employee emp, BindingResult result){
		if (result.hasErrors())
			return "add_employee";
		employeeDao.saveEmployee(emp);
		return "redirect:/getAllEmployees";
	}
	
	@RequestMapping("/updateEmployee")
	public String updateEmployee(@Validated Employee emp, BindingResult result){
		if (result.hasErrors())
			return "update_employee";
		employeeDao.updateEmployee(emp);
		return "redirect:/getAllEmployees";
	}
	
	@RequestMapping("/addEmployee")
	public String addEmployee(Model model){	
		model.addAttribute(new Employee());
		return "add_employee";
	}
	
	@RequestMapping("/deleteEmployee")
	public String deleteEmployee(HttpServletRequest request){	
		String id = request.getParameter("emp_id");
		employeeDao.deleteEmployee(Long.valueOf(id));
		return "redirect:/getAllEmployees";
	}
	
	
	@RequestMapping("/editEmployee")
	public String editEmployee(HttpServletRequest request, Model model){	
		String id = request.getParameter("emp_id");
		Employee emp = employeeDao.getEmployee(Long.valueOf(id));
		model.addAttribute(emp);
		return "update_employee";
	}
	
	
	
	
	
	
	
	
	
	
	
}
