package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PayController {
	@GetMapping("/pay_done")
	public String pay_done()
	{
		return "pay/pay_done";
	}
	@GetMapping("/order")
	public String order()
	{
		return "pay/order";
	}
}
