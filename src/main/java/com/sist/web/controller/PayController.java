package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PayController {
	@GetMapping("/order")
	public String order()
	{
		return "pay/order";
	}
	
	@GetMapping("/success")
	public String success()
	{
		return "pay/success";
	}
	
	@GetMapping("/fail")
	public String fail()
	{
		return "pay/fail";
	}
}
