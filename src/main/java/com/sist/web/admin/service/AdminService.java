package com.sist.web.admin.service;

import java.util.List;
import java.util.Map;

import com.sist.web.vo.PlaceVO;

public interface AdminService {
	public List<PlaceVO> cultureListData(Map map);
	public int cultureTotalPage(Map map);
}
