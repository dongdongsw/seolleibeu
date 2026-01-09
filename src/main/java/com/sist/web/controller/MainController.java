package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

import java.util.*;

import com.sist.web.vo.*;
import com.sist.web.mainpage.service.*;

@Controller
@RequiredArgsConstructor
public class MainController {
	private final MainpageService mService;
	
	@GetMapping("/")
	public String main(Model model) {
		List<CourseVO> b4List = mService.courseBest4();
		List<CourseVO> n4List = mService.courseNew4();
		
		model.addAttribute("b4List", b4List);
		model.addAttribute("n4List", n4List);
		
		model.addAttribute("main_jsp", "../main/home.jsp");
		
		return "main/main";
	}
}
