package com.sist.web.place.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.place.service.RestaurantService;
import com.sist.web.vo.PlaceVO;
import com.sist.web.commons.Methods;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/place/restaurant")
public class RestaurantRestController {

	private final RestaurantService rService;
	
	@GetMapping("/list_vue/")
	public ResponseEntity<Map> restaurant_list_vue(@RequestParam("page") int page){
		
		
		Map map = new HashMap<>();
		try {
			map.put("start", (page-1)*16);
			
			List<PlaceVO> resList = rService.restaurantListData(map);
			int totalpage = rService.restaurantTotalPage();
			
			Map pageMap = Methods.paginationMap(16, page, totalpage);
			map.putAll(pageMap);
			map.put("resList", resList);
		} catch (Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
}
