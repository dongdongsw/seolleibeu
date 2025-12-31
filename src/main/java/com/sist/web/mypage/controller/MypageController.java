package com.sist.web.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	@GetMapping("/mypage/my_info")
	   public String mypage_info(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/my_info.jsp");
	      
	      return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/my_update")
	   public String mypage_update(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/my_update.jsp");
	      return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/my_bookmark")
	   public String mypage_my_bookmark(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/my_bookmark.jsp");
	      return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/my_reply")
	   public String mypage_my_reply(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/my_reply.jsp");
	      return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/my_pwd_update")
	   public String mypage_my_pwd_update(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/my_pwd_update.jsp");
	      return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/my_pwd_delete")
	   public String mypage_my_pwd_delete(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/my_pwd_delete.jsp");
	      return "mypage/my_main";
	   }
	   // 내가 쓴 리뷰
	   @GetMapping("/mypage/my_review")
	   public String my_review(Model model)
	   {
		   model.addAttribute("my_jsp", "../mypage/my_review.jsp");
		   return "mypage/my_main";
	   }
	   // 환불 내역
	   @GetMapping("/mypage/my_refund")
	   public String my_refund(Model model)
	   {
		   model.addAttribute("my_jsp", "../mypage/my_refund.jsp");
		   return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/my_course")
	   public String my_course(Model model)
	   {
		   model.addAttribute("my_jsp", "../mypage/my_course.jsp");
		   return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/my_favorite")
	   public String my_favorite(Model model)
	   {
		   model.addAttribute("my_jsp", "../mypage/my_favorite.jsp");
		   return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/my_reserve")
	   public String my_reserve(Model model)
	   {
		   model.addAttribute("my_jsp", "../mypage/my_reserve.jsp");
		   return "mypage/my_main";
	   }	   
}
