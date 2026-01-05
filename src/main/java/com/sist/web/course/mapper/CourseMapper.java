package com.sist.web.course.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.PlaceVO;

@Mapper
@Repository
public interface CourseMapper {

	@Select("SELECT pno, name, addr, category, thumbnail "
			+ "FROM place")
	public List<PlaceVO> placeListDataInCourse();
	
}
