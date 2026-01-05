package com.sist.web.course.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sist.web.course.mapper.CourseMapper;
import com.sist.web.vo.PlaceVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CourseServiceImpl implements CourseService {

	private final CourseMapper cMapper;

	@Override
	public List<PlaceVO> placeListDataInCourse(String category, String keyword) {
		// TODO Auto-generated method stub
		return cMapper.placeListDataInCourse(category, keyword);
	}

	
}
