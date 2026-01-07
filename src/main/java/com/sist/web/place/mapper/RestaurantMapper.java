package com.sist.web.place.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.PlaceVO;

@Mapper
@Repository
public interface RestaurantMapper {

	public List<PlaceVO> restaurantListData(Map map);
	
	public int restaurantTotalPage(Map map);
	
	public PlaceVO restaurantDetailData(int pno);
	
	@Update("UPDATE place SET "
			+ "hit = hit + 1 "
			+ "WHERE pno = #{pno}")
	public int restaurantHitIncrement(int pno);
}
