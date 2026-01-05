package com.sist.web.place.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sist.web.place.mapper.CultureMapper;
import com.sist.web.vo.PlaceVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CultureServiceImpl implements CultureService {
	private final CultureMapper mapper;

	@Override
	public List<PlaceVO> cultureListData(int start) {
		// TODO Auto-generated method stub
		return mapper.cultureListData(start);
	}

	@Override
	public int cultureTotalPage() {
		// TODO Auto-generated method stub
		return mapper.cultureTotalPage();
	}
}
