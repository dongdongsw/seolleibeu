package com.sist.web.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReserveController {
	
	@GetMapping("/reserve/reserve_result")
	public String reserve_result(Model model) {
		model.addAttribute("main_jsp", "../reserve/reserve_result.jsp");
		
		return "main/main";
	}
	
	@GetMapping("/reserve/reserve_detail")
	public String reserve_detail(Model model) {
		model.addAttribute("main_jsp", "../reserve/reserve_detail.jsp");
		
		return "main/main";
	}
}