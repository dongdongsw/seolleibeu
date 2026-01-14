package com.sist.web.mainpage.service;

import java.util.*;

import com.sist.web.vo.*;

public interface MainpageService {
	public List<CourseVO> courseBest4();
	public List<CourseVO> courseNew4();
	
	public PlaceVO placeDataForCookie(int pno);
}
