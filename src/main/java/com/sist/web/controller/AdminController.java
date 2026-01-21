package com.sist.web.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.web.commons.*;

@Controller
public class AdminController {
	@GetMapping("/admin")
	public String admin_main(Model model)
	{
		model.addAttribute("main_jsp", "home.jsp");
		return "admin/main";
	}
	// 장소
	@GetMapping("/admin/culture_list")
	public String culture_list(Model model)
	{
		model.addAttribute("main_jsp", "culture_list.jsp");
		return "admin/main";
	}
	@GetMapping("/admin/food_list")
	public String food_list(Model model)
	{
		model.addAttribute("main_jsp", "food_list.jsp");
		return "admin/main";
	}
	
	// 문화체험, 관광명소 장소 생성
	@GetMapping("/admin/culture_create")
	public String culture_create(Model model)
	{
		model.addAttribute("main_jsp", "culture_create.jsp");
		return "admin/main";
	}
	
	// 식당 장소 생성
	@GetMapping("/admin/restaurant_create")
	public String place_create(Model model)
	{
		model.addAttribute("main_jsp", "restaurant_create.jsp");
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
	public String notice_update(@RequestParam("n_id") int n_id, Model model)
	{
		model.addAttribute("n_id", n_id);
		model.addAttribute("main_jsp", "notice_update.jsp");
		return "admin/main";
	}
	@GetMapping("/admin/notice_detail")
	public String notice_detail(@RequestParam("n_id") int n_id, Model model)
	{
		model.addAttribute("n_id", n_id);
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
