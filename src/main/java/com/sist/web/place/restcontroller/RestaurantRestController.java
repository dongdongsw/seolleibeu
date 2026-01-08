package com.sist.web.place.restcontroller;

import java.util.ArrayList;
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
	public ResponseEntity<Map> restaurant_list_vue(
			@RequestParam("page") int page,
			@RequestParam("radio") String radio,
			@RequestParam("array") String array,
			@RequestParam("keyword") String keyword
			){
		
		
		Map map = new HashMap<>();
		try {
			map.put("start", (page-1)*16);
			map.put("radio", radio);
			map.put("array", array);
			map.put("keyword", keyword);
			
			List<PlaceVO> resList = rService.restaurantListData(map);
			int totalpage = rService.restaurantTotalPage(map);
			
			for(PlaceVO vo : resList) {
				String[] addr = vo.getAddr().split(" ");
				vo.setAddr(addr[1] + " " + addr[2] + " " + addr[3]);
			}
			
			Map pageMap = Methods.paginationMap(8, page, totalpage);
			
			map.putAll(pageMap);
			map.put("resList", resList);
			
		} catch (Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("/detail_vue/")
	public ResponseEntity<PlaceVO> restaurant_detail_vue(@RequestParam("pno") int pno){
		
		PlaceVO pvo = null;
		try {
			
			pvo = rService.restaurantDetailData(pno);
			
			if(pvo.getMenu() != null) {
				
				List<Map> menuList = new ArrayList<>();
				String[] menus = pvo.getMenu().split("\\|");
				
				for(String items : menus) {
					String[] item = items.split(":");
					Map map = new HashMap<>();
					map.put("name", item[0].trim());
					map.put("price", item[1].trim());
					menuList.add(map);
				}
				pvo.setMenuList(menuList);
			}
			
			if(pvo.getImgs() != null) {
				List<Map> imgList = new ArrayList<>();
				String[] imgs = pvo.getImgs().split("\\|");
				
				for(String img : imgs) {
					Map map = new HashMap<>();
					map.put("img", img);
					imgList.add(map);
				}
				pvo.setImgList(imgList);
			}
			
		
			
			
		} catch (Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(pvo, HttpStatus.OK);
	}
}
