package com.sist.web.mypage.controller;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.web.mypage.service.MypageService;
import com.sist.web.vo.UsersVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MypageController {
	private final MypageService mService;
	// 내 정보
	@GetMapping("/mypage/my_info")
	public String mypage_info(Model model) {
	      
		model.addAttribute("my_jsp" ,"../mypage/my_info.jsp");
		return "mypage/my_main";
	}
	   
	// 내 정보 수정
	@GetMapping("/mypage/my_update")
	public String mypage_update(Model model) {
		
		model.addAttribute("my_jsp" ,"../mypage/my_update.jsp");
		return "mypage/my_main";
	}
	
	// 비밀번호 체크
	@GetMapping("/mypage/mypagePwd")
	public String mypageEdit(HttpSession session) {

	    Boolean ok = (Boolean) session.getAttribute("MYPAGE_PWD_OK");

	    if (ok == null || !ok) {
	        return "redirect:/mypage/my_pwd_update";
	    }

	    return "mypage/my_update";
	}
	
	@GetMapping("/mypage/my_deleteModal")
	public String my_deleteModal(Model model) {
		
		model.addAttribute("my_jsp" ,"../mypage/my_deleteModal.jsp");
		return "mypage/my_main";
	}
	   
	// 북마크
	@GetMapping("/mypage/my_bookmark")
	public String mypage_my_bookmark(Model model) {
	      
		model.addAttribute("my_jsp" ,"../mypage/my_bookmark.jsp");
		return "mypage/my_main";
	}
	
	// 댓글
	@GetMapping("/mypage/my_reply")
	public String mypage_my_reply(Model model) {
	      
		model.addAttribute("my_jsp" ,"../mypage/my_reply.jsp");
		return "mypage/my_main";
	}
	
	// 내 정보 수정 비밀번호 입력
	@GetMapping("/mypage/my_pwd_update")
	public String mypage_my_pwd_update(Model model) {
	      
		model.addAttribute("my_jsp" ,"../mypage/my_pwd_update.jsp");
		return "mypage/my_main";
	}
	   
	// 회원 탈퇴 비밀번호 입력
	@GetMapping("/mypage/my_pwd_delete")
	public String mypage_my_pwd_delete(Model model) {
	      
		model.addAttribute("my_jsp" ,"../mypage/my_pwd_delete.jsp");
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
