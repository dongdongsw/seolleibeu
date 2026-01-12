package com.sist.web.reserve.restcontroller;

import java.util.*;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.reserve.service.*;
import com.sist.web.vo.*;
import com.sist.web.commons.*;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/reserve/")
public class ReserveRestController {
	private final ReserveService rvService;
	
	@GetMapping("myReserved_vue/")
	public ResponseEntity<Map> myReservedList_vue(@RequestParam("page") int page, HttpSession session) {
		Map map = new HashMap();
		try {
			int uno = (int)session.getAttribute("uno");
			
			map.put("start", (page-1)*3);
			map.put("uno", uno);
			
			List<ReserveVO> rvList = rvService.myReservedListData(map);
			int totalpage = rvService.myReservedTotalPage(uno);
			
			Map pageMap = Methods.paginationMap(5, page, totalpage);
			
			map.put("rvList", rvList);
			map.putAll(pageMap);
		} catch(Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("detail_vue/")
	public ResponseEntity<ReserveVO> reservedDetail_vue(@RequestParam("rvno") int rvno) {
		ReserveVO rvvo = new ReserveVO();
		try {
			rvvo = rvService.myReservedDetailData(rvno);
		} catch(Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(rvvo, HttpStatus.OK);
	}
	
	@PostMapping("change_vue/")
	public ResponseEntity<Map> reserveChange_vue(@RequestBody ReserveVO rvvo) {
		Map map = new HashMap();
		String result = "no";
		try {
			rvService.myReservedChangeExposure(rvvo.getRvno());
			result = "yes";
			
			map.put("result", result);
		} catch(Exception ex) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
}
