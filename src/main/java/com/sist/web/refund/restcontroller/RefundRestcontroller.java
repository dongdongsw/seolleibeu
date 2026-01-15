package com.sist.web.refund.restcontroller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.vo.*;

import jakarta.servlet.http.HttpSession;

import com.sist.web.refund.service.*;
import com.sist.web.commons.*;

@RestController
@RequiredArgsConstructor
public class RefundRestcontroller {
	private final RefundService rservice;
	// 환불 목록
	@GetMapping("/refund_list_vue/")
	public ResponseEntity<Map> refund_list_vue(@RequestParam("page") int page,HttpSession session)
	{
		int uno=(int)session.getAttribute("uno");
		Map map=new HashMap();
		try
		{
			map.put("start", (page-1)*8);
			map.put("uno", uno);
			List<RefundVO> list=rservice.refundListData(map);
			int totalpage=rservice.refundTotalPage(uno);

			Map pageMap=Methods.paginationMap(5, page, totalpage);
			map.putAll(pageMap);
			map.put("list", list);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	// 환불 요청
	@PostMapping("/refund_insert_vue/")
	public ResponseEntity<String> refund_insert_vue(@RequestBody RefundVO vo)
	{
		try
		{
			rservice.refundInsert(vo);
			return new ResponseEntity<>("환불 요청 완료",HttpStatus.OK);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>("환불 요청 실패",HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
