package com.sist.web.course.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.web.course.service.CourseService;
import com.sist.web.vo.CourseVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CourseController {
	
	private final CourseService cService;
	
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
	public String course_detail(@RequestParam("cno") int cno, Model model) {
		
		CourseVO vo=cService.courseDetailData(cno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../course/detail.jsp");
		return "main/main";
	}
	
	
	
}