package com.sist.web.mainpage.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.*;

@Mapper
@Repository
public interface MainpageMapper {
	public List<CourseVO> courseBest4();
	public List<CourseVO> courseNew4();
}
