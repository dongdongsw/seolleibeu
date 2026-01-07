package com.sist.web.place.service;

import java.util.List;
import java.util.Map;

import com.sist.web.vo.PlaceVO;

public interface RestaurantService {
	public List<PlaceVO> restaurantListData(Map map);
	
	public int restaurantTotalPage(Map map);
	
	public PlaceVO restaurantDetailData(int pno);
}
