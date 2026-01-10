package com.sist.web.mypage.service;

import org.springframework.stereotype.Service;

import com.sist.web.mypage.mapper.MypageMapper;
import com.sist.web.vo.UsersVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService{
	private final MypageMapper mMapper;

	@Override
	public UsersVO mypageData(int uno) {
		return mMapper.mypageData(uno);
	}
}
