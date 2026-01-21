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

import com.sist.web.reserve.mapper.*;
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
	private final OptionsMapper oMapper;
	
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
			ex.printStackTrace();
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
			ex.printStackTrace();
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
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("dates_vue/")
	public ResponseEntity<Map> dates(@RequestParam("pno") int pno) {
		Map map = new HashMap();
		try {
			map.put("list", oMapper.dateList(pno));
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("times_vue/")
	public ResponseEntity<Map> times(@RequestParam("pno") int pno, @RequestParam("opday") String opday) {
		Map rmap = new HashMap();
		try {
			Map map = new HashMap();
			map.put("pno", pno);
			map.put("opday", opday);
			
			rmap.put("list", oMapper.timeList(map));
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(rmap, HttpStatus.OK);
	}
	
	@GetMapping("types_vue/")
	public ResponseEntity<Map> types(@RequestParam("pno") int pno, 
			@RequestParam("opday") String opday, @RequestParam("op_time") String op_time) {
		Map map = new HashMap();
		try {
			map.put("pno", pno);
			map.put("opday", opday);
			map.put("op_time", op_time);
			
			List<PlaceOptionsVO> list = oMapper.typeList(map);
			
			map = new HashMap();
			map.put("list", list);
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@PostMapping("reserve_ok_vue/")
	public ResponseEntity<Map> reserve_ok(@RequestBody ReserveVO vo, HttpSession session) {
		Map map = new HashMap();
		try {
			vo.setUno((int)session.getAttribute("uno"));
			vo.setUserid((String)session.getAttribute("id"));
			vo.setNickname((String)session.getAttribute("name"));
			vo.setPhone((String)session.getAttribute("phone"));
			vo.setEmail((String)session.getAttribute("email"));
			
			int rvno = rvService.createReserve(vo);
			
			if(rvno == -1) {
				map.put("result", "soldout");
			} else {
				map.put("result", "yes");
				map.put("rvno", rvno);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("result_vue/")
	public ResponseEntity<ReserveVO> result(@RequestParam("rvno") int rvno) {
		ReserveVO rsvo = new ReserveVO();
		try {
			rsvo = rvService.reserveResultData(rvno);
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(rsvo, HttpStatus.OK);
	}
}