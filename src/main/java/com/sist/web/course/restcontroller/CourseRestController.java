package com.sist.web.course.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.course.service.CourseService;
import com.sist.web.vo.PlaceVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor

@RequestMapping("/course")
public class CourseRestController {

	private final CourseService cService;
	
	@GetMapping("/create/place_list_vue/")
	public ResponseEntity<List<PlaceVO>> create_place_list() {
		
		List<PlaceVO> list=new ArrayList<>();
		
		try {
			list=cService.placeListDataInCourse();
			
		} catch (Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
}
