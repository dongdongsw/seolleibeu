package com.sist.web.favorite.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sist.web.favorite.mapper.FavoriteMapper;
import com.sist.web.vo.FavoriteVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FavoriteServiceImpl implements FavoriteService{

	private final FavoriteMapper mapper;

	@Override
	public List<FavoriteVO> favoriteListData(Map map) {
		// TODO Auto-generated method stub
		return mapper.favoriteListData(map);
	}

	@Override
	public int favoriteTotalPage(Map map) {
		// TODO Auto-generated method stub
		return mapper.favoriteTotalPage(map);
	}

	@Override
	public void favoriteInsert(FavoriteVO vo) {
		// TODO Auto-generated method stub
		mapper.favoriteInsert(vo);
	}

	@Override
	public int favoriteDetailCheck(FavoriteVO vo) {
		// TODO Auto-generated method stub
		return mapper.favoriteDetailCheck(vo);
	}

	@Override
	public void favoriteDelete(FavoriteVO vo) {
		// TODO Auto-generated method stub
		mapper.favoriteDelete(vo);
	}

	@Override
	public int favoriteDetailCount(int pno) {
		// TODO Auto-generated method stub
		return mapper.favoriteDetailCount(pno);
	}
	
	
	
}
