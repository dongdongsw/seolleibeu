package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PayController {
	@GetMapping("/pay_done")
	public String pay_done(Model model)
	{
		return "pay/pay_done";
	}
}
