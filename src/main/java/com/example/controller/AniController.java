package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.util.Alpha;
import com.example.util.Color;

import lombok.extern.slf4j.Slf4j;

@Slf4j

@RequestMapping("/ani")
@Controller
public class AniController {
	@GetMapping("/fill")
	void fill(Model model) {
		log.info("fill()...");
		
		Alpha[][] alphas = new Alpha[20][40];
		for(var i=0; i<alphas.length; i++) {
			for(var j=0; j<alphas[i].length; j++) {
				alphas[i][j] = new Alpha();
				alphas[i][j].setFg(Color.Black);
				alphas[i][j].setBg(Color.Black);
			}
		}
		model.addAttribute("surface", alphas); //view로 전달하기 위한 것. 모델을 이용
	}
	
	@GetMapping("/race")
	void race(Model model) {
//		ArrayList<ArrayList<Alpha>> alphas = new ArrayList<ArrayList<Alpha>>(); 
//      밑의 문장과 같은것 var쓰면 new뒤에 형식이 있으므로 알아서 인식 ArrayList를 이중으로 쓴 것은 2차원배열을 표현하기위해..
//		var alphas = new ArrayList<ArrayList<Alpha>>();
//		for(var i=0; i<20; i++) {
//			alphas.add(new ArrayList<Alpha>());
//			for(var j=0; j<40; j++) {
//				alphas.get(i).add(new Alpha());
//				
////				alphas.set(i).setFg(Color.Black);
////				alphas[i][j].setBg(Color.Black);
//			}
//		}
//		model.addAttribute("surface", alphas); //view로 전달하기 위한 것. 모델을 이용
	}
	
	@GetMapping("/cross")
	void cross(Model model) {
		var alphas = new HashMap<Integer, ArrayList<Alpha>>();
		for(var i=0; i<20; i++) {
			alphas.put(i,  new ArrayList<Alpha>());
			for(var j=0; j<40; j++) {
				alphas.get(i).add(new Alpha());
			}
		}
		model.addAttribute("surface", alphas);
		
	}
	
	@GetMapping("/zigzag")
	void zigzag(Model model) {
		var alphas = new HashSet<ArrayList<Alpha>>();
		for(var i=0; i<20; i++) {
			var list = new ArrayList<Alpha>();
			for(var j=0; j<40; j++) {
				list.add(new Alpha());
			}
			alphas.add(list);
		}
//		System.out.println("alphas.size = " + alphas.size());
//		for(var list : alphas)
//			System.out.println(list);
		
		model.addAttribute("surface", alphas);
	}
	
	
	@GetMapping("/data")
	@ResponseBody   //REST API
	Alpha data() {
		return new Alpha();
	}
}
