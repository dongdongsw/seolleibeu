package com.sist.web.course.service;

import java.util.List;

import com.sist.web.vo.*;

public interface CourseService {

	public List<PlaceVO> placeListDataInCourse(String type, String keyword);
	public void courseInsert(CourseVO vo);
}
