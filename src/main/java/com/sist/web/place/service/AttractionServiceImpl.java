package com.sist.web.place.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sist.web.place.mapper.AttractionMapper;
import com.sist.web.vo.PlaceVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttractionServiceImpl implements AttractionService {
	private final AttractionMapper mapper;

	@Override
	public List<PlaceVO> attractionListData(int start) {
		// TODO Auto-generated method stub
		return mapper.attractionListData(start);
	}

	@Override
	public int attractionTotalPage() {
		// TODO Auto-generated method stub
		return mapper.attractionTotalPage();
	}
}
