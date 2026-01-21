package com.sist.web.place.service;

import java.util.*;

import org.springframework.stereotype.Service;

import com.sist.web.place.mapper.*;
import com.sist.web.vo.*;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttractionServiceImpl implements AttractionService {
	private final AttractionMapper mapper;

	@Override
	public List<PlaceVO> attractionListData(Map map) {
		// TODO Auto-generated method stub
		return mapper.attractionListData(map);
	}

	@Override
	public int attractionTotalPage(Map map) {
		// TODO Auto-generated method stub
		return mapper.attractionTotalPage(map);
	}

	@Override
	public PlaceVO attractionDetailData(int pno) {
		// TODO Auto-generated method stub
        mapper.attractionHitIncrement(pno);
        return mapper.attractionDetailData(pno);
	}

}
