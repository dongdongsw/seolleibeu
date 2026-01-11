package com.sist.web.like.service;

import org.springframework.stereotype.Service;

import com.sist.web.like.mapper.LikeMapper;
import com.sist.web.vo.UserLikeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LikeServiceImpl implements LikeService{

	private final LikeMapper mapper;

	@Override
	public int userLikeCheck(UserLikeVO vo) {
		// TODO Auto-generated method stub
		return mapper.userLikeCheck(vo);
	}

	@Override
	public void userLikeInsert(UserLikeVO vo) {
		// TODO Auto-generated method stub
		mapper.userLikeInsert(vo);
	}

	@Override
	public void userLikeDelete(UserLikeVO vo) {
		// TODO Auto-generated method stub
		mapper.userLikeDelete(vo);
	}

	@Override
	public int userLikeCount(int pno) {
		// TODO Auto-generated method stub
		return mapper.userLikeCount(pno);
	}
}
