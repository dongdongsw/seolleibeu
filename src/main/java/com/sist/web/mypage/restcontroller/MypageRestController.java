package com.sist.web.mypage.restcontroller;

import org.springframework.web.bind.annotation.RestController;

import com.sist.web.mypage.service.MypageService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MypageRestController {
	private final MypageService mService;
	
	
}
