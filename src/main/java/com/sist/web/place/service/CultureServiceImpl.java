package com.sist.web.place.service;

import java.util.*;

import org.springframework.stereotype.Service;

import com.sist.web.place.mapper.*;
import com.sist.web.vo.*;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CultureServiceImpl implements CultureService {
	private final CultureMapper mapper;
	private final PlaceMapper pmapper;

	@Override
	public List<PlaceVO> cultureListData(Map map) {
		// TODO Auto-generated method stub
		return mapper.cultureListData(map);
	}

	@Override
	public int cultureTotalPage(Map map) {
		// TODO Auto-generated method stub
		return mapper.cultureTotalPage(map);
	}

	@Override
	public PlaceVO cultureDetailData(int pno) {
		// TODO Auto-generated method stub
		mapper.cultureHitIncrement(pno);
		return mapper.cultureDetailData(pno);
	}
	
	@Override
	public boolean reviewCheck(int pno, int uno) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("pno", pno);
		map.put("uno", uno);
		
		return pmapper.reviewCheck(map) == 1;
	}
}
