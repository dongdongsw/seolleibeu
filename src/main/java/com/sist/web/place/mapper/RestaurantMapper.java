package com.sist.web.place.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface RestaurantMapper {

	public List<Map> restaurantListData(Map map);
	
	public int restaurantTotalPage(String category);
}
