package com.sist.web.course.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.CourseVO;
import com.sist.web.vo.PlaceVO;

@Mapper
@Repository
public interface CourseMapper {

	public List<PlaceVO> placeListDataInCourse(@Param("type") String type, @Param("keyword") String keyword);
	public void courseInsert(CourseVO vo);
	public List<CourseVO> courseListData(Map map);
	public int courseListTotalPage(String keyword);
	public CourseVO courseDetailData(int cno);
	
	@Update("UPDATE course SET hit=hit+1 "
		   + "WHERE cno = #{cno}")
	public void courseHitIncrement(int cno);
}
