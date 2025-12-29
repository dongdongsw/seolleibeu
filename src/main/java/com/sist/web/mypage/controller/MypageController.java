package com.sist.web.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	   @GetMapping("/mypage/info")
	   public String mypage_info(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/info.jsp");
	      
	      return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/update")
	   public String mypage_update(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/update.jsp");
	      return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/bookmark")
	   public String mypage_my_bookmark(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/bookmark.jsp");
	      return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/reply")
	   public String mypage_my_reply(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/reply.jsp");
	      return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/pwd_update")
	   public String mypage_my_pwd_update(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/pwd_update.jsp");
	      return "mypage/my_main";
	   }
	   
	   @GetMapping("/mypage/pwd_delete")
	   public String mypage_my_pwd_delete(Model model) {
	      
	      model.addAttribute("my_jsp" ,"../mypage/pwd_delete.jsp");
	      return "mypage/my_main";
	   }
}
