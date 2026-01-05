package com.sist.web.place.service;

import java.util.*;

import com.sist.web.vo.*;

public interface AttractionService {
	public List<PlaceVO> attractionListData(int start);
	public int attractionTotalPage();
}
