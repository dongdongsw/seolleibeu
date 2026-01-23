package com.sist.web.refund.restcontroller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
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
import com.sist.web.notification.service.NotificationService;

@RestController
@RequiredArgsConstructor
public class RefundRestcontroller {
	private final RefundService rservice;
	private final NotificationService nService;
	private final SimpMessagingTemplate template;
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
	// 관리자 환불 목록
	@GetMapping("/admin/refund_list_vue/")
	public ResponseEntity<Map> admin_refund_list(@RequestParam("page") int page,@RequestParam(name="name",required = false) String name)
	{
		Map map=new HashMap();
		try
		{
			map.put("start", (page-1)*8);
			map.put("name", name);
			List<RefundVO> list=rservice.adminRefundListData(map);
			int totalpage=rservice.adminRefundTotalPage();

			Map pageMap=Methods.paginationMap(8, page, totalpage);
			map.putAll(pageMap);
			map.put("list", list);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	// 관리자 환불 승인 / 취소
	@PostMapping("/admin/refund_update_vue/")
	public ResponseEntity<Map> refund_update_vue(@RequestBody RefundVO vo)
	{
		Map map=new HashMap();
		try
		{
			map.put("rf_id", vo.getRf_id());
			map.put("rf_status", vo.getRf_status());
			rservice.refundUpdate(map);
			map.put("result", "success");
			
			// 알림
			String msg="";
			if ("환불 실패".equals(vo.getRf_status())) {
			    msg="[예매] 환불에 실패했습니다.";
			} else  {
			    msg="[예매] 환불 요청이 승인되었습니다.";
			}
			
			NotificationVO nvo=new NotificationVO();
			nvo.setUno(vo.getUno());
			nvo.setTarget_id(vo.getRf_id());
			nvo.setTarget_type("refund");
			nvo.setMsg(msg);
			nService.NotificationInsert(nvo);
				
			template.convertAndSend(
				"/sub/noti/"+vo.getUno(),
				msg
			);

		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
}
