package com.sist.web.place.mapper;

import java.util.*;

import com.sist.web.vo.*;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AttractionMapper {
	public List<PlaceVO> attractionListData(Map map);
	public int attractionTotalPage(Map map);
	public PlaceVO attractionDetailData(int pno);
	public void attractionHitIncrement(int pno);
}
