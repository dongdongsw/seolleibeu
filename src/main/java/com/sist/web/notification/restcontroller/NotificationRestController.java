package com.sist.web.notification.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.notification.service.NotificationService;
import com.sist.web.vo.NotificationVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/noti/")
public class NotificationRestController {
	
	private final NotificationService nService;

	// 알림 목록
	@GetMapping("list_vue/")
	public ResponseEntity<List<NotificationVO>> noti_list_vue(HttpSession session) {
		
		int uno=(int)session.getAttribute("uno");
		
		List<NotificationVO> list=new ArrayList<>();
		
		try {
			list=nService.notificationListData(uno);
		}catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	// 알림 읽을 시 읽음 여부 업데이트
	@PutMapping("read_vue/")
	public ResponseEntity<Integer> noti_read_vue(@RequestParam("nono") int nono) {
		
		try {
			nService.notificationRead(nono);
		}catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(1 ,HttpStatus.OK);
	}
	
	// 알림 삭제
	@DeleteMapping("delete_vue/")
	public ResponseEntity<Integer> noti_delete_vue(@RequestParam("nono") int nono) {
		
		try {
			nService.notificationDelete(nono);
		}catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(1 ,HttpStatus.OK);
	}
	
	// 읽지 않은 알림 존재하는지 확인
	@GetMapping("noread_exist_vue/")
	public ResponseEntity<Integer> noti_noread_exist_vue(@RequestParam("uno") int uno) {
		
		int count;
		try {
			count=nService.noReadExist(uno);
		}catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(count ,HttpStatus.OK);
	}
}
