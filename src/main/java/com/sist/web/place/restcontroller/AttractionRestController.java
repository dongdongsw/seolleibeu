package com.sist.web.place.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.place.service.AttractionService;
import com.sist.web.vo.PlaceVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AttractionRestController {
	private final AttractionService aService;
	
	@GetMapping("/place/attraction_list_vue/")
	public ResponseEntity<Map> attraction_list_vue(@RequestParam("page") int page) {
		Map map = new HashMap();
		try {
			List<PlaceVO> attList = aService.attractionListData((page-1)*16);
			int totalpage = aService.attractionTotalPage();
			
			final int BLOCK = 8;
			int startPage = ((page-1)/BLOCK*BLOCK)+1;
			int endPage = ((page-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalpage) {
				endPage = totalpage;
			}
			
			for(PlaceVO vo : attList) {
				String[] datas = vo.getAddr().split(" ");
				vo.setAddr(datas[0]+" "+datas[1]);
			}
			
			map.put("attList", attList);
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
