package com.sist.web.mypage.service;

import org.springframework.stereotype.Service;

import com.sist.web.mypage.mapper.MypageMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService{
	private final MypageMapper mMapper;
	
	
}
