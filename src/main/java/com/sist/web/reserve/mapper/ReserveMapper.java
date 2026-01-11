package com.sist.web.reserve.mapper;

import java.util.*;

import com.sist.web.vo.*;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ReserveMapper {
	public List<ReserveVO> myReservedListData(Map map);
	public int myReservedTotalPage(int uno);
	public ReserveVO myReservedDetailData(int rvno);
}
