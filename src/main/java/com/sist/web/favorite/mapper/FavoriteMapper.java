package com.sist.web.favorite.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.FavoriteVO;

@Mapper
@Repository
public interface FavoriteMapper {

	public List<FavoriteVO> favoriteListData(Map map);
	
	public int favoriteTotalPage(Map map);
	
}
