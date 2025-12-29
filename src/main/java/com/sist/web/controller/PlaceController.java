package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PlaceController {
	
	@GetMapping("/place/culture_list")
	public String culture_list(Model model) {
		
		model.addAttribute("main_jsp", "../place/culture_list.jsp");
		return "main/main";
	}
	
	@GetMapping("/place/restaurant/list")
	public String place_restaurant_list(Model model) {
		
		model.addAttribute("main_jsp","../place/restaurant_list.jsp");
		return "main/main";
	}
	
	@GetMapping("/place/restaurant/detail")
	public String place_restaurant_detail(Model model) {
		
		model.addAttribute("main_jsp","../place/restaurant_detail.jsp");
		return "main/main";
	}
}
