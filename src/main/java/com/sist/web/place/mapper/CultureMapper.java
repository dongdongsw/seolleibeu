package com.sist.web.place.mapper;

import java.util.*;

import com.sist.web.vo.*;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CultureMapper {
	public List<PlaceVO> cultureListData(Map map);
	public int cultureTotalPage(Map map);
	public PlaceVO cultureDetailData(int pno);
	public void cultureHitIncrement(int pno);
}
