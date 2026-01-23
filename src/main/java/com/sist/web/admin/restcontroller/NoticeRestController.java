package com.sist.web.admin.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.sist.web.commons.Methods;
import com.sist.web.notification.service.NotificationService;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.admin.service.NoticeService;
import com.sist.web.vo.NoticeVO;
import com.sist.web.vo.NotificationVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NoticeRestController {
	private final NoticeService nService;
	private final NotificationService noService;
	private final SimpMessagingTemplate template;
	
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
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	@PostMapping("/notice/insert_vue/")
	public ResponseEntity<Map> notice_insert_vue(@RequestBody NoticeVO vo,HttpSession session)
	{
		Map map=new HashMap();
		try
		{
			Integer uno = (Integer) session.getAttribute("uno");
	        vo.setUno(uno);
	        
			nService.noticeInsert(vo);
			map.put("msg", "yes");
			
			// 알림
			Map noMap=new HashMap();
			List<Integer> unoList=noService.selectAllUno();
			String msg="[공지] 설레이브의 새 공지가 있습니다.";
			noMap.put("msg", msg);
			noMap.put("unos", unoList);

			noService.noticeNotiInsert(noMap);
			
			template.convertAndSend(
				"/sub/noti/all",
				msg
			);
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
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
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(vo,HttpStatus.OK);
	}
	
	@PutMapping("/notice/update_vue/")
	public ResponseEntity<Map> notice_update_vue(@RequestBody NoticeVO vo)
	{
		Map map=new HashMap();
		try
		{
			nService.noticeUpdate(vo);
			map.put("msg", "ok");
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	@DeleteMapping("/notice/delete_vue/")
	public ResponseEntity<Map> notice_delete_vue(@RequestParam("n_id") int n_id)
	{
		Map map=new HashMap();
		try
		{
			nService.noticeDelete(n_id);
			map.put("msg", "ok");
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
}
