package com.sist.web.course.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<CourseVO> courseListData(Map map) {
		// TODO Auto-generated method stub
		return mapper.courseListData(map);
	}

	@Override
	public int courseListTotalPage(String keyword) {
		// TODO Auto-generated method stub
		return mapper.courseListTotalPage(keyword);
	}

	@Override
	public CourseVO courseDetailData(int cno) {
		// TODO Auto-generated method stub
		mapper.courseHitIncrement(cno);
		return mapper.courseDetailData(cno);
	}

	@Override
	public PlaceVO getPlaceData(int pno) {
		// TODO Auto-generated method stub
		return mapper.getPlaceData(pno);
	}

	@Override
	public int courseGetFirstPlace(int cno) {
		// TODO Auto-generated method stub
		return mapper.courseGetFirstPlace(cno);
	}

	@Override
	public CourseVO courseUpdateData(int cno) {
		// TODO Auto-generated method stub
		return mapper.courseUpdateData(cno);
	}

	@Override
	public void courseUpdate(CourseVO vo) {
		// TODO Auto-generated method stub
		mapper.courseUpdate(vo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void courseDelete(int cno) {
		// TODO Auto-generated method stub
		mapper.courseBookmarkDelete(cno);
		mapper.courseReplyDelete(cno);
		mapper.courseDelete(cno);
	}

	@Override
	public List<CourseVO> myCourseListData(int start, int uno) {
		// TODO Auto-generated method stub
		return mapper.myCourseListData(start, uno);
	}

	@Override
	public int myCourseListTotalPage(int uno) {
		// TODO Auto-generated method stub
		return mapper.myCourseListTotalPage(uno);
	}
}
