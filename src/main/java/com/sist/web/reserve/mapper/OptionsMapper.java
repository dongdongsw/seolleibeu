package com.sist.web.reserve.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.*;

@Mapper
@Repository
public interface OptionsMapper {
	public List<String> dateList(int pno);
	public List<String> timeList(Map map);
	public List<PlaceOptionsVO> typeList(Map map);
	public int bookedIncrement(Map map);
	public int bookedDecrement(Map map);
}