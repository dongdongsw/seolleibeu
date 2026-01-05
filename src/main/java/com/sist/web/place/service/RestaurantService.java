package com.sist.web.place.service;

import java.util.List;
import java.util.Map;

public interface RestaurantService {
	public List<Map> restaurantListData(Map map);
	
	public int restaurantTotalPage(String category);
}
