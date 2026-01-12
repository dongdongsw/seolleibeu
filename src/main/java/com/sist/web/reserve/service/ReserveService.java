package com.sist.web.reserve.service;

import java.util.*;

import com.sist.web.vo.*;

public interface ReserveService {
	public List<ReserveVO> myReservedListData(Map map);
	public int myReservedTotalPage(int uno);
	public ReserveVO myReservedDetailData(int rvno);
	public void myReservedChangeExposure(int rvno);
}
