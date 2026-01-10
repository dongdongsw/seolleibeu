package com.sist.web.mypage.restcontroller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.mypage.service.MypageService;
import com.sist.web.vo.UsersVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MypageRestController {
	private final MypageService mService;
	
	@GetMapping("mypage/data_vue/")
	public ResponseEntity<UsersVO> mypage_data(
	  @RequestParam("uno") int uno
	)
	{
		UsersVO vo=new UsersVO();
		try
		{
			vo=mService.mypageData(uno);
		}catch(Exception ex)
		{
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(vo,HttpStatus.OK);
	}
}
