package com.sist.web.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	   @GetMapping("/mypage/my_info")
	   public String mypage_myInfo(Model model) {
	      
	      model.addAttribute("main_jsp" ,"../mypage/my_info.jsp");
	      return "main/main";
	   }
	   
	   @GetMapping("/mypage/my_bookmark")
	   public String mypage_my_bookmark(Model model) {
	      
	      model.addAttribute("main_jsp" ,"../mypage/my_bookmark.jsp");
	      return "main/main";
	   }
	   
	   @GetMapping("/mypage/my_reply")
	   public String mypage_my_reply(Model model) {
	      
	      model.addAttribute("main_jsp" ,"../mypage/my_reply.jsp");
	      return "main/main";
	   }
	   
	   @GetMapping("/mypage/my_pwd_update")
	   public String mypage_my_pwd_update(Model model) {
	      
	      model.addAttribute("main_jsp" ,"../mypage/my_pwd_update.jsp");
	      return "main/main";
	   }
	   
	   @GetMapping("/mypage/my_update")
	   public String mypage_my_update(Model model) {
	      
	      model.addAttribute("main_jsp" ,"../mypage/my_update.jsp");
	      return "main/main";
	   }
	   
	   @GetMapping("/mypage/my_pwd_delete")
	   public String mypage_my_pwd_delete(Model model) {
	      
	      model.addAttribute("main_jsp" ,"../mypage/my_pwd_delete.jsp");
	      return "main/main";
	   }
	   
}
