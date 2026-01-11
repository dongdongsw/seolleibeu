package com.sist.web.like.service;


import com.sist.web.vo.UserLikeVO;

public interface LikeService {

	public int userLikeCheck(UserLikeVO vo);
	
	public void userLikeInsert(UserLikeVO vo);
	
	public void userLikeDelete(UserLikeVO vo);
	
	public int userLikeCount(int pno);
}
