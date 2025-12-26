package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CourseController {
	
	@GetMapping("/course/create")
	public String course_detail() {
		return "course/create";
	}

	@GetMapping("/course/list")
	public String course_list(Model model) {
		
		model.addAttribute("main_jsp", "../course/list.jsp");
		return "main/main";
	}
	
	@GetMapping("/course/detail")
	public String course_detail(Model model) {
		
		model.addAttribute("main_jsp", "../course/detail.jsp");
		return "main/main";
	}
	
	
	
}
