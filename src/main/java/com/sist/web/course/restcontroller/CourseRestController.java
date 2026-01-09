package com.sist.web.course.restcontroller;

import java.util.ArrayList;

import java.util.*;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.commons.Methods;
import com.sist.web.course.service.CourseService;
import com.sist.web.vo.CourseVO;
import com.sist.web.vo.PlaceVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor

@RequestMapping("/course/")
public class CourseRestController {

	private final CourseService cService;
	
	
	// 코스 생성 시, 장소 검색 및 카테고리 선택 후 리스트 출력 데이터
	@GetMapping("place_list_vue/")
	public ResponseEntity<List<PlaceVO>> place_list_vue(@RequestParam(name = "type", required = false) String type
														, @RequestParam(name = "keyword", required = false) String keyword) {
		
		List<PlaceVO> list=new ArrayList<>();
		
		try {
			list=cService.placeListDataInCourse(type, keyword);
			
		} catch (Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 코스 생성
	@PostMapping("insert_vue/")
	public ResponseEntity<Map> course_insert_vue(@RequestBody CourseVO vo) {
		Map map=new HashMap();
		try {
			cService.courseInsert(vo);
			map.put("msg", "yes");
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	// 코스 게시판 리스트
	@GetMapping("list_vue/")
	public ResponseEntity<Map> course_list_vue(@RequestParam("page") int page, @RequestParam("sort") String sort, 
												@RequestParam(name = "keyword", required = false) String keyword) {
		Map map=new HashMap();
		try {
			Map cMap=new HashMap();
			cMap.put("keyword", keyword);
			cMap.put("sort", sort);
			cMap.put("start", (page-1)*5);
			
			List<CourseVO> list=cService.courseListData(cMap);
			int totalpage=cService.courseListTotalPage(keyword);
			
			Map pageMap=Methods.paginationMap(5, page, totalpage);
			
			map.putAll(pageMap);
			map.put("list", list);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map, HttpStatus.OK);
	} 
	
	
	@GetMapping("place_vue/")
	public ResponseEntity<PlaceVO> place_vue(@RequestParam("pno") int pno) {
		
		PlaceVO vo=new PlaceVO();
		try {
			vo=cService.getPlaceData(pno);
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@GetMapping("first_place_vue/")
	public ResponseEntity<Integer> first_place_vue(@RequestParam("cno") int cno) {
		
		int pno=0;
		try {
			pno=cService.courseGetFirstPlace(cno);
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(pno, HttpStatus.OK);
	}
	
	// 코스 수정 시 코스 데이터 가져오기
	@GetMapping("course_vue/") 
	public ResponseEntity<CourseVO> course_vue(@RequestParam("cno") int cno) {
		
		CourseVO vo=new CourseVO();
		try {
			vo=cService.courseDetailData(cno);
			
			String pnos=vo.getPnos();
			String[] pnoList=pnos.split(",");
			List<Integer> pnosList=new ArrayList<>();
			
			for (String pno:pnoList) {
				pnosList.add(Integer.parseInt(pno));
			}
			
			vo.setPnosList(pnosList);
			
		} catch (Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
}
