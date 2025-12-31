package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	@GetMapping("/notice/list")
	public String notice_list(Model model)
	{
		model.addAttribute("main_jsp", "../notice/list.jsp");
		return "main/main";
	}
	@GetMapping("/notice/detail")
	public String notice_detail(Model model)
	{
		model.addAttribute("main_jsp", "../notice/detail.jsp");
		return "main/main";
	}
}
