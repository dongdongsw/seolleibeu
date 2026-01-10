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
	// 리뷰 갯수
	@Override
	public int reviewCount(int pno) {
		// TODO Auto-generated method stub
		return rmapper.reviewCount(pno);
	}
	// 리뷰 작성
	@Override
	public void reviewInsert(ReviewVO vo) {
		// TODO Auto-generated method stub
		rmapper.reviewInsert(vo);
	}
	// 리뷰 수정
	@Override
	public void reviewUpdate(ReviewVO vo) {
		// TODO Auto-generated method stub
		rmapper.reviewUpdate(vo);
	}
	// 리뷰 삭제
	@Override
	public void reviewDelete(int pno) {
		// TODO Auto-generated method stub
		rmapper.reviewDelete(pno);
	}
	
}
