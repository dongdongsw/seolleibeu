package com.sist.web.review.service;
import java.util.*;
import com.sist.web.vo.*;

public interface ReviewService {
	// 리뷰 리스트
	public List<ReviewVO> reviewListData(Map map);
	// 리뷰 내용
	public ReviewVO reviewDetailData(int rno);
	// 리뷰 촣 페이지
	public int reviewTotalPage(int pno);
	// 리뷰 모달창
	public ReviewVO reviewModalData(int rno);
	// 리뷰 갯수
	public int reviewCount(int pno);
	// 리뷰 평균 별점
	public Double scoreAvg(int pno);
	// 작성
	public void reviewInsert(ReviewVO vo);
	// 리뷰 수정
	public ReviewVO reviewUpdateData(int rno);
	public int reviewUpdate(ReviewVO vo);
	// 리뷰 삭제
	public void reviewDelete(ReviewVO vo);
	// 마이페이지 리뷰
	public List<ReviewVO> mypageReviewListData(Map map);
	// 마이페이지 리뷰 총 페이지
	public int mypageReviewTotalPage(int uno);
}
