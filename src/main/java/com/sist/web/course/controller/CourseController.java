package com.sist.web.course.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.sist.web.course.service.CourseService;
import com.sist.web.vo.CourseVO;
import com.sist.web.vo.PlaceVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CourseController {
	
	private final CourseService cService;
	
	// 코스 생성 페이지 이동
	@GetMapping("/course/create")
	public String course_detail() {
		
		return "course/create";
	}
	
	// 코스 수정 페이지 이동
	@GetMapping("/course/update")
	public String course_update() {
			
		return "course/update";
	}

	// 코스 게시판 목록 페이지 이동
	@GetMapping("/course/list")
	public String course_list(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
		
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("main_jsp", "../course/list.jsp");
		return "main/main";
	}
	
	// 코스 게시판 상세보기 페이지 이동
	@GetMapping("/course/detail")
	public String course_detail(@RequestParam("cno") int cno, Model model, HttpSession session) {
		
		CourseVO vo=cService.courseDetailData(cno);
		
		// 비공개 코스일 경우, 본인 제외 접근 차단
		Integer uno=(Integer)session.getAttribute("uno");
		if(vo.getIs_public().equals("N")) {
			if((uno == null || uno != vo.getUno())) {
				throw new ResponseStatusException(HttpStatus.FORBIDDEN, "비공개 코스 입니다."); 
			}
		}
		
		String[] pnos=vo.getPnos().split(",");
		int firstPlace=Integer.parseInt(pnos[0]);
		List<PlaceVO> pList=new ArrayList<>();
		
		for(String pno:pnos) {
			PlaceVO pvo=cService.getPlaceData(Integer.parseInt(pno));
			pList.add(pvo);
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("pList", pList);
		model.addAttribute("firstPlace", firstPlace);
		
		model.addAttribute("main_jsp", "../course/detail.jsp");
		return "main/main";
	}
}