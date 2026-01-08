package com.sist.web.place.restcontroller;

import java.util.*;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.place.service.*;
import com.sist.web.vo.*;
import com.sist.web.commons.*;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/place/attraction")
public class AttractionRestController {
	private final AttractionService aService;
	
	@GetMapping("/list_vue/")
	public ResponseEntity<Map> attraction_list_vue(@RequestParam("page") int page,
												   @RequestParam(name = "column", required = false) String column,
												   @RequestParam(name = "keyword", required = false) String keyword, 
												   @RequestParam(name = "selected", required = false) String selected) {
		
		Map map = new HashMap();
		try {
			map.put("start", (page-1)*16);
			map.put("column", column);
			map.put("keyword", keyword);
			map.put("selected", selected);
			
			List<PlaceVO> attList = aService.attractionListData(map);
			
			for(PlaceVO vo : attList) {
				if(vo.getAddr() == null) {
					vo.setAddr("-");
				} else {
					String[] datas = vo.getAddr().split(" ");
					vo.setAddr(datas[1]+" "+datas[2]+" "+datas[3]);
				}
			}
			
			int totalpage = aService.attractionTotalPage(map);
			Map pageMap = Methods.paginationMap(8, page, totalpage);
			map.put("attList", attList);
			map.putAll(pageMap);
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("/detail_vue/")
	public ResponseEntity<PlaceVO> attraction_detail_vue(@RequestParam("pno") int pno) {
		PlaceVO pvo = new PlaceVO();
		try {
			pvo = aService.attractionDetailData(pno);
		} catch(Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(pvo, HttpStatus.OK);
	}
}
