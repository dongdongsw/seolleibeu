package com.sist.web.course.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sist.web.course.mapper.CourseMapper;
import com.sist.web.vo.CourseVO;
import com.sist.web.vo.PlaceVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CourseServiceImpl implements CourseService {

	private final CourseMapper mapper;

	@Override
	public List<PlaceVO> placeListDataInCourse(String type, String keyword) {
		// TODO Auto-generated method stub
		return mapper.placeListDataInCourse(type, keyword);
	}

	@Override
	public void courseInsert(CourseVO vo) {
		// TODO Auto-generated method stub
		mapper.courseInsert(vo);
	}

	@Override
	public List<CourseVO> courseListData(int start, String sort) {
		// TODO Auto-generated method stub
		return mapper.courseListData(start, sort);
	}

	@Override
	public int courseListTotalPage() {
		// TODO Auto-generated method stub
		return mapper.courseListTotalPage();
	}

	
}
