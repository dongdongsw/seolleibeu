package com.sist.web.course.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.course.service.CourseService;
import com.sist.web.vo.PlaceVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor

@RequestMapping("/course")
public class CourseRestController {

	private final CourseService cService;
	
	
	// 코스 생성 시, 장소 검색 및 카테고리 선택 후 리스트 출력 데이터
	@GetMapping("/place_list_vue/")
	public ResponseEntity<List<PlaceVO>> place_list_vue(@RequestParam(name = "category", required = false) String category
														, @RequestParam(name = "keyword", required = false) String keyword) {
		
		List<PlaceVO> list=new ArrayList<>();
		
		try {
			list=cService.placeListDataInCourse(category, keyword);
			
		} catch (Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
}
