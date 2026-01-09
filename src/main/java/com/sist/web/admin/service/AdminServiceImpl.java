package com.sist.web.admin.service;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;
import java.util.*;

import com.sist.web.admin.mapper.UsersMapper;
import com.sist.web.place.mapper.*;
import com.sist.web.vo.CourseVO;
import com.sist.web.vo.PlaceVO;
import com.sist.web.vo.UsersVO;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	private final PlaceMapper pmapper;
	private final UsersMapper umapper;

	// 문화 리스트
	@Override
	public List<PlaceVO> cultureListData(Map map) {
		// TODO Auto-generated method stub
		return pmapper.cultureListData(map);
	}
	// 문화 총 페이지
	@Override
	public int cultureTotalPage(Map map) {
		// TODO Auto-generated method stub
		return pmapper.cultureTotalPage(map);
	}
	// 식당 리스트
	@Override
	public List<PlaceVO> foodListData(Map map) {
		// TODO Auto-generated method stub
		return pmapper.foodListData(map);
	}
	// 식당 총 페이지
	@Override
	public int foodTotalPage(Map map) {
		// TODO Auto-generated method stub
		return pmapper.foodTotalPage(map);
	}
	// 문화 모달창
	@Override
	public PlaceVO cultureDetailData(int pno) {
		// TODO Auto-generated method stub
		return pmapper.cultureDetailData(pno);
	}
	// 식당 모달창
	@Override
	public PlaceVO foodDetailData(int pno) {
		// TODO Auto-generated method stub
		return pmapper.foodDetailData(pno);
	}
    // 사용자 리스트
	@Override
	public List<UsersVO> usersListData(Map map) {
		// TODO Auto-generated method stub
		return umapper.usersListData(map);
	}
	// 사용자 총 페이지
	@Override
	public int usersTotalPage(Map map) {
		// TODO Auto-generated method stub
		return umapper.usersTotalPage(map);
	}
	// 코스 리스트
	@Override
	public List<CourseVO> courseListData(Map map) {
		// TODO Auto-generated method stub
		return pmapper.courseListData(map);
	}
	// 코스 총 페이지
	@Override
	public int courseTotalPage(Map map) {
		// TODO Auto-generated method stub
		return pmapper.courseTotalPage(map);
	}
}
