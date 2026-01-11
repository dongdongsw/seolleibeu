package com.sist.web.like.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.like.service.LikeService;
import com.sist.web.vo.UserLikeVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class LikeRestController {

	private final LikeService lService;
	
	@GetMapping("/like/detail_vue/")
	public ResponseEntity<Map> like_detail_check_vue(
			@RequestParam("pno") int pno,
			HttpSession session
			){
		
		UserLikeVO vo = new UserLikeVO();
		Map map = new HashMap<>();
		
		Integer uno = (Integer)session.getAttribute("uno");
		
		int likeCount = lService.userLikeCount(pno);
		
		if(uno == null) {
			
			vo.setUno(0);
			
			map.put("likeCount", likeCount);
			map.put("likeCheck", 0);
			map.put("loginTrueFalse", "false");
			
			return ResponseEntity.ok(map);
		}
		else {
			vo.setUno(uno);
		}
		vo.setPno(pno);
		
		int likeCheck = lService.userLikeCheck(vo);
		map.put("likeCheck", likeCheck);
		map.put("likeCount", likeCount);
		map.put("loginTrueFalse", "true");
		
		return ResponseEntity.ok(map);
	}
	
	@PostMapping("/like/push_vue/")
	public ResponseEntity<Void> like_push_vue(@RequestParam("pno") int pno,
			HttpSession session){
		
		
		return ResponseEntity.ok().build();
	}
}
