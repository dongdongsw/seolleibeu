package com.sist.web.place.service;

import java.util.*;

import com.sist.web.vo.*;

public interface CultureService {
	public List<PlaceVO> cultureListData(Map map);
	public int cultureTotalPage(Map map);
	public PlaceVO cultureDetailData(int pno);
}
