package com.sist.web.review.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	@GetMapping("/review_create")
	   public String review_create(Model model)
	   {
		   return "review/review_create";
	   }
	   
	   @GetMapping("/review_update")
	   public String review_update(Model model)
	   {
		   return "review/review_update";
	   }
}
