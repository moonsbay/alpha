package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mapper.DeptMapper;
import com.example.mapper.EmpMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/emp")
public class EmpController {
	
	@Autowired
	EmpMapper empMapper;      //DI(Dependency Injection)
	
	@Autowired
	DeptMapper deptMapper;
	
	@GetMapping("/list")
	void list(Integer deptno, String search, HttpServletRequest request) {
		
		System.out.println("deptno = " + deptno);
		System.out.println("search = " + search);
//		System.out.println(EmpController.class.getName()+".list()...");
		
		var list = empMapper.selectBySearch(deptno, search);
		

		request.setAttribute("list", list);
	    
		var depts = deptMapper.selectAll();
		request.setAttribute("depts", depts);
	}
}
