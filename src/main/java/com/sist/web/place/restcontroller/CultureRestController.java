package com.sist.web.place.restcontroller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

import com.sist.web.place.service.*;
import com.sist.web.vo.PlaceVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class CultureRestController {
	private final CultureService cService;
	
	@GetMapping("/place/culture_list_vue/")
	public ResponseEntity<Map> culture_list_vue(@RequestParam("page") int page) {
		Map map = new HashMap();
		try {
			List<PlaceVO> culList = cService.cultureListData((page-1)*16);
			int totalpage = cService.cultureTotalPage();
			
			final int BLOCK = 8;
			int startPage = ((page-1)/BLOCK*BLOCK)+1;
			int endPage = ((page-1)/BLOCK*BLOCK)+BLOCK;
			
			map.put("culList", culList);
			map.put("curpage", page);
			map.put("totalpage", totalpage);
			map.put("startPage", startPage);
			map.put("endPage", endPage);
		} catch(Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
}
