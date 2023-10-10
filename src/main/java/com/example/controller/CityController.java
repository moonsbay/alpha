package com.example.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mapper.CityMapper;
import com.example.model.City;

import lombok.extern.slf4j.Slf4j;

@Slf4j                    //로그처리 위함 밑의 logger log = ~~~ 수동기입라인 대체
@Controller
@RequestMapping("/city")
public class CityController {
	
	@Autowired
	CityMapper mapper;      //DI - 의존 주입
	
//	static Logger log = LoggerFactory.getLogger(CityController.class);  //로그형식으로 메세지 출력을 위함
//	@GetMapping("/list")
	String list2(String code, Model model) { //IoC (Inverse Of Control) - 제어의 역전
		System.out.println("list...");
		log.info("list...");
		
		List<City> list = null;
		if(code == null || code.trim().equals(""))
		   list = mapper.selectAll();
		else
		   list = mapper.selectAllByCode(code);
		
//		mapper.selectAllByCode(code);
		
		model.addAttribute("list", list);
		
		var codes = mapper.selectCountryCodes();
		model.addAttribute("codes", codes);
		
		return "city/list3";    //여기를 바꾸면서. list, list2... 테스트함.. list메서드가 void리턴일때는  이 행이 필요없고 list만 실행가능했음
	}
	
	@GetMapping("/list")
	String list(String code, Long population, Model model) { //IoC (Inverse Of Control) - 제어의 역전..Long을 long으로 했을 때 에러발생
//		System.out.println("list...");
		log.info("list...");
		
		var list = mapper.searchAll(code, population);
		
		model.addAttribute("list", list);
		
		var codes = mapper.selectCountryCodes();
		model.addAttribute("codes", codes);
		
		return "city/list3";    //여기를 바꾸면서. list, list2... 테스트함.. list메서드가 void리턴일때는  이 행이 필요없고 list만 실행가능했음
	}
}
