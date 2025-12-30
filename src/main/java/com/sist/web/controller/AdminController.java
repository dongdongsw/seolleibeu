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
	// 장소
	@GetMapping("/admin/place_list")
	public String place_list(Model model)
	{
		model.addAttribute("main_jsp", "place_list.jsp");
		return "admin/main";
	}
	@GetMapping("/admin/place_create")
	public String place_create(Model model)
	{
		model.addAttribute("main_jsp", "place_create.jsp");
		return "admin/main";
	}
	// 코스
	@GetMapping("/admin/course_list")
	public String course_list(Model model)
	{
		model.addAttribute("main_jsp", "course_list.jsp");
		return "admin/main";
	}
	// 사용자
	@GetMapping("/admin/users_list")
	public String users_create(Model model)
	{
		model.addAttribute("main_jsp", "users_list.jsp");
		return "admin/main";
	}
	// 공지사항
	@GetMapping("/admin/notice")
	public String notice(Model model)
	{
		model.addAttribute("main_jsp", "notice.jsp");
		return "admin/main";
	}
	@GetMapping("/admin/notice_create")
	public String notice_create(Model model)
	{
		model.addAttribute("main_jsp", "notice_create.jsp");
		return "admin/main";
	}
	@GetMapping("/admin/notice_update")
	public String notice_update(Model model)
	{
		model.addAttribute("main_jsp", "notice_update.jsp");
		return "admin/main";
	}
	@GetMapping("/admin/notice_detail")
	public String notice_detail(Model model)
	{
		model.addAttribute("main_jsp", "notice_detail.jsp");
		return "admin/main";
	}
	// 환불
	@GetMapping("/admin/refund")
	public String refund(Model model)
	{
		model.addAttribute("main_jsp", "refund.jsp");
		return "admin/main";
	}
}
