package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.CountryMapper;
import com.example.model.Country;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/country")
public class CountryController {
	
	@Autowired
	CountryMapper mapper;
	
	@GetMapping("/list")
	void list(String continent, String region, Model model) {
		log.info("list()...");
		
		List<Country> list = null;
		if(continent == null || continent.trim().equals(""))
	       list = mapper.selectAll();
		else {
			
			if(region == null || region.trim().equals(""))
		      list = mapper.selectAllByContinent(continent);
			else
			  list = mapper.selectAllByContinentAndRegion(continent, region);	
		}
		model.addAttribute("list", list);
		
//		String[] continents = {"java", "python", "javascript"};
		var continents = mapper.selectContinents();
		model.addAttribute("continents", continents);
		
//		var regions = mapper.selectRegions(continent);
//		model.addAttribute("regions", regions);
		
	}
	
	@GetMapping("/regions")
	@ResponseBody
	List<String> getRegions(String continent){
		var regions = mapper.selectRegions(continent);
/*		var regions = new ArrayList<String>();
		regions.add("java");
		regions.add("python");
		regions.add("c/c++");
		regions.add("html");  
		regions.add(continent); */
		return regions;
		
	}
	
	
}
