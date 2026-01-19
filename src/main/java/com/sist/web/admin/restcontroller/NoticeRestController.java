package com.sist.web.admin.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.sist.web.commons.Methods;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.admin.service.NoticeService;
import com.sist.web.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NoticeRestController {
	private final NoticeService nService;
	
	@GetMapping("/notice/list_vue/")
	public ResponseEntity<Map> notice_list_vue(@RequestParam("page") int page)
	{
		Map map=new HashMap();
		try
		{
			List<NoticeVO> list=nService.noticeListData((page-1)*10);
			int totalpage=nService.noticeTotalPage();
			
			Map pageMap=Methods.paginationMap(10, page, totalpage);
		   	   
			map.putAll(pageMap);
			   
			map.put("list", list);
			
		}catch(Exception ex)
		{
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	@PostMapping("/notice/insert_vue/")
	public ResponseEntity<Map> notice_insert_vue(@RequestBody NoticeVO vo)
	{
		Map map=new HashMap();
		try
		{
			nService.noticeInsert(vo);
			map.put("msg", "yes");
		}catch(Exception ex)
		{
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	@GetMapping("/notice/detail_vue/")
	public ResponseEntity<NoticeVO> notice_detail_vue(@RequestParam("n_id") int n_id)
	{
		NoticeVO vo=new NoticeVO();
		try
		{
			vo=nService.noticeDetailData(n_id);
		}catch(Exception ex)
		{
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(vo,HttpStatus.OK);
	}
	
	
}
