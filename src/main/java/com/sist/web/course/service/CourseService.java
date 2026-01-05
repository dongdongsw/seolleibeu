package com.sist.web.course.service;

import java.util.List;

import com.sist.web.vo.PlaceVO;

public interface CourseService {

	public List<PlaceVO> placeListDataInCourse(String category, String keyword);
}
