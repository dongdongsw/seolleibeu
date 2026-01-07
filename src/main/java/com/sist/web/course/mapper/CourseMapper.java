package com.sist.web.course.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.CourseVO;
import com.sist.web.vo.PlaceVO;

@Mapper
@Repository
public interface CourseMapper {

	public List<PlaceVO> placeListDataInCourse(@Param("type") String type, @Param("keyword") String keyword);
	public void courseInsert(CourseVO vo);
	public List<CourseVO> courseListData(@Param("start") Integer start, @Param("sort") String sort);
	public int courseListTotalPage();
}
