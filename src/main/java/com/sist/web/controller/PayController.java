package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.web.pay.service.*;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PayController {
	private final PayService pservice;
	
	@GetMapping("/order")
	public String order()
	{
		return "pay/order";
	}
	
	@GetMapping("/fail")
	public String fail()
	{
		return "pay/fail";
	}
	
	@GetMapping("/success")
    public String success(@RequestParam String paymentKey, @RequestParam String orderId, @RequestParam Long amount) 
	{
        pservice.confirmPayment(paymentKey, orderId, amount);
        return "pay/success";
    }
}
