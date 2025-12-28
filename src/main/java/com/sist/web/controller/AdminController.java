package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class AdminController {
	@GetMapping("/admin")
	public String admin_main(Model model)
	{
		model.addAttribute("main_jsp", "home.jsp");
		return "admin/main";
	}
	@GetMapping("/admin/place_list")
	public String place_list(Model model)
	{
		model.addAttribute("main_jsp", "place_list.jsp");
		return "admin/main";
	}
	@GetMapping("/admin/users_list")
	public String place_create(Model model)
	{
		model.addAttribute("main_jsp", "users_list.jsp");
		return "admin/main";
	}
	@GetMapping("/admin/notice")
	public String notice(Model model)
	{
		model.addAttribute("main_jsp", "notice.jsp");
		return "admin/main";
	}
}
