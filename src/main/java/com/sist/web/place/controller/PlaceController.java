package com.sist.web.place.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class PlaceController {
	
	@GetMapping("/place/culture/list")
	public String place_culture_list(Model model) {
		
		model.addAttribute("main_jsp", "../place/culture_list.jsp");
		return "main/main";
	}
	
	@GetMapping("/place/culture/detail")
	public String place_culture_detail(Model model) {
		model.addAttribute("main_jsp", "../place/culture_detail_main.jsp");
		model.addAttribute("detailPage", "../place/culture_detail.jsp");
		model.addAttribute("reviewPage", "../place/place_review.jsp");
		return "main/main";
	}

	@GetMapping("/place/attraction/list")
	public String place_attraction_list(Model model) {
		
		model.addAttribute("main_jsp", "../place/attraction_list.jsp");
		return "main/main";
	}
	
	@GetMapping("/place/attraction/detail")
	public String place_attraction_detail(Model model) {
		
		model.addAttribute("main_jsp", "../place/attraction_detail_main.jsp");
		model.addAttribute("detailPage", "../place/attraction_detail.jsp");
		model.addAttribute("reviewPage", "../place/place_review.jsp");
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
		model.addAttribute("detailPage", "../place/restaurant_detail.jsp");
		model.addAttribute("fixedPage", "../place/restaurant_detail_header.jsp");
		return "main/main";
	}
	/*
	 * @GetMapping("/place/restaurant/review") public String
	 * place_restaurant_review(Model model) {
	 * 
	 * model.addAttribute("main_jsp","../place/restaurant_review.jsp");
	 * model.addAttribute("tab", "review"); return "main/main"; }
	 */
	
	// 최근 본 장소 (쿠키 생성)
	@GetMapping("/place/culture/detail_before")
	public String culture_before(@RequestParam("pno") int pno, HttpServletResponse response,
															RedirectAttributes ra) {
		
		Cookie cookie=new Cookie("place_culture_"+pno, "culture_"+String.valueOf(pno));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		return "redirect:/place/culture/detail?pno="+pno;
	}
	
	@GetMapping("/place/attraction/detail_before")
	public String attraction_before(@RequestParam("pno") int pno, HttpServletResponse response,
															RedirectAttributes ra) {
		
		Cookie cookie=new Cookie("place_attraction_"+pno, "attraction_"+String.valueOf(pno));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		return "redirect:/place/attraction/detail?pno="+pno;
	}
	
	@GetMapping("/place/restaurant/detail_before")
	
	public String restaurant_before(@RequestParam("pno") int pno, HttpServletResponse response,
															RedirectAttributes ra) {
		
		Cookie cookie=new Cookie("place_restaurant_"+pno, "restaurant_"+String.valueOf(pno));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		return "redirect:/place/restaurant/detail?pno="+pno;
	}
}
