package com.sist.web.mainpage.service;

import org.springframework.stereotype.Service;

import java.util.*;

import com.sist.web.vo.*;
import com.sist.web.mainpage.mapper.*;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainpageServiceImpl implements MainpageService {
	private final MainpageMapper mapper;

	@Override
	public List<CourseVO> courseBest4() {
		// TODO Auto-generated method stub
		return mapper.courseBest4();
	}

	@Override
	public List<CourseVO> courseNew4() {
		// TODO Auto-generated method stub
		return mapper.courseNew4();
	}

	@Override
	public PlaceVO placeDataForCookie(int pno) {
		// TODO Auto-generated method stub
		return mapper.placeDataForCookie(pno);
	}
}
