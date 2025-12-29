package com.sist.web.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	   @GetMapping("/mypage/info")
	   public String mypage_info(Model model) {
	      
	      model.addAttribute("main_jsp" ,"../mypage/info.jsp");
	      return "main/main";
	   }
	   
	   @GetMapping("/mypage/update")
	   public String mypage_update(Model model) {
	      
	      model.addAttribute("main_jsp" ,"../mypage/update.jsp");
	      return "main/main";
	   }
	   
	   @GetMapping("/mypage/my_bookmark")
	   public String mypage_my_bookmark(Model model) {
	      
	      model.addAttribute("main_jsp" ,"../mypage/bookmark.jsp");
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
	   
	   
	   
	   @GetMapping("/mypage/my_pwd_delete")
	   public String mypage_my_pwd_delete(Model model) {
	      
	      model.addAttribute("main_jsp" ,"../mypage/my_pwd_delete.jsp");
	      return "main/main";
	   }
	   
}
