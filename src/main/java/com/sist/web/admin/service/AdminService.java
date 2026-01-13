package com.sist.web.admin.service;

import java.util.List;
import java.util.Map;

import com.sist.web.vo.CourseVO;
import com.sist.web.vo.PlaceOptionsVO;
import com.sist.web.vo.PlaceVO;
import com.sist.web.vo.UsersVO;

public interface AdminService {
	// 문화 리스트
	public List<PlaceVO> cultureListData(Map map);
	public int cultureTotalPage(Map map);
	
	// 식당 리스트
	public List<PlaceVO> foodListData(Map map);
	public int foodTotalPage(Map map);
	
	// 모달창
	public PlaceVO cultureDetailData(int pno);
	public PlaceVO foodDetailData(int pno);
	
	// 사용자 조회
	public List<UsersVO> usersListData(Map map);
	
	// 사용자 총 페이지
	public int usersTotalPage(Map map);
	
	// 코스 리스트
	public List<CourseVO> courseListData(Map map);
	// 코스 총 페이지
	public int courseTotalPage(Map map);
	// 코스 상태 변경
	public void courseStatusUpdate(CourseVO vo);
	
	// 식당 장소 생성
	public void restaurantCreate(PlaceVO vo);

	// 문화체험 장소 생성
	public void cultureCreate(PlaceVO pvo, List<PlaceOptionsVO> opList);
	
	// 관광명소 장소 생성
	public void attractionCreate(PlaceVO vo);
}
