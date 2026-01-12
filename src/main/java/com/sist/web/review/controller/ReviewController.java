package com.sist.web.review.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.sist.web.vo.ReviewVO;
import lombok.RequiredArgsConstructor;
import com.sist.web.review.service.*;

@Controller
@RequiredArgsConstructor
public class ReviewController {
	private final ReviewService rservice;
	
	// 리뷰 작성
	@GetMapping("/review_create")
	public String review_create(Model model)
	{
		return "review/review_create";
	}
	// 리뷰 수정
	@GetMapping("/review_update")
	public String review_update(@RequestParam("rno") int rno,Model model)
	{
		ReviewVO vo=rservice.reviewDetailData(rno);
		model.addAttribute("vo", vo);
		return "review/review_update"; 
	}
	// 내가 쓴 리뷰
	@GetMapping("/mypage/my_review")
	public String my_review(Model model)
	{
		model.addAttribute("my_jsp", "../mypage/my_review.jsp");
		return "mypage/my_main";
	}
}
