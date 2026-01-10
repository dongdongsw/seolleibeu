package com.sist.web.login.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.web.login.service.LoginService;
import com.sist.web.vo.UsersVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/auth")
public class LoginController {

	private final LoginService lService;
	private final BCryptPasswordEncoder Encoder;
	
	@RequestMapping("/login")
	public String auth_login(Model model) {
		
		model.addAttribute("auth_jsp","../auth/login.jsp");
		return "auth/auth_main";
	}
	
	@GetMapping("/register")
	public String auth_register(Model model) {
		
		model.addAttribute("auth_jsp","../auth/register.jsp");
		return "auth/auth_main";
	}
	
	@PostMapping("/register_ok")
	public String auth_register_ok(@ModelAttribute("vo") UsersVO vo ) {
		
		vo.setPwd(Encoder.encode(vo.getPwd()));
		
		System.out.println(vo);
		
		lService.registerInsert(vo);
		return "redirect:/";
		
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
