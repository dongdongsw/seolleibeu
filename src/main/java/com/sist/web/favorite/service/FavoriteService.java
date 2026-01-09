package com.sist.web.favorite.service;

import java.util.List;
import java.util.Map;

import com.sist.web.vo.FavoriteVO;

public interface FavoriteService {

public List<FavoriteVO> favoriteListData(Map map);
	
	public int favoriteTotalPage(Map map);
}
