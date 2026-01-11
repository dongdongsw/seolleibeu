package com.sist.web.favorite.service;

import java.util.List;
import java.util.Map;

import com.sist.web.vo.FavoriteVO;

public interface FavoriteService {

public List<FavoriteVO> favoriteListData(Map map);
	
	public int favoriteTotalPage(Map map);
	
	public void favoriteInsert(FavoriteVO vo);
	
	public int favoriteDetailCheck(FavoriteVO vo);
	public int favoriteDetailCount(int pno);
	
	public void favoriteDelete(FavoriteVO vo);
}
