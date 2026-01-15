package com.sist.web.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
public class PayController {
	@GetMapping("/pay/success")
	public String pay_success(@RequestParam("paymentKey") String paymentKey, @RequestParam("orderId") String orderId, @RequestParam("totalAmount") int totalAmount,@RequestParam("rvno") int rvno, Model model)
	{
		model.addAttribute("paymentKey", paymentKey);
		model.addAttribute("orderId", orderId);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("rvno", rvno);
		return "pay/success";
	}
}
