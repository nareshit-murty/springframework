package com.nit.entity;

import javax.validation.constraints.Max;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Employee {
	private Long id;
	@NotEmpty
	@Size(min = 5, max = 50)
	private String name;
	@NotEmpty
	@Size(max = 50)
	private String address;
	@Max(value = 20000)
	private Double salary;
	

	public Employee(String name, String address, Double salary) {
		this.name = name;
		this.address = address;
		this.salary = salary;
	}
	
}
