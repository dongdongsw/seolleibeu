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
	public String mypage_info(HttpSession session,Model model) {
		Integer uno = (Integer) session.getAttribute("uno");
	    if (uno == null) return "redirect:/login";

	    UsersVO vo = mService.mypageData(uno);
	    
	    String phoneFormatted = "";
	    if (vo != null && vo.getPhone() != null && vo.getPhone().length() == 11) {
	        String p = vo.getPhone();
	        phoneFormatted =
	            p.substring(0,3) + "-" +
	            p.substring(3,7) + "-" +
	            p.substring(7,11);
	    }

	    String createdAtFormatted = "";
	    if (vo != null && vo.getCreated_at() != null) {
	        createdAtFormatted =
	            new SimpleDateFormat("yyyy-MM-dd")
	                .format(vo.getCreated_at());
	    }

	    String updatedAtFormatted = "없음";
	    if (vo != null && vo.getUpdated_at() != null) {
	        updatedAtFormatted =
	            new SimpleDateFormat("yyyy-MM-dd")
	                .format(vo.getUpdated_at());
	    }

	    model.addAttribute("vo", vo);
	    model.addAttribute("phoneFormatted", phoneFormatted);
	    model.addAttribute("createdAtFormatted", createdAtFormatted);
	    model.addAttribute("updatedAtFormatted", updatedAtFormatted);
		model.addAttribute("my_jsp" ,"../mypage/my_info.jsp");
		return "mypage/my_main";
	}
	   
	// 내 정보 수정
	@GetMapping("/mypage/my_update")
	public String mypage_update(Model model) {
		
		model.addAttribute("my_jsp" ,"../mypage/my_update.jsp");
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
	   
	   @GetMapping("/mypage/review_create")
	   public String review_create(Model model)
	   {
		   return "mypage/review_create";
	   }
	   
	   @GetMapping("/mypage/review_update")
	   public String review_update(Model model)
	   {
		   return "mypage/review_update";
	   }
}
