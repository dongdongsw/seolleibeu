package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PlaceController {
	
	@GetMapping("/place/culture/list")
	public String place_culture_list(Model model) {
		
		model.addAttribute("main_jsp", "../place/culture_list.jsp");
		return "main/main";
	}
	
	@GetMapping("/place/culture/detail")
	public String place_culture_detail(Model model) {
		
		model.addAttribute("main_jsp","../place/culture_detail.jsp");
		return "main/main";
	}

	@GetMapping("/place/attraction/list")
	public String place_attraction_list(Model model) {
		
		model.addAttribute("main_jsp", "../place/attraction_list.jsp");
		return "main/main";
	}
	
	@GetMapping("/place/attraction/detail")
	public String place_attraction_detail(Model model) {
		
		model.addAttribute("main_jsp","../place/attraction_detail.jsp");
		return "main/main";
	}
	
	@GetMapping("/place/restaurant/list")
	public String place_restaurant_list(Model model) {
		
		model.addAttribute("main_jsp","../place/restaurant_list.jsp");
		return "main/main";
	}
	
	@GetMapping("/place/restaurant/detail")
	public String place_restaurant_detail(Model model) {
		
		model.addAttribute("main_jsp","../place/restaurant_detail_main.jsp");
		model.addAttribute("restaurant_jsp","../place/restaurant_detail.jsp");
		model.addAttribute("tab", "detail");
		return "main/main";
	}
	@GetMapping("/place/restaurant/review")
	public String place_restaurant_review(Model model) {

		model.addAttribute("main_jsp","../place/restaurant_detail_main.jsp");
		model.addAttribute("restaurant_jsp","../place/restaurant_review.jsp");
		model.addAttribute("tab", "review");
		return "main/main";
	}
}
