package com.sist.web.course.service;

import java.util.List;
import java.util.Map;

import com.sist.web.vo.*;

public interface CourseService {

	public List<PlaceVO> placeListDataInCourse(String type, String keyword);
	public void courseInsert(CourseVO vo);
	public List<CourseVO> courseListData(Map map);
	public int courseListTotalPage(String keyword);
	public CourseVO courseDetailData(int cno);
	public PlaceVO getPlaceData(int pno);
	public int courseGetFirstPlace(int cno);
	public CourseVO courseUpdateData(int cno);
	public void courseUpdate(CourseVO vo);
	public void courseDelete(int cno);
}
