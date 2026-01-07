package com.sist.web.place.restcontroller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

import com.sist.web.place.service.*;
import com.sist.web.vo.*;
import com.sist.web.commons.*;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/place/culture")
public class CultureRestController {
	private final CultureService cService;
	
	@GetMapping("/list_vue/")
	public ResponseEntity<Map> culture_list_vue(@RequestParam("page") int page, 
												@RequestParam(name = "column", required = false) String column,
												@RequestParam(name = "keyword", required = false) String keyword, 
												@RequestParam(name = "selected", required = false) String selected) {
		Map map = new HashMap();
		try {
			if(keyword != null && keyword.trim().isEmpty()) {
				keyword = null;
				column = null;
			}
			map.put("start", (page-1)*16);
			map.put("column", column);
			map.put("keyword", keyword);
			map.put("selected", selected);
			
			List<PlaceVO> culList = cService.cultureListData(map);
			
			for(PlaceVO vo : culList) {
				String[] datas = vo.getAddr().split(" ");
				vo.setAddr(datas[1]+" "+datas[2]+" "+datas[3]);
			}
			
			int totalpage = cService.cultureTotalPage(map);
			Map pageMap = Methods.paginationMap(8, page, totalpage);
			
			map.put("culList", culList);
			map.putAll(pageMap);
		} catch(Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
}
