package com.sist.web.place.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sist.web.place.mapper.RestaurantMapper;
import com.sist.web.vo.PlaceVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RestaurantServiceImpl implements RestaurantService{
	
	private final RestaurantMapper mapper;

	@Override
	public List<PlaceVO> restaurantListData(Map map) {
		// TODO Auto-generated method stub
		return mapper.restaurantListData(map);
	}

	@Override
	public int restaurantTotalPage(String category) {
		// TODO Auto-generated method stub
		return mapper.restaurantTotalPage(category);
	}
	
	
}
