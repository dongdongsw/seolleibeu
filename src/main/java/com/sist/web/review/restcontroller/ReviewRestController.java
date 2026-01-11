package com.sist.web.review.restcontroller;
import java.util.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.sist.web.vo.*;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import com.sist.web.review.service.*;
import com.sist.web.commons.Methods;

@RestController
@RequiredArgsConstructor
public class ReviewRestController {
	private final ReviewService rservice;
	
	// 리뷰 목록
	@GetMapping("/place/place_review_vue/")
	public ResponseEntity<Map> review_list_vue(@RequestParam("page") int page,@RequestParam("pno") int pno)
	{
		Map map=new HashMap();
		try
		{
			map.put("start", (page-1)*10);
			map.put("pno", pno);
			List<ReviewVO> list=rservice.reviewListData(map);
			int totalpage=rservice.reviewTotalPage(pno);
			int count=rservice.reviewCount(pno);
			
			Map pageMap=Methods.paginationMap(10, page, totalpage);
			map.putAll(pageMap);
			map.put("list", list);
			map.put("count", count);
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	// 리뷰 더보기(모달창)
	
	// 리뷰 작성
	
	// 리뷰 삭제
	
	// 리뷰 수정
	
	// 마이페이지 리뷰 목록
	@GetMapping("/mypage/my_review_vue/")
	public ResponseEntity<Map> mypage_review_list_vue(@RequestParam("page") int page,HttpSession session)
	{
		int uno=(int)session.getAttribute("uno");
		Map map=new HashMap();
		try
		{
			map.put("start", (page-1)*3);
			map.put("uno", uno);
			List<ReviewVO> list=rservice.mypageReviewListData(map);
			int totalpage=rservice.mypageReviewTotalPage(uno);
			
			Map pageMap=Methods.paginationMap(5, page, totalpage);
			map.putAll(pageMap);
			map.put("list", list);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
}
