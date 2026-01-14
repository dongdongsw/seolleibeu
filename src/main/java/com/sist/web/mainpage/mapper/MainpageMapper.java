package com.sist.web.mainpage.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.*;

@Mapper
@Repository
public interface MainpageMapper {
	public List<CourseVO> courseBest4();
	public List<CourseVO> courseNew4();
	
	// 최근 본 장소 (쿠키)
	@Select("SELECT pno, name, category, type, thumbnail FROM place "
			+ "WHERE pno=#{pno}")
	public PlaceVO placeDataForCookie(int pno);
}
