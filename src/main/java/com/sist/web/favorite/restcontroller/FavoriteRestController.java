package com.sist.web.favorite.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.commons.Methods;
import com.sist.web.favorite.service.FavoriteService;
import com.sist.web.vo.FavoriteVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class FavoriteRestController {

	private final FavoriteService fService;
	
	@GetMapping("/mypage/favorite/list_vue/")
	public ResponseEntity<Map> mypage_favorite_list(@RequestParam("page") String page){
		
		Map map = new HashMap<>();
		int curpage = Integer.parseInt(page);
		try {
			
			map.put("start", (curpage-1)*5);
			
			List<FavoriteVO> fList = fService.favoriteListData(map);
			int totalpage = fService.favoriteTotalPage(map);
			
			Map pageMap = Methods.paginationMap(5, curpage, totalpage);
			
			map.putAll(pageMap);
			map.put("fList", fList);
			
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
		return new ResponseEntity<>(null, HttpStatus.OK);
	}
}
