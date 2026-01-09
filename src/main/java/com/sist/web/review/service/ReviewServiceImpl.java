package com.sist.web.review.service;
import java.util.*;
import org.springframework.stereotype.Service;
import com.sist.web.vo.*;
import lombok.RequiredArgsConstructor;
import com.sist.web.review.mapper.ReviewMapper;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	private final ReviewMapper rmapper;

	// 리뷰 리스트
	@Override
	public List<ReviewVO> reviewListData(Map map) {
		// TODO Auto-generated method stub
		return rmapper.reviewListData(map);
	}
	
	// 리뷰 촣 페이지
	@Override
	public int reviewTotalPage(int pno) {
		// TODO Auto-generated method stub
		return rmapper.reviewTotalPage(pno);
	}
	
}
