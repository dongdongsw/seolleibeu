package com.sist.web.review.restcontroller;
import java.util.*;

import org.apache.ibatis.annotations.Update;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
			Double score=rservice.scoreAvg(pno);
			if (score == null) score = 0.0;
			
			Map pageMap=Methods.paginationMap(10, page, totalpage);
			map.putAll(pageMap);
			map.put("list", list);
			map.put("count", count);
			map.put("avg_score", score);
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	// 리뷰 더보기(모달창)
	@GetMapping("/place/place_review_detail_vue/")
	public ReviewVO place_review_detail(@RequestParam("rno") int rno)
	{
		ReviewVO vo=rservice.reviewModalData(rno);
		return vo;
	}
	// 리뷰 작성
	@PostMapping("/review_insert_vue/")
	public ResponseEntity<Map> review_insert_vue(@RequestBody ReviewVO vo,HttpSession session)
	{
		int uno=(int)session.getAttribute("uno");
		Map map=new HashMap();
		try
		{
			vo.setUno(uno);
			rservice.reviewInsert(vo);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	// 리뷰 수정
	@PostMapping("/review_update_vue/")
	public String review_update_vue(@ModelAttribute ReviewVO vo,HttpSession session)
	{
		int uno=(int)session.getAttribute("uno");
		vo.setUno(uno);
		
		int result = rservice.reviewUpdate(vo);
		
	    if(result > 0) {
	        // 수정 성공 시 뒤로 또는 상세 페이지로 이동
	        return "<script>location.href='/mypage/my_review';</script>";
	    } 
	    else 
	    {
	        return "<script>alert('리뷰 수정에 실패했습니다.'); history.back();</script>";
	    }
	}
	// 리뷰 삭제
	@DeleteMapping("/review_delete_vue/")
	public ResponseEntity<Map> review_delete(@RequestParam("rno") int rno,HttpSession session)
	{
		int uno=(int)session.getAttribute("uno");
		Map map=new HashMap();
		try
		{
			ReviewVO vo=new ReviewVO();
			vo.setRno(rno);
			vo.setUno(uno);
			
			rservice.reviewDelete(vo);
			map.put("msg", "yes");
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
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
