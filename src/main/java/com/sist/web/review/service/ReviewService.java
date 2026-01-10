package com.sist.web.review.service;
import java.util.*;
import java.util.Map;
import com.sist.web.vo.*;

public interface ReviewService {
	// 리뷰 리스트
	public List<ReviewVO> reviewListData(Map map);
	// 리뷰 촣 페이지
	public int reviewTotalPage(int pno);
	// 리뷰 갯수
	public int reviewCount(int pno);
}
