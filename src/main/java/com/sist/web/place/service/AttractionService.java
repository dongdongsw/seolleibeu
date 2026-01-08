package com.sist.web.place.service;

import java.util.*;

import com.sist.web.vo.*;

public interface AttractionService {
	public List<PlaceVO> attractionListData(Map map);
	public int attractionTotalPage(Map map);
	public PlaceVO attractionDetailData(int pno);
}
