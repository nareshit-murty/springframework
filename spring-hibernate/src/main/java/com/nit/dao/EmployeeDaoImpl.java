package com.nit.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.nit.entity.Employee;

public class EmployeeDaoImpl extends HibernateDaoSupport implements EmployeeDao{

	@Override
	@Transactional(rollbackForClassName = {"java.lang.Exception"})
	public void saveEmployee(Employee emp){
		getHibernateTemplate().save(emp);
	}

	@Override
	@Transactional(rollbackForClassName = {"java.lang.Exception"})
	public void updateEmployee(Employee emp) {
		getHibernateTemplate().update(emp);
	}

	@Override
	@Transactional(rollbackForClassName = {"java.lang.Exception"})
	public void deleteEmployee(Long id) {
		Employee emp = getEmployee(id);
		getHibernateTemplate().delete(emp);
	}

	@Override
	public Employee getEmployee(Long id) {
		Employee emp = getHibernateTemplate().get(Employee.class, id);
		return emp;
	}

	@Override
	public List<Employee> getAllEmployees() {
		return getHibernateTemplate().loadAll(Employee.class);
	}

}
