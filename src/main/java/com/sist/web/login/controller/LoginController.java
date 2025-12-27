package com.sist.web.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class LoginController {

	@GetMapping("/login")
	public String auth_login(Model model) {
		
		model.addAttribute("auth_jsp","../auth/login.jsp");
		return "auth/auth_main";
	}
	
	@GetMapping("/register")
	public String auth_register(Model model) {
		
		model.addAttribute("auth_jsp","../auth/register.jsp");
		return "auth/auth_main";
	}
	
	@GetMapping("/find_id")
	public String auth_find_id(Model model) {
		
		model.addAttribute("auth_jsp","../auth/find_id.jsp");
		return "auth/auth_main";
	}
	
	@GetMapping("/find_pwd")
	public String auth_find_pwd(Model model) {
		
		model.addAttribute("auth_jsp","../auth/find_pwd.jsp");
		return "auth/auth_main";
	}
}
