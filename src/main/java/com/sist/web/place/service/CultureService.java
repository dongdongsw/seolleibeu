package com.sist.web.place.service;

import java.util.*;

import com.sist.web.vo.*;

public interface CultureService {
	public List<PlaceVO> cultureListData(int start);
	public int cultureTotalPage();
}
