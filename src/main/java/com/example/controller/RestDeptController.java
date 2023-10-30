package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.DeptMapper;
import com.example.model.Dept;

@Controller
@RequestMapping("/rest/dept")
public class RestDeptController {
	
	@Autowired
	DeptMapper mapper;
	
	@GetMapping(headers = {"Accept=text/html"})  // GetMapping을 두개 사용 가능하도록 헤더조건추가..@ResponseBody 가 없으므로 view로 리저브 됨
	void view() {                                
	
		
	}
	
	
	
	@GetMapping
	@ResponseBody     //이게 있어야 view로 리저브되지 않고 바로 json문자열형태로 바로리턴해준다  
//	List<Dept> get(){
    ResponseEntity<Object> get(){            //get()이런게 Rest API
		System.out.println("get()...");
		var list = mapper.selectAll();
		var body = new HashMap<String, Object>();
		body.put("result", "success");
		body.put("data", list);
		
		return new ResponseEntity<Object>(body, HttpStatus.OK);
//		return list;
	}
	
	@PostMapping
	@ResponseBody
	ResponseEntity<Object> post(@RequestBody Dept dept){
				
		ResponseEntity<Object> response = null;
		var body = new HashMap<String, Object>();
		
		try {
			mapper.insert(dept);
			body.put("result", "success");
			body.put("data", dept);
			response = new ResponseEntity<Object>(body, HttpStatus.OK);
		} catch (DuplicateKeyException e) {
			body.put("result", "error");
			body.put("message", "존재하는 부서입니다");
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		} catch (Exception e) {
			body.put("result", "error");
			body.put("message", "e.getMessage()");
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return response;
	}
	
	@PutMapping
	@ResponseBody
	ResponseEntity<Object> put(@RequestBody Dept dept){
		ResponseEntity<Object> response = null;
		var body = new HashMap<String, Object>();
		
		try {
			mapper.update(dept);
			body.put("result", "success");
			body.put("data", dept);
			response = new ResponseEntity<Object>(body, HttpStatus.OK);
		} catch(Exception e) {
			body.put("result", "error");
			body.put("message", "e.getMessage()");
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return response;
	}	
		
	@DeleteMapping
	@ResponseBody
	ResponseEntity<Object> delete(@RequestBody Dept dept){
		ResponseEntity<Object> response = null;
		var body = new HashMap<String, Object>();
			
		try {
			mapper.delete(dept);
			body.put("result", "success");
			body.put("data", dept);
			response = new ResponseEntity<Object>(body, HttpStatus.OK);
		} catch(DataIntegrityViolationException e) {
			body.put("result", "error");
			body.put("message", "사원이 소속된 부서는 삭제할 수 없습니다");
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		
		} catch(Exception e) {
			e.printStackTrace();
			body.put("result", "error");
			body.put("message", e.getClass());
			body.put("message2", "e.getMessage()");
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return response;
	}
	
	
	
	
	
	
	
	
	
	
}
